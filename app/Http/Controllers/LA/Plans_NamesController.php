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

use App\Models\Plans_Name;
use App\Models\Category;

class Plans_NamesController extends Controller
{
	public $show_action = true;
	public $view_col = '';
	public $listing_cols = ['id', 'plan_name', 'hour_ride', 'type', 'plan_price', 'category'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Plans_Names', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Plans_Names', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Plans_Names.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Plans_Names');
		
		$categories = Category::get();

		if(Module::hasAccess($module->id)) {
			
			return View('la.plans_names.index', [
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
	 * Show the form for creating a new plans_name.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created plans_name in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Plans_Names", "create")) {
		
			$rules = Module::validateRules("Plans_Names", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Plans_Names", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.plans_names.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified plans_name.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Plans_Names", "view")) {
			
			$plans_name = Plans_Name::find($id);
			
			if(isset($plans_name->id)) {
				$module = Module::get('Plans_Names');
				$module->row = $plans_name;

				return view('la.plans_names.show', [
					'module' => $module,
					'view_col' => $this->view_col,					
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('plans_name', $plans_name);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("plans_name"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified plans_name.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Plans_Names", "edit")) {			
			$plans_name = Plans_Name::find($id);
			if(isset($plans_name->id)) {	
				$module = Module::get('Plans_Names');
				
				$module->row = $plans_name;
				$categories = Category::get();
		

				return view('la.plans_names.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
					'categories' => $categories,
				])->with('plans_name', $plans_name);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("plans_name"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified plans_name in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Plans_Names", "edit")) {
			
			$rules = Module::validateRules("Plans_Names", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Plans_Names", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.plans_names.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified plans_name from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Plans_Names", "delete")) {
			Plans_Name::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.plans_names.index');
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
		$values = DB::table('plans_names')->select(['plans_names.id','plans_names.plan_name','plans_names.hour_ride','plans_names.type','plans_names.plan_price','categories.category_name'])
		->join('categories', 'plans_names.category', '=', 'categories.id')
		->orderBy('categories.id', 'asc')
		->whereNull('plans_names.deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();
  
		$fields_popup = ModuleFields::getModuleFields('Plans_Names');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];

			 // 	if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
				// 	$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);					
				// }
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/plans_names/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Plans_Names", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/plans_names/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Plans_Names", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.plans_names.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger delete_button btn-xs" type="button"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
