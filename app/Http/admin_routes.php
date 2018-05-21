<?php

/* ================== Homepage ================== */
//Route::get('/', 'HomeController@index');
//Route::get('/home', 'HomeController@index');
Route::auth();

/* ================== Access Uploaded Files ================== */
Route::get('files/{hash}/{name}', 'LA\UploadsController@get_file');

/*
|--------------------------------------------------------------------------
| Admin Application Routes
|--------------------------------------------------------------------------
*/

$as = "";
if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
	$as = config('laraadmin.adminRoute').'.';
	
	// Routes for Laravel 5.3
	Route::get('/logout', 'Auth\LoginController@logout');
}




Route::group(['as' => $as, 'middleware' => ['auth', 'permission:ADMIN_PANEL']], function () {
	
	Route::get('/','LA\DriversController@index');
	/* ================== Dashboard ================== */
	Route::get('/','LA\DriversController@index');

	//Route::get('/home','LA\DriversController@index');

	Route::get(config('laraadmin.adminRoute'), 'LA\DriversController@index');
	//Route::get(config('laraadmin.adminRoute'). '/dashboard', 'LA\DashboardController@index');
	
	/* ================== Users ================== */
	Route::resource(config('laraadmin.adminRoute') . '/users', 'LA\UsersController');
	Route::get(config('laraadmin.adminRoute') . '/user_dt_ajax', 'LA\UsersController@dtajax');
	
	/* ================== Uploads ================== */
	Route::resource(config('laraadmin.adminRoute') . '/uploads', 'LA\UploadsController');
	Route::post(config('laraadmin.adminRoute') . '/upload_files', 'LA\UploadsController@upload_files');
	Route::get(config('laraadmin.adminRoute') . '/uploaded_files', 'LA\UploadsController@uploaded_files');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_caption', 'LA\UploadsController@update_caption');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_filename', 'LA\UploadsController@update_filename');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_public', 'LA\UploadsController@update_public');
	Route::post(config('laraadmin.adminRoute') . '/uploads_delete_file', 'LA\UploadsController@delete_file');
	
	/* ================== Roles ================== */
	Route::resource(config('laraadmin.adminRoute') . '/roles', 'LA\RolesController');
	Route::get(config('laraadmin.adminRoute') . '/role_dt_ajax', 'LA\RolesController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_module_role_permissions/{id}', 'LA\RolesController@save_module_role_permissions');
	
	/* ================== Permissions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/permissions', 'LA\PermissionsController');
	Route::get(config('laraadmin.adminRoute') . '/permission_dt_ajax', 'LA\PermissionsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_permissions/{id}', 'LA\PermissionsController@save_permissions');
	
	/* ================== Departments ================== */
	Route::resource(config('laraadmin.adminRoute') . '/departments', 'LA\DepartmentsController');
	Route::get(config('laraadmin.adminRoute') . '/department_dt_ajax', 'LA\DepartmentsController@dtajax');
	
	/* ================== Employees ================== */
	Route::resource(config('laraadmin.adminRoute') . '/employees', 'LA\EmployeesController');
	Route::get(config('laraadmin.adminRoute') . '/employee_dt_ajax', 'LA\EmployeesController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/change_password/{id}', 'LA\EmployeesController@change_password');
	
	/* ================== Organizations ================== */
	Route::resource(config('laraadmin.adminRoute') . '/organizations', 'LA\OrganizationsController');
	Route::get(config('laraadmin.adminRoute') . '/organization_dt_ajax', 'LA\OrganizationsController@dtajax');

	/* ================== Backups ================== */
	Route::resource(config('laraadmin.adminRoute') . '/backups', 'LA\BackupsController');
	Route::get(config('laraadmin.adminRoute') . '/backup_dt_ajax', 'LA\BackupsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/create_backup_ajax', 'LA\BackupsController@create_backup_ajax');
	Route::get(config('laraadmin.adminRoute') . '/downloadBackup/{id}', 'LA\BackupsController@downloadBackup');


	/* ================== Drivers ================== */
	Route::resource(config('laraadmin.adminRoute') . '/drivers', 'LA\DriversController');
	Route::get(config('laraadmin.adminRoute') . '/driver_dt_ajax', 'LA\DriversController@dtajax');
	Route::get(config('laraadmin.adminRoute') . '/get_model_ajax/{id}/{colour_id}/{model_id}', 'LA\DriversController@getModelVal');
	Route::get(config('laraadmin.adminRoute') . '/drivers/{id}/show', 'LA\DriversController@show');
	Route::get(config('laraadmin.adminRoute') . '/rider_dt_ajax', 'LA\DriversController@riderdtajax');
	Route::get(config('laraadmin.adminRoute') . '/drivers/{id}/availability', 'LA\DriversController@availability');
	Route::post(config('laraadmin.adminRoute') . '/drivers/availableupdate/{id}', 'LA\DriversController@availableupdate');
	Route::post(config('laraadmin.adminRoute') . '/drivers/availablecreate', 'LA\DriversController@availablecreate');

	Route::get(config('laraadmin.adminRoute') . '/drivers/{id}/rates', 'LA\DriversController@rates');
	Route::post(config('laraadmin.adminRoute') . '/drivers/ratesupdate/{id}', 'LA\DriversController@ratesupdate');
	Route::post(config('laraadmin.adminRoute') . '/drivers/ratescreate', 'LA\DriversController@ratescreate');


	


	/* ================== Rides ================== */
	Route::resource(config('laraadmin.adminRoute') . '/rides', 'LA\RidesController');
	Route::get(config('laraadmin.adminRoute') . '/ride_dt_ajax', 'LA\RidesController@dtajax');

	/* ================== Passengers ================== */
	Route::resource(config('laraadmin.adminRoute') . '/passengers', 'LA\PassengersController');
	Route::get(config('laraadmin.adminRoute') . '/passenger_dt_ajax', 'LA\PassengersController@dtajax');

	/* ================== Makes ================== */
	Route::resource(config('laraadmin.adminRoute') . '/makes', 'LA\MakesController');
	Route::get(config('laraadmin.adminRoute') . '/make_dt_ajax', 'LA\MakesController@dtajax');




	/* ================== Modelns ================== */
	Route::resource(config('laraadmin.adminRoute') . '/modelns', 'LA\ModelnsController');
	Route::get(config('laraadmin.adminRoute') . '/modeln_dt_ajax', 'LA\ModelnsController@dtajax');
	Route::get(config('laraadmin.adminRoute') . '/cat_ajax', 'LA\ModelnsController@catajax');
	Route::get(config('laraadmin.adminRoute') . '/mod_ajax', 'LA\ModelnsController@modajax');


	/* ================== Plans_Names ================== */
	Route::resource(config('laraadmin.adminRoute') . '/plans_names', 'LA\Plans_NamesController');
	// Route::resource(config('laraadmin.adminRoute') . '/set_fares', 'LA\Plans_NamesController');
	Route::get(config('laraadmin.adminRoute') . '/plans_name_dt_ajax', 'LA\Plans_NamesController@dtajax');

	/* ================== Subs_&_Comms ================== */
	Route::resource(config('laraadmin.adminRoute') . '/subs_&_comms', 'LA\Subs_&_CommsController');
	Route::get(config('laraadmin.adminRoute') . '/subs_&_comm_dt_ajax', 'LA\Subs_&_CommsController@dtajax');

	/* ================== Subcriptions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/subcriptions', 'LA\SubcriptionsController');
	Route::get(config('laraadmin.adminRoute') . '/subcription_dt_ajax', 'LA\SubcriptionsController@dtajax');

	/* ================== Payments ================== */
	Route::resource(config('laraadmin.adminRoute') . '/payments', 'LA\PaymentsController');
	Route::get(config('laraadmin.adminRoute') . '/payment_dt_ajax', 'LA\PaymentsController@dtajax');



	/* ================== Payments_Reports ================== */
	Route::resource(config('laraadmin.adminRoute') . '/payments_reports', 'LA\Payments_ReportsController');
	Route::get(config('laraadmin.adminRoute') . '/payments_report_dt_ajax', 'LA\Payments_ReportsController@dtajax');

	/* ================== Information_cards ================== */
	Route::resource(config('laraadmin.adminRoute') . '/information_cards', 'LA\Information_cardsController');
	Route::get(config('laraadmin.adminRoute') . '/information_card_dt_ajax', 'LA\Information_cardsController@dtajax');

	/* ================== Passenger_Subscriptions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/passenger_subscriptions', 'LA\Passenger_SubscriptionsController');
	Route::get(config('laraadmin.adminRoute') . '/passenger_subscription_dt_ajax', 'LA\Passenger_SubscriptionsController@dtajax');

	/* ================== Overtime_Hourly_fares ================== */
	Route::resource(config('laraadmin.adminRoute') . '/overtime_hourly_fares', 'LA\Overtime_Hourly_faresController');
	Route::get(config('laraadmin.adminRoute') . '/overtime_hourly_fare_dt_ajax', 'LA\Overtime_Hourly_faresController@dtajax');

	/* ================== Set_Availabilities ================== */
	Route::resource(config('laraadmin.adminRoute') . '/set_availabilities', 'LA\Set_AvailabilitiesController');
	Route::get(config('laraadmin.adminRoute') . '/set_availability_dt_ajax', 'LA\Set_AvailabilitiesController@dtajax');

	/* ================== User_Roles ================== */
	Route::resource(config('laraadmin.adminRoute') . '/user_roles', 'LA\User_RolesController');
	Route::get(config('laraadmin.adminRoute') . '/user_role_dt_ajax', 'LA\User_RolesController@dtajax');

	/* ================== User_Registrations ================== */
	Route::resource(config('laraadmin.adminRoute') . '/user_registrations', 'LA\User_RegistrationsController');
	Route::get(config('laraadmin.adminRoute') . '/user_registration_dt_ajax', 'LA\User_RegistrationsController@dtajax');

	/* ================== Categories ================== */
	Route::resource(config('laraadmin.adminRoute') . '/categories', 'LA\CategoriesController');
	Route::get(config('laraadmin.adminRoute') . '/category_dt_ajax', 'LA\CategoriesController@dtajax');

    /* ================== Colours ================== */
    Route::resource(config('laraadmin.adminRoute') . '/colours', 'LA\ColoursController');
    Route::get(config('laraadmin.adminRoute') . '/colour_dt_ajax', 'LA\ColoursController@dtajax');

    /* ================== Passenger_Taxes ================== */
	Route::resource(config('laraadmin.adminRoute') . '/passenger_taxes', 'LA\Passenger_TaxesController');
	Route::get(config('laraadmin.adminRoute') . '/passenger_tax_dt_ajax', 'LA\Passenger_TaxesController@dtajax');

	/* ================== Vat_Reports ================== */
	Route::resource(config('laraadmin.adminRoute') . '/vat_reports', 'LA\Vat_ReportsController');
	Route::get(config('laraadmin.adminRoute') . '/vat_report_dt_ajax', 'LA\Vat_ReportsController@dtajax');

	/* ================== Home_Page_Messages ================== */
	Route::resource(config('laraadmin.adminRoute') . '/home_page_messages', 'LA\Home_Page_MessagesController');
	Route::get(config('laraadmin.adminRoute') . '/home_page_message_dt_ajax', 'LA\Home_Page_MessagesController@dtajax');
});
