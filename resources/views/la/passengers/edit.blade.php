@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/passengers') }}">Passenger</a> :
@endsection
@section("contentheader_description", $passenger->$view_col)
@section("section", "Passengers")
@section("section_url", url(config('laraadmin.adminRoute') . '/passengers'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Passengers Edit : ".$passenger->$view_col)

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
				{!! Form::model($passenger, ['route' => [config('laraadmin.adminRoute') . '.passengers.update', $passenger->client_id ], 'method'=>'PUT', 'id' => 'passenger-edit-form']) !!}
					{{--@la_form($module)--}}
					
					
					@la_input($module, 'client_first_name')
					@la_input($module, 'client_last_name')
					@la_input($module, 'client_email')
					@la_input($module, 'country_code')
					@la_input($module, 'client_phone')
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/passengers') }}">Cancel</a></button>
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
	$("#passenger-edit-form").validate({
		
	});
});
</script>
@endpush
