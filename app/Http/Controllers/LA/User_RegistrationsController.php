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

use App\Models\User_Registration;
use App\Models\User_Role;

class User_RegistrationsController extends Controller
{
	public $show_action = true;
	public $view_col = 'name';
	public $listing_cols = ['id', 'first_name', 'last_name', 'email', 'phone', 'user_role'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('User_Registrations', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('User_Registrations', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the User_Registrations.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('User_Registrations');
		$user_roles = DB::table('user_roles')->get();
		
		if(Module::hasAccess($module->id)) {
			return View('la.user_registrations.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'user_roles' => json_encode($user_roles),
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new user_registration.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created user_registration in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("User_Registrations", "create")) {
		
			$rules = Module::validateRules("User_Registrations", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("User_Registrations", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.user_registrations.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified user_registration.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("User_Registrations", "view")) {
			
			$user_registration = User_Registration::find($id);
			if(isset($user_registration->id)) {
				$module = Module::get('User_Registrations');
				$module->row = $user_registration;
				
				return view('la.user_registrations.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('user_registration', $user_registration);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("user_registration"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified user_registration.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("User_Registrations", "edit")) {			
			$user_registration = User_Registration::find($id);
			$user_roles = User_Role::get();
			if(isset($user_registration->id)) {	
				$module = Module::get('User_Registrations');
				
				$module->row = $user_registration;
				
				return view('la.user_registrations.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
					'user_roles' =>json_encode($user_roles)
				])->with('user_registration', $user_registration);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("user_registration"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified user_registration in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("User_Registrations", "edit")) {
			
			$rules = Module::validateRules("User_Registrations", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("User_Registrations", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.user_registrations.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified user_registration from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("User_Registrations", "delete")) {
			User_Registration::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.user_registrations.index');
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
		// $values = DB::table('user_registrations')->select($this->listing_cols)->whereNull('deleted_at');
		// $out = Datatables::of($values)->make();
		// $data = $out->getData();


		$values = DB::table('user_registrations')->select(['user_registrations.id','user_registrations.first_name','user_registrations.last_name','user_registrations.email','user_registrations.phone','user_roles.user_role'])
		->join('user_roles', 'user_registrations.user_role', '=', 'user_roles.id')
		->orderBy('user_registrations.id', 'asc')
		->whereNull('user_registrations.deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();


		$fields_popup = ModuleFields::getModuleFields('User_Registrations');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/user_registrations/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("User_Registrations", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/user_registrations/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("User_Registrations", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.user_registrations.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
