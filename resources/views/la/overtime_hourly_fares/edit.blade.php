@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/overtime_hourly_fares') }}">Overtime Hourly fare</a> :
@endsection
@section("contentheader_description", $overtime_hourly_fare->$view_col)
@section("section", "Overtime Hourly fares")
@section("section_url", url(config('laraadmin.adminRoute') . '/overtime_hourly_fares'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Overtime Hourly fares Edit : ".$overtime_hourly_fare->$view_col)

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
				{!! Form::model($overtime_hourly_fare, ['route' => [config('laraadmin.adminRoute') . '.overtime_hourly_fares.update', $overtime_hourly_fare->id ], 'method'=>'PUT', 'id' => 'overtime_hourly_fare-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'overtime_hourly_fare')
					@la_input($module, 'overtime_price')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/overtime_hourly_fares') }}">Cancel</a></button>
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
	$("#overtime_hourly_fare-edit-form").validate({
		
	});
});
</script>
@endpush
