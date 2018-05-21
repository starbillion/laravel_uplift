@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/plans_names') }}">Plan Name</a> :
@endsection

@section("contentheader_description", $plans_name->plans_name)

@section("section", "Plans names")
@section("section_url", url(config('laraadmin.adminRoute') . '/plans_names'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Plan Name Edit : ".$plans_name->plans_name)

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
				{!! Form::model($plans_name, ['route' => [config('laraadmin.adminRoute') . '.plans_names.update', $plans_name->id ], 'method'=>'PUT', 'id' => 'plans_name-edit-form']) !!}
					{{-- @la_form($module) 	--}}
					
					@la_input($module, 'plan_name')
					@la_input($module, 'hour_ride')
					@la_input($module, 'type')
					
					<div class="form-group">
					<label for="model_value">Category * :</label>
          <select name="category" class="category form-control" required="required">
          <option value="">Select</option>
					@foreach($categories as $category)
					 <option value="{{ $category->id }}" @if($category->id == $plans_name->category) {{'selected'}} @endif>{{ $category->category_name }}</option>
          @endforeach
					</select>
					</div>
					@la_input($module, 'plan_price')
				
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/plans_names') }}">Cancel</a></button>
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
	$("#plans_name-edit-form").validate({
		
	});
});
</script>
@endpush
