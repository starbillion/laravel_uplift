@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/models') }}">Model</a> :
@endsection
@section("contentheader_description", $modeln->$view_col)
@section("section", "Models")
@section("section_url", url(config('laraadmin.adminRoute') . '/models'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Modelns Edit : ".$modeln->$view_col)

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
				{!! Form::model($modeln, ['route' => [config('laraadmin.adminRoute') . '.modelns.update', $modeln->model_id ], 'method'=>'PUT', 'id' => 'modeln-edit-form']) !!}
					<!-- @la_form($module) -->
					
					
					@la_input($module, 'make_id')
					@la_input($module, 'model_value')
					<!-- @la_input($module, 'category') -->
					<div class="form-group">
					<label for="model_value">Category * :</label>
          <select name="category" class="category form-control" required="required">
          <option value="">Select</option>
					@foreach($categories as $category)
					 <option value="{{ $category->id }}" @if($category->id == $modeln->category) {{'selected'}} @endif>{{ $category->category_name }}</option>
          @endforeach
					</select>
					</div>
					<!--div class="form-group">
						<label for="model_value">Price * :</label>
						<input type="number" readonly="readonly" class="form-control" id="cat_price" name="price" value="{{ $modeln->price }}">          
					</div-->
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/modelns') }}">Cancel</a></button>
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
	$("#modeln-edit-form").validate({
		
	});
		$('.category').change(function(){
     var val = $(this).val();
     var url = "{{ url(config('laraadmin.adminRoute') . '/cat_ajax') }}";
     $.ajax({
		  url: url,
		  type: "GET",
      data: {id : val},	
		  success: function(data){
		    $('#cat_price').val(data);
		  }
		});
	});
});
</script>
@endpush
