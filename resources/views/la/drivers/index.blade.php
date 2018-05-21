@extends("la.layouts.app")

@section("contentheader_title", "Drivers")
@section("contentheader_description", "Drivers listing")
@section("section", "Drivers")
@section("sub_section", "Listing")
@section("htmlheader_title", "Drivers Listing")

@section("headerElems")
@la_access("Drivers", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Driver</button>
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
			@if($col == 'id')
			<th>Driver Id</th>
			@else
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
      @endif
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

@la_access("Drivers", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Driver</h4>
			</div>
			{!! Form::open(['action' => 'LA\DriversController@store', 'id' => 'driver-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
           {{--  @la_form($module) --}}
					
					
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')					
					@la_input($module, 'email')
					@la_input($module, 'address_line_1')
					@la_input($module, 'address_line_2')						
					@la_input($module, 'address_line_3')
					@la_input($module, 'town')
					@la_input($module, 'city')
					@la_input($module, 'postcode')
					@la_input($module, 'country')
					@la_input($module, 'country_code')
					@la_input($module, 'telephone')
					@la_input($module, 'mobile_number')
					@la_input($module, 'profile_pic')
					@la_input($module, 'make')
					@la_input($module, 'model')
					
					<!--div class="form-group">
						<label for="model_value">Category * :</label>
	          <select name="category" class="category form-control" required="required">
	          <option value="">Select</option>
						@foreach($categories as $category)
						 <option value="{{ $category->id }}">{{ $category->category_name }}</option>
	          @endforeach
						</select>
					</div>
					<div class="form-group">
						<label for="model_value">Price * :</label>
						<input type="text" class="form-control" id="cat_price" name="price">          
					</div-->	
					@la_input($module, 'colour')			
					@la_input($module, 'registration')					
					<div class="col-sm-12" style="padding-left: 0px!important;">
					 <div class="col-sm-4" style="padding-left: 0px!important;">
					   @la_input($module, 'upload_doc')
					 </div>
					 <div class="col-sm-8">
						@la_input($module, 'phv_expire_date')
					 </div>	
					</div>
					<div class="col-sm-12" style="padding-left: 0px!important;">
					 <div class="col-sm-4" style="padding-left: 0px!important;">
					  @la_input($module, 'upload_mot_doc')
					 </div>
					 <div class="col-sm-8">
						@la_input($module, 'mot_issue_date')
					 </div>	
					</div>				
					<div class="col-sm-12" style="padding-left: 0px!important;">
					 <div class="col-sm-4" style="padding-left: 0px!important;">
					   @la_input($module, 'license')
					 </div>
					 <div class="col-sm-8">
						@la_input($module, 'license_expire_date')
					 </div>	
					</div>	
					<div class="col-sm-12" style="padding-left: 0px!important;">
					 <div class="col-sm-4" style="padding-left: 0px!important;">
					  @la_input($module, 'pco_doc')
					 </div>
					 <div class="col-sm-8">
						@la_input($module, 'pco_expire_date')
					 </div>	
					</div>	
					
					<div class="col-sm-12" style="padding-left: 0px!important;">
					 <div class="col-sm-4" style="padding-left: 0px!important;">
					  @la_input($module, 'insurance_doc')
					 </div>
					 <div class="col-sm-8">
						@la_input($module, 'insurance_expire_date')
					 </div>	
					</div>	
					@la_input($module, 'license_pic')
					@la_input($module, 'name')
					@la_input($module, 'password')
					@la_input($module, 'status')	
					
						<div class="col-sm-8" style="display: none">
					 <input type="hidden" value="" name="mot_expire_date" id="mot_expire_date"/>
					</div>	
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

<style type="text/css">
	a.btn.btn-default.btn_upload_file {
    margin-top: 0px;
}
</style>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script src="{{ asset('la-assets/js/pages/jquery-confirm.min.js') }}"></script>


<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/driver_dt_ajax') }}",
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
	$("#driver-add-form").validate({
		
	});
		$('select[name ="make"]').change(function(){	
        var url ="<?= URL::to('/').'/admin/get_model_ajax/' ?>"+$(this).val();   
			  $.ajax({
			  method: "GET",
			  url: url,			
			})
			  .done(function( html ) {
			  	
				  	var tmp = JSON.parse(html);
				    $('select[name ="model"]').html(tmp[0]);
				    $('select[name ="model"]').trigger('change');

				    $('select[name ="colour"]').html(tmp[1]);
				    $('select[name ="colour"]').trigger('change');
			 });
	});

		 $('input[name="mot_issue_date"]').blur(function(){		
					var d= $(this).val().split('/');
					var dt = new Date(d[2],d[1],d[0]);
         var date = add_months(dt, 5).toString();
         var mot_expire_date =convert(date);
        $('input[name="mot_expire_date"]').val(mot_expire_date); 
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

	$('select[name="model"]').change(function(){
		
     var val = $(this).val();
     var url = "{{ url(config('laraadmin.adminRoute') . '/mod_ajax') }}";
     $.ajax({
		  url: url,
		  type: "GET",
      data: {id : val},	
		  success: function(data){
		  	var d = $.parseJSON(data);
		    $('.category').val(d.cat);
		    $('#cat_price').val(d.price);
		  }
		});
	});

});
setTimeout(function(){ 
	$('select[name ="make"]').trigger('change');
	$('select[name ="model"]').trigger('change');
 }, 500);

function add_months(dt, n) 
 {

   return new Date(dt.setMonth(dt.getMonth() + n));      
 }
 function convert(str) {
		var mnths = { 
		Jan:"01", Feb:"02", Mar:"03", Apr:"04", May:"05", Jun:"06",
		Jul:"07", Aug:"08", Sep:"09", Oct:"10", Nov:"11", Dec:"12"
		};
	
		date = str.split(" ");
    
		return [ date[2],mnths[date[1]],date[3]].join("/");
}

</script>

@endpush
