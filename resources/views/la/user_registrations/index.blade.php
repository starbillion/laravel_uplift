@extends("la.layouts.app")

@section("contentheader_title", "User Registrations")
@section("contentheader_description", "User Registrations listing")
@section("section", "User Registrations")
@section("sub_section", "Listing")
@section("htmlheader_title", "User Registrations Listing")

@section("headerElems")
@la_access("User_Registrations", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add User Registration</button>
@endla_access
@endsection

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_cols as $col )
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
			@endforeach
			@if($show_actions)
			<th>Actions</th>
			@endif
		</tr>
		</thead>
		<tbody>
			
		</tbody>
		</table>
	</div>
</div>

@la_access("User_Registrations", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add User Registration</h4>
			</div>
			{!! Form::open(['action' => 'LA\User_RegistrationsController@store', 'id' => 'user_registration-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
             {{--       @la_form($module)  --}}
					
					
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')
					@la_input($module, 'email')
					@la_input($module, 'password')
					@la_input($module, 'phone')
					@la_input($module, 'user_role')
					
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				{!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endla_access

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>

$(document).ready(function() {
	setTimeout(function(){ 
		var user_roles = JSON.parse('<?=$user_roles?>');
		$('select[name="user_role"]').empty();
		var options = "";
		for (var i = 0; i < user_roles.length; i++) {
			options += "<option value='" + user_roles[i]['id'] + "'>" + user_roles[i]['user_role'] + "</option>"; 
		}
		$('select[name="user_role"]').html(options);
 	}, 500);	
})



$(function () {
	

	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/user_registration_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#user_registration-add-form").validate({
		
	});
});
</script>
@endpush
