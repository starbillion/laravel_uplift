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

use App\Models\Passenger;

class PassengersController extends Controller
{
	public $show_action = true;
	public $view_col = 'client_first_name';
	public $listing_cols = ['id', 'client_first_name', 'client_last_name', 'client_email', 'client_phone'];
	public $listing_colss = ['client_id', 'client_first_name', 'client_last_name', 'client_email', 'client_phone'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {

			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Passengers', $this->listing_cols);
				return $next($request);
			});
		} else {

			$this->listing_cols = ModuleFields::listingColumnAccessScan('Passengers', $this->listing_cols);

		}
	}
	
	/**
	 * Display a listing of the Passengers.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{


		$module = Module::get('Passengers');
		
		if(Module::hasAccess($module->id)) {
			return View('la.passengers.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new passenger.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created passenger in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Passengers", "create")) {
		
			$rules = Module::validateRules("Passengers", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Passengers", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.passengers.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified passenger.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Passengers", "view")) {
			
			//$passenger = DB::table('client_details')->select($this->listing_colss)->whereNull('deleted_at')->first();
			$passenger = Passenger::find($id);
			if(isset($passenger->client_id)) {
				$module = Module::get('Passengers');
				$module->row = $passenger;
				
				return view('la.passengers.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('passenger', $passenger);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("passenger"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified passenger.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Passengers", "edit")) {			
			 
			//$passenger = DB::table('client_details')->select($this->listing_colss)->where('client_id',$id)->whereNull('deleted_at')->first();
			$passenger = Passenger::find($id);
			if(isset($passenger->client_id)) {	
				$module = Module::get('Passengers');
				
				$module->row = $passenger;
				
				return view('la.passengers.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('passenger', $passenger);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("passenger"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified passenger in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Passengers", "edit")) {
			
			$rules = Module::validateRules("Passengers", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Passengers", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.passengers.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified passenger from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Passengers", "delete")) {
			Passenger::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.passengers.index');
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
		$values = DB::table('client_details')->select($this->listing_colss)->whereNull('deleted_at')->orderBy('client_id','DESC');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Passengers');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/passengers/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
			
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Passengers", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/passengers/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Passengers", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.passengers.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
