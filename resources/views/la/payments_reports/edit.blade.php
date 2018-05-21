@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/rides') }}">Ride</a> :
@endsection
@section("contentheader_description", $ride->$view_col)
@section("section", "Rides")
@section("section_url", url(config('laraadmin.adminRoute') . '/rides'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Rides Edit : ".$ride->$view_col)

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
				{!! Form::model($ride, ['route' => [config('laraadmin.adminRoute') . '.rides.update', $ride->id ], 'method'=>'PUT', 'id' => 'ride-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'status')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/rides') }}">Cancel</a></button>
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
	$("#ride-edit-form").validate({
		
	});
});
</script>
@endpush
