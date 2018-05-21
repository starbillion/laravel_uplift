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


use App\Models\Driver;
use App\Models\Availability;
use App\Models\Rate;
use App\Models\Category;
use App\Models\Modeln;

class DriversController extends Controller
{
	public $show_action = true;
	public $view_col = 'id';
	public $listing_cols = ['id', 'first_name','last_name', 'email', 'country','mobile_number',"status"];

	public $listing_colss = ['id', 'first_name', 'last_name', 'email', 'country','mobile_number','status','encrypt_user_id'];

	public $ride_listing_cols = ['Status', 'Date And Time', 'Name', 'Email',  'Phone','S.No.'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Drivers', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Drivers', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Drivers.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Drivers');
		$categories = Category::get();

		if(Module::hasAccess($module->id)) {
			return View('la.drivers.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'categories' => $categories,
				'module' => $module
			]);
		} else {
          return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new driver.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created driver in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{  


    if(Module::hasAccess("Users", "create")) {
      
			$rules = Module::validateRules("Users", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
		
			$insert_id = Module::insert("Users", $request);
	
      if($insert_id != 0){
      	$resData['encrypt_user_id']=\Dwij\Laraadmin\Helpers\LAHelper::encrypt_id($insert_id);
		Driver::find($insert_id)->update($resData);
      }
     
      $modeln = Modeln::find($_POST['model']);
      $category=!empty($modeln->category)?$modeln->category:'';

      $plans_names = DB::table('plans_names')->where('category',$category)->whereNull('deleted_at')->get();
      if(!empty($plans_names)){
      foreach($plans_names as $plans_name){
      	$newFare['users_id']= $insert_id;
      	$newFare['plan_id']=$plans_name->id;
      	$newFare['fare_name']=$plans_name->plan_name;
      	$newFare['fare_duration']=$plans_name->hour_ride;
      	$newFare['fare_price']=$plans_name->plan_price;
      	$newFare['fare_status']=$plans_name->type;
      	$newFare['is_deleted']=0;
      	DB::table('fare')->insert($newFare);
      }
     }
      
      $set_availabilitie = DB::table('set_availabilities')->whereNull('deleted_at')->first();
	  	$set_availabilities = json_decode(json_encode($set_availabilitie), true);
      unset($set_availabilities['deleted_at']);
      unset($set_availabilities['created_at']);
      unset($set_availabilities['updated_at']);
      unset($set_availabilities['id']);
      $set_availabilities['users_id']=$insert_id;
      DB::table('availability')->insert($set_availabilities);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.drivers.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified driver.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{  	
			
		if(Module::hasAccess("Users", "view")) {

			$driver = DB::table('users')->where('id',$id)->first();	
			
			$colors = DB::table('colours')->where('id',$driver->colour)->first();	
			if(isset($driver->id)) {
				$module = Module::get('users');
				$module->row = $driver;
				$availability = DB::table('availability')->where('users_id',$id)->first();
				$rideDatas = null;
				$fares = DB::table('fare')->where('users_id',$id)->where('is_deleted',0)->get();	
				// $rideDatas = DB::table('booking_time_slot')
    //         ->rightJoin('client_details', 'client_details.client_id', '=', 'booking_time_slot.client_id')
    //         ->rightJoin('payments', 'payments.book_id', '=', 'booking_time_slot.book_id')
    //         ->leftJoin('appointments', 'booking_time_slot.book_id', '=', 'appointments.rides_id')
    //         ->where('booking_time_slot.driver_id', $id)
    //         ->select('appointments.rides_status','booking_time_slot.date_time_slot','client_details.client_first_name','client_details.client_last_name','client_details.client_email','client_details.client_phone','booking_time_slot.book_id')->groupBy('booking_time_slot.date_time_slot')->get();
				return view('la.drivers.show', [
					'module' => $module,
					'availability'=> $availability,
					'fares'=> $fares,			
					'rideDatas'=> $rideDatas,
					'view_col' => $this->view_col,
					'listing_cols'=>$this->ride_listing_cols,
					'show_actions'=>$this->show_action,
					'no_header' => true,
					'no_padding' => "no-padding",
					'color'=>$colors->colour_name
				])->with('driver', $driver);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("driver"),
				]);
			}
		} else {
			//return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified driver.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		
		if(Module::hasAccess("Drivers", "edit")) {			

			$driver = DB::table('users')->where('id',$id)->first();		
			$values_colour = DB::table('colours')->where('id',$driver->colour)->get();

			if(isset($driver->id)) {	
				$module = Module::get('Drivers'); 
				
				$module->row = $driver; 
				$categories = Category::get();
				return view('la.drivers.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
					'categories' => $categories,
					'colours'=>$values_colour
				])->with('driver', $driver);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("driver"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified driver in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{	
		if(Module::hasAccess("Drivers", "edit")) {
			
			$rules = Module::validateRules("users", $request, true);
			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			$insert_id = Module::updateRow("users", $request, $id);			
			return redirect()->route(config('laraadmin.adminRoute') . '.drivers.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified driver from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{  
		if(Module::hasAccess("Drivers", "delete")) {

			 DB::table('users')->where('id', $id)->delete();	

			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.drivers.index');
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
		$values = DB::table('users')->select($this->listing_colss);
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Drivers');

    	$user_id=array();
		for($i=0; $i < count($data->data); $i++) {	
			for ($j=0; $j < count($this->listing_colss); $j++) { 
				$col = $this->listing_colss[$j];
				// if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
				// 	$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				// }
				
			
	      if($col == $this->view_col) {
	    
	        $user_id[] = $data->data[$i][$j];
	   	
					$data->data[$i][$j] = $data->data[$i][0];

				}	


			if($col === 'encrypt_user_id') {
				
				$output = '';
				if(Module::hasAccess("Drivers", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/drivers/'.$user_id[$i].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}

				$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/drivers/'.$user_id[$i].'/show').'" class="btn btn-edit-field btn-success btn-xs" style="display:inline;padding:2px 5px 3px 5px;margin-left:3px;"><i class="fa fa-eye"></i></a>';
			
				if(Module::hasAccess("Drivers", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.drivers.destroy', $user_id[$i]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs delete_button" type="button"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
       
				$data->data[$i][$j] = (string)$output;

			}
			
			}

		}
		$out->setData($data);
		return $out;
	}	
	 public function getModelVal($id,$colour_id,$model_id){

	 	 $values = DB::table('model')->where('make_id',$id)->get();
         $values_colour = DB::table('colours')->where('make_id',$id)->get();
	 	     $option ='';
        foreach($values as $reidd) {
        	if ($model_id == $reidd->model_id) {
         		$option .= '<option value="'.$reidd->model_id.'" selected="true">'.$reidd->model_value.'</option>';
         	} else {
	            $option .= '<option value="'.$reidd->model_id.'">'.$reidd->model_value.'</option>';
         	}
        }

         $option1 ='';
         foreach($values_colour as $reidd)
         {
         	if ($colour_id == $reidd->id) {
         		$option1 .= '<option value="'.$reidd->id.'" selected="true">'.$reidd->colour_name.'</option>';	
         	} else {
	            $option1 .= '<option value="'.$reidd->id.'" >'.$reidd->colour_name.'</option>';
         	}
         }
         $array1= [$option,$option1];
	    echo json_encode($array1);
	 }

	 public function availability($id){
		   if(Module::hasAccess("Users", "edit")) {		
				$driver = DB::table('users')->where('id',$id)->first();		
				if(isset($driver->id)) {	
					$module = Module::get('Users');
	
					$availability = DB::table('availability')->where('users_id',$id)->whereNull('deleted_at')->first();	
					$module->row = $driver;

	
					return view('la.drivers.availability', [
						'module' => $module,
						'view_col' => $this->view_col,
						'availability' =>$availability,
					])->with('driver', $driver);

				} else {
					return view('errors.404', [
						'record_id' => $id,
						'record_name' => ucfirst("driver"),
					]);
				}
			} else {
				return redirect(config('laraadmin.adminRoute')."/");
			}
	 }

	 public function availableupdate(Request $request, $id){
	    $data = $request->all();
	     unset($data['_method']);
	     unset($data['_token']);
	     if(!empty($id)){
	     	  unset($data['users_id']);
	       Availability::find($id)->update($data);
	     }
	     return redirect('/admin/drivers/'.$id.'/show#availability');
	 }

	public function availablecreate(Request $request){
	    $data = $request->all();   
	     unset($data['_method']);
	     unset($data['_token']);
	     Availability::create($data);
	     $id = $data['users_id'];  
	     return redirect('/admin/drivers/'.$id.'/show#availability');
	 }

	 public function rates($id){
		   if(Module::hasAccess("Users", "edit")) {		
				$driver = DB::table('users')->where('id',$id)->first();		
				$model = DB::table('model')->where('model_id',$driver->model)->first();	
				$category = !empty($model->category)?$model->category:'';	
				if(isset($driver->id)) {	
					$module = Module::get('Users');
	
					$fares_1 = DB::table('plans_names')
					->leftJoin('fare', 'fare.plan_id', '=', 'plans_names.id')					
					->where('plans_names.type','duration')
					->where('fare.users_id',$id)
          ->where('plans_names.category',$category)
					->whereNull('plans_names.deleted_at')->get();	
					
		      if(empty($fares_1)){
		           $fares = DB::table('plans_names')
		           ->where('plans_names.type','duration')
		           ->where('plans_names.category',$category)
		           ->whereNull('plans_names.deleted_at')->get();
		      }else{
		       		$fares_2 = DB::table('plans_names')
					->leftJoin('fare', 'fare.plan_id', '=', 'plans_names.id')		
					->where('plans_names.type','duration')	
					->whereNull('fare.users_id')				
					->where('plans_names.category',$category)			
					->whereNull('plans_names.deleted_at')->get();			     
		      		$fares = array_merge($fares_1,$fares_2);
		      }
					$m_fares_1 = DB::table('plans_names')
					
					->leftJoin('fare', 'fare.plan_id', '=', 'plans_names.id')					
					->where('plans_names.type','mile')
					->where('fare.users_id',$id)
					->where('plans_names.category',$category)
					->whereNull('plans_names.deleted_at')->get();


           if(empty($m_fares_1)){
           $m_fares = DB::table('plans_names')
           ->where('plans_names.type','mile')
           ->where('plans_names.category',$category)
           ->whereNull('plans_names.deleted_at')->get();
		      }else{
		       $m_fares_2 = DB::table('plans_names')
					->leftJoin('fare', 'fare.plan_id', '=', 'plans_names.id')		
					->where('plans_names.type','mile')	
					->whereNull('fare.users_id')				
					->where('plans_names.category',$category)			
					->whereNull('plans_names.deleted_at')->get();			     
		      $m_fares = array_merge($m_fares_1,$m_fares_2);
		      }
          
					$module->row = $driver;


					return view('la.drivers.rates', [
						'module' => $module,
						'view_col' => $this->view_col,
						'fares' =>$fares,
						'm_fares' =>$m_fares,
					])->with('driver', $driver);

				} else {
					return view('errors.404', [
						'record_id' => $id,
						'record_name' => ucfirst("driver"),
					]);
				}
			} else {
				return redirect(config('laraadmin.adminRoute')."/");
			}
	 }

	 	public function ratesupdate(Request $request, $id){
		    $datas = $request->all();    
		    unset($datas['_method']);
		    unset($datas['_token']);
		 //    $myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
			// fwrite($myfile, json_encode($datas));
			// fclose($myfile);
		    $i=0;
		    foreach($datas['d_fare_name'] as $data){
		       $savedata['fare_name']     =  $datas['d_fare_name'][$i];
		       $savedata['fare_duration'] =  $datas['d_fare_duration'][$i];
		       $savedata['fare_price']    =  $datas['d_fare_price'][$i];
		       $savedata['plan_id']       =  $datas['plan_id'][$i];       
		       $savedata['fare_status']   =  'duration';
		       $savedata['users_id']      =  $id;
		       $savedata['is_deleted']    =  0;

		         if(!empty($datas['d_fare_id'][$i])){
		            //unset($data['users_id']);
		            Rate::find($datas['d_fare_id'][$i])->update($savedata);
		         }else{
		            Rate::create($savedata);
		         }   
		        
		         $i++;
     	}  
    
     if(!empty($datas['m_fare_name'])){
     	$j=0;
     	foreach($datas['m_fare_name'] as $data){
       $savedata['fare_name']     =  $datas['m_fare_name'][$j];
       $savedata['fare_duration'] =  $datas['m_fare_duration'][$j];
       $savedata['fare_price']    =  $datas['m_fare_price'][$j];
       $savedata['plan_id']       =  $datas['m_plan_id'][$j];
       $savedata['fare_status']   =  'mile';
       $savedata['users_id']      =  $id;
       $savedata['is_deleted']    =  0;

         if(!empty($datas['m_fare_id'][$j])){
            //unset($data['users_id']);
            Rate::find($datas['m_fare_id'][$j])->update($savedata);
         }else{
            Rate::create($savedata);
         }
         	$j++;  
       }
     }    
     

    
     return redirect('/admin/drivers/'.$id.'/show#rates');
	 }

    public function ratescreate(Request $request){
    $data = $request->all();   
     unset($data['_method']);
     unset($data['_token']);
     Rate::create($data);
     $id = $data['users_id'];  
     return redirect('/admin/drivers/'.$id.'/show#availability');
	 }
}
