<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Ride;

class RidesController extends Controller
{
	public $show_action = false;
	public $view_col = 'status';
	public $k = 1;
	public $listing_colss = ['Status',  'Driver Name', 'Date And Time', 'Client First Name', 'Client Last Name', 'Client Email',  'Client Phone','S.No.'];
	public $listing_cols = ['status'];
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Rides', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Rides', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Rides.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(Request $request)
	{
		$module = Module::get('Rides');
		
		if(Module::hasAccess($module->id)) {

			$drivers = DB::table('users')->select('users_id','first_name','last_name')->whereNull('id')->where('status','Approved')->groupBy('first_name')->get();		
			$passengers = DB::table('client_details')->select('client_first_name','client_last_name','client_id')->groupBy('client_first_name')->whereNotNull('client_first_name')->orderBy('client_first_name', 'asc')->get();		
	    $rideDatass='';

			return View('la.rides.index', [
				'show_actions' => $this->show_action,
				'listing_colss' => $this->listing_colss,
				'drivers'=>$drivers,
				'passengers'=>$passengers,
				'rideDatass'=>$rideDatass,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new ride.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created ride in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{   
		if(Module::hasAccess("Rides", "create")) {
				
			$data=$request->all();
      
      $module = Module::get('Rides');

			$drivers = DB::table('users')->select('users_id','first_name','last_name')->whereNull('id')->where('status','Approved')->groupBy('first_name')->get();		
			$passengers = DB::table('client_details')->select('client_first_name','client_last_name','client_id')->groupBy('client_first_name')->whereNotNull('client_first_name')->orderBy('client_first_name', 'asc')->get();		

    DB::enableQueryLog();
		$values = DB::table('booking_time_slot')
    ->rightJoin('client_details', 'client_details.client_id', '=', 'booking_time_slot.client_id')
    ->rightJoin('payments', 'payments.book_id', '=', 'booking_time_slot.book_id')
    ->leftJoin('appointments', 'booking_time_slot.book_id', '=', 'appointments.rides_id')
    ->leftJoin('users', 'users.users_id', '=', 'booking_time_slot.driver_id')  
	  ->select('appointments.rides_status','users.first_name','booking_time_slot.date_time_slot','client_details.client_first_name', 'client_details.client_last_name','client_details.client_email','client_details.client_phone','booking_time_slot.book_id','users.last_name');

	 if(!empty($data['start_date']) && !empty($data['end_date'])){
     $values =	$values->whereBetween('booking_time_slot.date_time_slot', [date('Y-m-d',strtotime(str_replace('/','-',$data['start_date']))).' 00:00:00', date('Y-m-d',strtotime(str_replace('/','-',$data['end_date']))).' 23:59:59']);
    }

    if(!empty($data['driver_filter'])){
     $values =	$values->where('booking_time_slot.driver_id', $data['driver_filter']);
    }

    if(!empty($data['passenger_filter'])){

     $values =	$values->where(DB::raw("CONCAT(client_details.client_first_name,' ',client_details.client_last_name)"), 'LIKE', "%".$data['passenger_filter']."%");
    }

    if(!empty($data['status_filter'])){
    	if($data['status_filter'] == 'Cancel'){
       $values =	$values->where('appointments.rides_status', 'cancel');
    	}elseif($data['status_filter'] == 'Completed'){
       $values =	$values->where('appointments.rides_status', 'completed');
    	}
    }

  $rideDatas = $values->groupBy('booking_time_slot.date_time_slot')->orderBy('booking_time_slot.date_time_slot','ASC')->get();

  $rideDatass='ride';
			return View('la.rides.index', [
				'show_actions' => $this->show_action,
				'listing_colss' => $this->listing_colss,
				'drivers'=>$drivers,	
				'end_date'=>$data['end_date'],
				'start_date'=>$data['start_date'],
				'driver_filter'=>$data['driver_filter'],
				'passenger_filter'=>$data['passenger_filter'],
				'status_filter'=>$data['status_filter'],				
				'rideDatas'=>$rideDatas,
				'rideDatass'=>$rideDatass,
				'passengers'=>$passengers,
				'module' => $module
			]);
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
 
 
	/**
	 * Display the specified ride.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Rides", "view")) {
			
			$ride = Ride::find($id);
			if(isset($ride->id)) {
				$module = Module::get('Rides');
				$module->row = $ride;
				
				return view('la.rides.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('ride', $ride);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("ride"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified ride.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Rides", "edit")) {			
			$ride = Ride::find($id);
			if(isset($ride->id)) {	
				$module = Module::get('Rides');
				
				$module->row = $ride;
				
				return view('la.rides.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('ride', $ride);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("ride"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified ride in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Rides", "edit")) {
			
			$rules = Module::validateRules("Rides", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Rides", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.rides.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified ride from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Rides", "delete")) {
			Ride::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.rides.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
	
	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{		

		$values = DB::table('booking_time_slot')
    ->rightJoin('client_details', 'client_details.client_id', '=', 'booking_time_slot.client_id')
    ->rightJoin('payments', 'payments.book_id', '=', 'booking_time_slot.book_id')
    ->leftJoin('appointments', 'booking_time_slot.book_id', '=', 'appointments.rides_id')
    ->leftJoin('users', 'users.users_id', '=', 'booking_time_slot.driver_id')
    ->select('appointments.rides_status','users.first_name','booking_time_slot.date_time_slot','client_details.client_first_name', 'client_details.client_last_name','client_details.client_email','client_details.client_phone','booking_time_slot.book_id','users.last_name','client_details.driver_id')->groupBy('booking_time_slot.date_time_slot')->orderBy('booking_time_slot.date_time_slot','DESC');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

	
    for($i=0; $i < count($data->data); $i++) {
    	for ($j=0; $j < count($this->listing_colss); $j++) { 
        $col = $this->listing_colss[$j];
        if($col == 'Status'){        	
        	if(empty($data->data[$i][$j])){
             $data->data[$i][$j] = '<span class="label label-success">Pending</span>';
        	}else if(!empty($data->data[$i][$j]) && $data->data[$i][$j] == 'cancel'){
             $data->data[$i][$j] = '<span class="label label-warning">Cancel</span>';
        	}else if(!empty($data->data[$i][$j]) && $data->data[$i][$j] == 'completed'){
             $data->data[$i][$j] = '<span class="label label-warning">Completed</span>';
        	}        	
        }
         if($col == 'Driver Name'){  	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] =  $data->data[$i][$j] .' '.$data->data[$i][8] ;
        	}      	
        }

          if($col == 'Date And Time'){        	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] = date('l, F d, Y (H:i)',strtotime($data->data[$i][$j]));
        	}      	
        }        

         if($col == 'S.No.'){  	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] =  $this->k++;
        	}      	
        }
    	}
    }
		/*$fields_popup = ModuleFields::getModuleFields('Rides');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/rides/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Rides", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/rides/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Rides", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.rides.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}*/
		$out->setData($data);
		return $out;
	}
}
