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
use Mail;
use App\Models\Information_card;

class Information_cardsController extends Controller
{
	public $show_action = true;
	public $view_col = 'card_subject';
	public $listing_cols = ['id', 'card_subject', 'card_message'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Information_cards', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Information_cards', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Information_cards.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Information_cards');
		
		if(Module::hasAccess($module->id)) {
			return View('la.information_cards.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new information_card.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created information_card in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Information_cards", "create")) {
		
			$rules = Module::validateRules("Information_cards", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Information_cards", $request);
			
			$dataNew=$request->all();
			$users = DB::table('users')->select('*')->where('status','Approved')->whereNull('id')->get();
			$message = !empty($dataNew['card_message'])?$dataNew['card_message']:'';
			$subject = !empty($dataNew['card_subject'])?$dataNew['card_subject']:'';


			
      foreach($users as $user){ 
       if(!empty($user->registrationId)){
                $message_2 = array(
                'message'   => $message, 
                'title'   => $subject,
                'subtitle'  => $subject,
                'tickerText'  => $subject,
                'vibrate' => 1,
                'sound'   => 1,
                'largeIcon' => 'large_icon',
                'smallIcon' => 'small_icon',  
                'payload' => array('alert'=>$subject,'title' => $subject,'message' => $message)
                );


              $registatoin_ids_2 = array($user->registrationId);
              $data = \Dwij\Laraadmin\Helpers\LAHelper::sendMessageThroughGCM($registatoin_ids_2, $message_2);  

              $insertData['message']=$message;
              $insertData['driver_id']=$user->users_id;
              DB::table('notification')->insert($insertData);           
            }

      /*$name =	$user->first_name.' '.$user->last_name;
			 Mail::send('emails.send_information_card', ['name' => $name, 'message' => $message], function ($m) use ($user,$name,$subject) {
						$m->from('marc@marcfrancis.co', 'Marc Francis');
						$m->to($user->email, $name)->subject($subject);
					});*/
			}
			return redirect()->route(config('laraadmin.adminRoute') . '.information_cards.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified information_card.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Information_cards", "view")) {
			
			$information_card = Information_card::find($id);
			if(isset($information_card->id)) {
				$module = Module::get('Information_cards');
				$module->row = $information_card;
				
				return view('la.information_cards.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('information_card', $information_card);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("information_card"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified information_card.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{ 
		if(Module::hasAccess("Information_cards", "edit")) {			
			$information_card = Information_card::find($id);
			if(isset($information_card->id)) {	
				$module = Module::get('Information_cards');
				
				$module->row = $information_card;
				
				return view('la.information_cards.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('information_card', $information_card);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("information_card"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified information_card in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Information_cards", "edit")) {
			
			$rules = Module::validateRules("Information_cards", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Information_cards", $request, $id);
			
			$dataNew=$request->all();
			$users = DB::table('users')->select('*')->where('status','Approved')->whereNull('id')->get();
			$message = !empty($dataNew['card_message'])?$dataNew['card_message']:'';
			$subject = !empty($dataNew['card_subject'])?$dataNew['card_subject']:'';


			
      foreach($users as $user){ 
       if(!empty($user->registrationId)){
                $message_2 = array(
                'message'   => $message, 
                'title'   => $subject,
                'subtitle'  => $subject,
                'tickerText'  => $subject,
                'vibrate' => 1,
                'sound'   => 1,
                'largeIcon' => 'large_icon',
                'smallIcon' => 'small_icon',  
                'payload' => array('alert'=>$subject,'title' => $subject,'message' => $message)
                );


              $registatoin_ids_2 = array($user->registrationId);
              \Dwij\Laraadmin\Helpers\LAHelper::sendMessageThroughGCM($registatoin_ids_2, $message_2);  

              $insertData['message']=$message;
              $insertData['driver_id']=$user->users_id;       
              DB::table('notification')->insert($insertData);         
            }

      /*$name =	$user->first_name.' '.$user->last_name;
			 Mail::send('emails.send_information_card', ['name' => $name, 'message' => $message], function ($m) use ($user,$name,$subject) {
						$m->from('marc@marcfrancis.co', 'Marc Francis');
						$m->to($user->email, $name)->subject($subject);
					});*/
			}
			
			return redirect()->route(config('laraadmin.adminRoute') . '.information_cards.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified information_card from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Information_cards", "delete")) {
			Information_card::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.information_cards.index');
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
		$values = DB::table('information_cards')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Information_cards');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/information_cards/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Information_cards", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/information_cards/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Information_cards", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.information_cards.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
