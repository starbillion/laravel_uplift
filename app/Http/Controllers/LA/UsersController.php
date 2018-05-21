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

use App\User;
use App\Models\Driver;

class UsersController extends Controller
{
	public $show_action = true;
	public $view_col = '';
	public $listing_cols = ['id', 'first_name','last_name', 'email'];
	
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
	 * Display a listing of the Users.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Drivers');
		$roles = DB::table('roles')->where('id', '!=' , 1)->whereNull('deleted_at')->get();
		if(Module::hasAccess($module->id)) {
			return View('la.users.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module,
				'roles'=>$roles
			]);
		} else {
            return redirect(config('laraadmin.adminRoute'). '.users.index');
        }
	}

	/**
	 * Display the specified user.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Users", "view")) {
			$driver = User::findOrFail($id);
			if(isset($driver->id)) {
				$module = Module::get('Drivers');
				$module->row = $driver;				
				return view('la.users.show', [
					'module' => $module,			
					'view_col' => $this->view_col,
					'listing_cols'=>$this->listing_cols,
					'show_actions'=>$this->show_action,
					'no_header' => true,
					'no_padding' => "no-padding"
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
	 * Store a newly created driver in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{  


    if(Module::hasAccess("Users", "create")) {
      
			$rules = Module::validateRules("Drivers", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
		
			$insert_id = Module::insert("Drivers", $request);
	    
      if($insert_id != 0){
      	$role_id=!empty($_POST['user_type'])?$_POST['user_type']:'';
      	$resData['id'] = $insert_id;
      	$resData['context_id']=1;
      	$resData['user_type']=$role_id;
			  Driver::find($insert_id)->update($resData);

			  $newRole['user_id'] = $insert_id;
			  $newRole['role_id'] = $role_id;
        DB::table('role_user')->insert($newRole);
      }    
     

			
			return redirect()->route(config('laraadmin.adminRoute') . '.users.index');
			
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
		if(Module::hasAccess("Users", "edit")) {
			
			$rules = Module::validateRules("Drivers", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::updateRow("Drivers", $request, $id);
      
      $role_id=!empty($_POST['user_type'])?$_POST['user_type']:'';
			$resData['user_type']=$role_id;
			Driver::find($insert_id)->update($resData);
			
		  $newRole['user_id'] = $id;
		  $newRole['role_id'] = $role_id;
		
      DB::table('role_user')->where('user_id',$id)->update($newRole);


     if(Auth::user()->id == 1 ){
     	return redirect()->route(config('laraadmin.adminRoute') . '.users.index');
     }else{
     	 return redirect(url(config('laraadmin.adminRoute') . '/users/'.$id));
     }			
			
		} else {	
			return redirect(config('laraadmin.adminRoute')."/");
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
		if(Module::hasAccess("Users", "edit")) {			

			$user = DB::table('users')->where('users_id',$id)->first();		
			if(isset($user->id)) {	
				$module = Module::get('Drivers');
				
				$module->row = $user;
        
        $roles = DB::table('roles')->where('id', '!=' , 1)->whereNull('deleted_at')->get();
				return view('la.users.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
					'roles' => $roles
				])->with('user', $user);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("user"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	public function destroy($id)
	{  
		// return "string".$id;
		if(Module::hasAccess("Users", "delete")) {
			
			 DB::table('users')->where('users_id', $id)->delete();	
			 echo "string";return;
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.users.index');
		} else {
			echo "string---1";return;
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
		$values = DB::table('users')->select($this->listing_cols)->where('id', '!=' , 1)->whereNull('deleted_at')->WhereNotNull('id');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Drivers');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/users/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Users", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/users/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Users", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.users.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs delete_button" type="button"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
