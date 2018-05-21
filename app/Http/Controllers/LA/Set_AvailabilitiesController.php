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

use App\Models\Set_Availability;

class Set_AvailabilitiesController extends Controller
{
	public $show_action = true;
	public $view_col = 'saturday_from';
	public $listing_cols = ['id', 'sunday_to', 'sunday_from', 'monday_to', 'monday_from', 'tuesday_to', 'tuesday_from', 'wednesday_to', 'wednesday_from', 'thursday_to', 'thursday_from', 'friday_to', 'friday_from', 'saturday_to', 'saturday_from'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Set_Availabilities', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Set_Availabilities', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Set_Availabilities.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Set_Availabilities');
		
		if(Module::hasAccess($module->id)) {
			return View('la.set_availabilities.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new set_availability.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created set_availability in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Set_Availabilities", "create")) {
		
			$rules = Module::validateRules("Set_Availabilities", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Set_Availabilities", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.set_availabilities.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified set_availability.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Set_Availabilities", "view")) {
			
			$set_availability = Set_Availability::find($id);
			if(isset($set_availability->id)) {
				$module = Module::get('Set_Availabilities');
				$module->row = $set_availability;
				
				return view('la.set_availabilities.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('set_availability', $set_availability);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("set_availability"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified set_availability.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Set_Availabilities", "edit")) {			
			$set_availability = Set_Availability::find($id);
			if(isset($set_availability->id)) {	
				$module = Module::get('Set_Availabilities');
				
				$module->row = $set_availability;
				
				return view('la.set_availabilities.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('set_availability', $set_availability);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("set_availability"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified set_availability in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Set_Availabilities", "edit")) {
			
			$rules = Module::validateRules("Set_Availabilities", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Set_Availabilities", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.set_availabilities.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified set_availability from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Set_Availabilities", "delete")) {
			Set_Availability::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.set_availabilities.index');
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
		$values = DB::table('set_availabilities')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Set_Availabilities');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/set_availabilities/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Set_Availabilities", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/set_availabilities/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Set_Availabilities", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.set_availabilities.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
