@extends("la.layouts.app")

@section("contentheader_title", "Models")
@section("contentheader_description", "Models listing")
@section("section", "Models")
@section("sub_section", "Listing")
@section("htmlheader_title", "Models Listing")

@section("headerElems")
@la_access("Modelns", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Model</button>
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

@la_access("Modelns", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Model</h4>
			</div>
			{!! Form::open(['action' => 'LA\ModelnsController@store', 'id' => 'modeln-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
           <!-- @la_form($module)				 -->
				
					@la_input($module, 'make_id')
					@la_input($module, 'model_value')
					<div class="form-group">
					<label for="model_value">Category * :</label>
			          <select name="category" class="category_id form-control" required="required">
			          <option value="">Select</option>
					@foreach($categories as $category)
					 <option value="{{ $category->id }}">{{ $category->category_name }}</option>
          			@endforeach
					</select>
					</div>
					<!--div class="form-group">
					<label for="model_value">Price * :</label>
					<input type="number" readonly="readonly" class="form-control" id="cat_price" name="price" value="">          
					</div-->
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
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/css/jquery-confirm.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script src="{{ asset('la-assets/js/pages/jquery-confirm.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/modeln_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
				fnDrawCallback: function (oSettings) {
	      $('.delete_button').on('click',function(e){   
		      e.preventDefault(); // prevent submit button from firing and submit form
			      var $this = $(this);  
			          $.confirm({
			          title: 'Please confirm!',
			          content: 'Delete this message?',
			          buttons: {
			              confirm: function () {
			                  $this.parent('form').submit();
			              },
			              cancel: function () {
			                  e.preventDefault(); // prevent submit button from firing and submit form
			              },       
			          }
			      });
		    });
	},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#modeln-add-form").validate({
		
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
