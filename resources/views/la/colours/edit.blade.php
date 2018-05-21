@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/colours') }}">Colour</a> :
@endsection
@section("contentheader_description", $colour->$view_col)
@section("section", "Colours")
@section("section_url", url(config('laraadmin.adminRoute') . '/colours'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Colours Edit : ".$colour->$view_col)

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
				{!! Form::model($colour, ['route' => [config('laraadmin.adminRoute') . '.colours.update', $colour->id ], 'method'=>'PUT', 'id' => 'colour-edit-form']) !!}
					{{--@la_form($module)--}}
				@la_input($module, 'colour_name')
				@la_input($module, 'make_id')
				<!-- <div class="form-group">
					<label for="model_value">Make Name * :</label>
					<select name="make_id" class="make_id form-control" required="required">
						<option value="">Select</option>
						@foreach($makes as $make)
							<option value="{{ $make->make_id }}">{{ $make->make_name }}</option>
						@endforeach
					</select>
				</div> -->
					
					{{--
					@la_input($module, 'category_name')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/colours') }}">Cancel</a></button>
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
	$("#colour-edit-form").validate({
		
	});
});
</script>
@endpush
