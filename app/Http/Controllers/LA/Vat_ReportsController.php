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

use App\Models\Vat_Report;

class Vat_ReportsController extends Controller
{
	public $show_action = false;
	public $view_col = 'vat';
	public $listing_cols = ['vat'];
	public $k = 1;
	public $listing_colss = ['Select All',  'Client First Name','Client Last Name','Amount',  'Vat', 'Vat Price','Vat Status'];
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Vat_Reports', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Vat_Reports', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Vat_Reports.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Vat_Reports');
		
		if(Module::hasAccess($module->id)) {

			$drivers = DB::table('users')->select('users_id','first_name','last_name')->whereNull('id')->where('status','Approved')->groupBy('first_name')->get();						
			$passengers = DB::table('client_details')->select('client_first_name','client_last_name','client_id')->groupBy('client_first_name')->whereNotNull('client_first_name')->orderBy('client_first_name', 'asc')->get();		
	    $rideDatass='';
      $vat_status ='';

			return View('la.vat_reports.index', [
				'show_actions' => $this->show_action,
				'listing_colss' => $this->listing_colss,
				'drivers'=>$drivers,
				'passengers'=>$passengers,
				'rideDatass'=>$rideDatass,
				'vat_status '=>$vat_status ,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new vat_report.
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
		if(Module::hasAccess("Vat_Reports", "create")) {
				
			$data=$request->all();

      if(!empty($data['payments'])){
      	foreach($data['payments'] as $payment_id){
      		 DB::table('payments')
            ->where('payment_id', $payment_id)
            ->update(['vat_status' => 1]);
      	}
      }
    $module = Module::get('Vat_Reports');

		$drivers = DB::table('users')->select('users_id','first_name','last_name')->whereNull('id')->where('status','Approved')->groupBy('first_name')->get();		
		$passengers = DB::table('client_details')->select('client_first_name','client_last_name','client_id')->groupBy('client_first_name')->whereNotNull('client_first_name')->orderBy('client_first_name', 'asc')->get();		

    DB::enableQueryLog();
		$values = DB::table('payments')->select(['payment_id', 'first_name', 'last_name', 'paid_amount','vat','client_id','vat_status'])->whereNull('deleted_at');

	 if(!empty($data['start_date']) && !empty($data['end_date'])){
     $values =	$values->whereBetween('created_at', [date('Y-m-d',strtotime(str_replace('/','-',$data['start_date']))).' 00:00:00', date('Y-m-d',strtotime(str_replace('/','-',$data['end_date']))).' 23:59:59']);
    }

   /* if(!empty($data['driver_filter'])){
     $values =	$values->where('booking_time_slot.driver_id', $data['driver_filter']);
    }*/

    if(!empty($data['passenger_filter'])){
     $values =	$values->where(DB::raw("CONCAT(first_name,' ',last_name)"), 'LIKE', "%".$data['passenger_filter']."%");
    }

   if($data['vat_status'] !='' && $data['vat_status'] == 0){
     $values =	$values->where('vat_status', 0);
    }
   if($data['vat_status'] !='' && $data['vat_status'] == 1){
     $values =	$values->where('vat_status', $data['vat_status']);
    }

  $rideDatas = $values->groupBy('created_at')->orderBy('created_at','ASC')->get();
 
  $rideDatass='ride';
			return View('la.vat_reports.index', [
				'show_actions' => $this->show_action,
				'listing_colss' => $this->listing_colss,
				'drivers'=>$drivers,	
				'end_date'=>$data['end_date'],
				'start_date'=>$data['start_date'],
				'passenger_filter'=>$data['passenger_filter'],
				'vat_status'=>$data['vat_status'],								
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
	 * Display the specified vat_report.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Vat_Reports", "view")) {
			
			$vat_report = Vat_Report::find($id);
			if(isset($vat_report->id)) {
				$module = Module::get('Vat_Reports');
				$module->row = $vat_report;
				
				return view('la.vat_reports.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('vat_report', $vat_report);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("vat_report"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified vat_report.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Vat_Reports", "edit")) {			
			$vat_report = Vat_Report::find($id);
			if(isset($vat_report->id)) {	
				$module = Module::get('Vat_Reports');
				
				$module->row = $vat_report;
				
				return view('la.vat_reports.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('vat_report', $vat_report);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("vat_report"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified vat_report in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Vat_Reports", "edit")) {
			
			$rules = Module::validateRules("Vat_Reports", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Vat_Reports", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.vat_reports.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified vat_report from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Vat_Reports", "delete")) {
			Vat_Report::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.vat_reports.index');
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
		
		$values = DB::table('payments')->select(['payment_id', 'first_name', 'last_name', 'paid_amount','vat','client_id','vat_status'])->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

    for($i=0; $i < count($data->data); $i++) {
    	for ($j=0; $j < count($this->listing_colss); $j++) { 
        $col = $this->listing_colss[$j];
        if($col == 'Select All'){ 
        	if($data->data[$i][6] == 0) {
        	   $amt=round(str_replace('£ ','',$data->data[$i][3]) * str_replace(' %','',$data->data[$i][4])/100,2);
             $data->data[$i][$j] = '<input type="checkbox" class="checkboxSelected" value="'.$data->data[$i][0].'" name="payments[]" onClick="checkboxPayment()" data-amount="'.$amt.'">';  
           } else{
           	 $data->data[$i][$j] ='';
           }          	
        }


     /*     if($col == 'Driver Earning'){        	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] ='£ '.\Dwij\Laraadmin\Helpers\LAHelper::earningAmount($data->data[$i][3],$data->data[$i][$j]);
        	}      	
        }        
           */
         if($col == 'Vat'){        	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] = $data->data[$i][$j].' %';
        	}      	
        } 
   
        if($col == 'Amount'){        	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] ='£ '.$data->data[$i][$j];
        	}      	
        } 
      
    
         if($col == 'Vat Price'){        	
        	if(!empty($data->data[$i][$j])){
             $data->data[$i][$j] = '£ '.round(str_replace('£ ','',$data->data[$i][3]) * str_replace(' %','',$data->data[$i][4])/100,2);
        	}      	
        } 
         if($col == 'Vat Status'){  
        		 if($data->data[$i][$j] == 0){        		
               $data->data[$i][$j] =  '<span class="label label-danger">Unpaid</span>';
        		 }else{
               $data->data[$i][$j] =  '<span class="label label-success">Paid</span>';       	           
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
