@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/user_roles') }}">User Role</a> :
@endsection
@section("contentheader_description", $user_role->$view_col)
@section("section", "User Roles")
@section("section_url", url(config('laraadmin.adminRoute') . '/user_roles'))
@section("sub_section", "Edit")

@section("htmlheader_title", "User Roles Edit : ".$user_role->$view_col)

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
				{!! Form::model($user_role, ['route' => [config('laraadmin.adminRoute') . '.user_roles.update', $user_role->id ], 'method'=>'PUT', 'id' => 'user_role-edit-form']) !!}
					@la_form($module)
					
					<!-- @la_input($module, 'user_role') -->
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/user_roles') }}">Cancel</a></button>
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
	$("#user_role-edit-form").validate({
		
	});
});
</script>
@endpush
