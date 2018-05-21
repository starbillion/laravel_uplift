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

use App\Models\Payment;

class PaymentsController extends Controller
{
	public $show_action = false;
	public $view_col = '';
	public $listing_cols = ['id', 'first_name', 'last_name', 'transaction_id', 'paid_amount', 'amount'];
	public $listing_colsss = ['Id',  'Driver ID', 'Plan Name', 'Plan Amount', 'Transaction Id', 'Expire Date'];
	public $listing_colss = ['subs_id',  'users_id', 'plan_name', 'plan_amount', 'transaction_id', 'expire_date'];

	
	public function __construct() { 
		// Field Access of Listing Columns
	/*	if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_colss = ModuleFields::listingColumnAccessScan('Payments', $this->listing_colss);
				return $next($request);
			});
		} else {
			$this->listing_colss = ModuleFields::listingColumnAccessScan('Payments', $this->listing_colss);
		}*/
	}
	
	/**
	 * Display a listing of the Payments.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Payments');

		if(Module::hasAccess($module->id)) {
			return View('la.payments.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_colsss,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new payment.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created payment in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Payments", "create")) {
		
			$rules = Module::validateRules("Payments", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Payments", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.payments.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified payment.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Payments", "view")) {
			
			$payment = Payment::find($id);
			if(isset($payment->id)) {
				$module = Module::get('Payments');
				$module->row = $payment;
				
				return view('la.payments.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('payment', $payment);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("payment"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified payment.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Payments", "edit")) {			
			$payment = Payment::find($id);
			if(isset($payment->id)) {	
				$module = Module::get('Payments');
				
				$module->row = $payment;
				
				return view('la.payments.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('payment', $payment);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("payment"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified payment in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Payments", "edit")) {
			
			$rules = Module::validateRules("Payments", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Payments", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.payments.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified payment from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Payments", "delete")) {
			Payment::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.payments.index');
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
		$values = DB::table('subscription')->select($this->listing_colss)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Payments');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_colss); $j++) { 
				$col = $this->listing_colss[$j]; 
				/*if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}*/
				if($col == 'plan_amount') {
					$data->data[$i][$j] = '£ '.$data->data[$i][$j];
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/drivers/'.$data->data[$i][$j].'/show').'">'.$data->data[$i][$j].'</a>';
				}
				if($col == 'expire_date') {
					$data->data[$i][$j] = date('d-m-Y',strtotime($data->data[$i][$j]));
				}
				if($col == 'users_id') {
					$data->data[$i][$j] = \Dwij\Laraadmin\Helpers\LAHelper::encrypt_user_id($data->data[$i][$j]);
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Payments", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/payments/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Payments", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.payments.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
