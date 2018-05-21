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

use App\Models\Modeln;
use App\Models\Make;
use App\Models\Category;

class ModelnsController extends Controller
{
	public $show_action = true;
	public $view_col = 'model_value';
	public $listing_cols = ['id', 'make_id', 'model_value','category'];
	public $listing_colss = ['model_id', 'make_id', 'model_value','category'];	
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Modelns', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Modelns', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Modelns.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Modelns');
		$categories = Category::get();
		$makes = Make::get();

		if(Module::hasAccess($module->id)) {
			return View('la.modelns.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'categories' => $categories,
				'makes' => $makes,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new modeln.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created modeln in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Modelns", "create")) {
		
			$rules = Module::validateRules("Modelns", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Modelns", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.modelns.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified modeln.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{

		
		if(Module::hasAccess("Modelns", "view")) {
			
			$modeln = Modeln::find($id);
			if(isset($modeln->model_id)) {
				$module = Module::get('Modelns');
				$module->row = $modeln;
				
				return view('la.modelns.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('modeln', $modeln);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("modeln"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified modeln.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{  
		if(Module::hasAccess("Modelns", "edit")) {			
			$modeln = Modeln::find($id);

			if(isset($modeln->model_id)) {	
				$module = Module::get('Modelns');


				$categories = Category::get();
				// $categories = [];
				$module->row = $modeln;
		
				return view('la.modelns.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
					'categories' => $categories,
				])->with('modeln', $modeln);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("modeln"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified modeln in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{

		if(Module::hasAccess("Modelns", "edit")) {
			
			$rules = Module::validateRules("Modelns", $request, true);
		
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			$insert_id = Module::updateRow("Modelns", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.modelns.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified modeln from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Modelns", "delete")) {
			Modeln::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.modelns.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
	/**
	 * Remove the specified modeln from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function catajax(Request $request)
	{
		$data = $request->all();
		$category = Category::find($data['id']);	
		return !empty($category->category_price)?$category->category_price:'0.00';		
	}
	/**
	 * Remove the specified modeln from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function modajax(Request $request)
	{
		$data = $request->all();
		$category = Modeln::find($data['id']);	

		$price = !empty($category->price)?$category->price:'0.00';		
		$cat = !empty($category->category)?$category->category:'';		
		echo json_encode(array('cat'=>$cat,'price'=>$price));
	}
	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{
				
		$values = DB::table('model')->select(['model.model_id','make.make_name','model.model_value','categories.category_name'])
		->join('categories', 'model.category', '=', 'categories.id')->join('make', 'model.make_id', '=', 'make.id')
		->whereNull('model.deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();
		
		


		$fields_popup = ModuleFields::getModuleFields('Modelns');

		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_colss); $j++) { 
				$col = $this->listing_colss[$j];
				// if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
				// 	$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				// }
				if($col == $this->view_col) {
					//$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/models/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				/*if($col == 'category') {
					$category = Category::find($data->data[$i][$j]);
					$data->data[$i][$j] =  !empty($category->category_name)?$category->category_name:'';
				}*/

				if($col == 'make_id') {
					//$make_name = Make::find($data->data[$i][$j]);

					//$data->data[$i][$j] =  $make_name->make_name;
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Modelns", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/modelns/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Modelns", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.modelns.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
