@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/user_registrations') }}">User Registration</a> :
@endsection
@section("contentheader_description", $user_registration->$view_col)
@section("section", "User Registrations")
@section("section_url", url(config('laraadmin.adminRoute') . '/user_registrations'))
@section("sub_section", "Edit")

@section("htmlheader_title", "User Registrations Edit : ".$user_registration->$view_col)

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

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($user_registration, ['route' => [config('laraadmin.adminRoute') . '.user_registrations.update', $user_registration->id ], 'method'=>'PUT', 'id' => 'user_registration-edit-form']) !!}
					{{-- @la_form($module) --}}
					
					
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')					
					@la_input($module, 'email')
					<!-- @la_input($module, 'password') -->
					@la_input($module, 'phone')
					@la_input($module, 'user_role')
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/user_registrations') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {

	$('select[name="user_role"]').empty();
	var user_roles = JSON.parse('<?=$user_roles?>');
	var selectedIndex = parseInt('<?=$user_registration->user_role?>');

	var options = "";

	console.log(user_roles);
	for (var i = 0; i < user_roles.length; i++) {
		if (selectedIndex == user_roles[i]['id']) {
			options += "<option value='" + user_roles[i]['id'] + "' selected='true'>" + user_roles[i]['user_role'] + "</option>";	
		} else {
			options += "<option value='" + user_roles[i]['id'] + "'>" + user_roles[i]['user_role'] + "</option>";
		}
	}

	$('select[name="user_role"]').html(options);
	// $('select[name="user_role"]').val(user_roles[selectedIndex]['user_role']);
	


	$("#user_registration-edit-form").validate({
		
	});
});
</script>
@endpush
