@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}">Driver</a> :
@endsection
@section("contentheader_description", $driver->first_name ." ". $driver->last_name)
@section("section", "Drivers")
@section("section_url", url(config('laraadmin.adminRoute') . '/drivers'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Drivers Edit : ".$driver->$view_col)

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
				{!! Form::model($driver, ['route' => [config('laraadmin.adminRoute') . '.drivers.update', $driver->id ], 'method'=>'PUT', 'id' => 'driver-edit-form']) !!}
				{{--	@la_form($module) --}}
					
					
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')	
					@la_input($module, 'email')
					@la_input($module, 'address_line_1')
					@la_input($module, 'address_line_2')						
					@la_input($module, 'address_line_3')
					@la_input($module, 'town')
					@la_input($module, 'city')
					@la_input($module, 'county')
					@la_input($module, 'postcode')
					@la_input($module, 'country')
					@la_input($module, 'country_code')
					@la_input($module, 'telephone')
					@la_input($module, 'mobile_number')
					@la_input($module, 'profile_pic')
					@la_input($module, 'make')
					@la_input($module, 'model')
					@la_input($module, 'colour')
					
					<!-- <div class="form-group">
					<label for="model_value">ColourTest :</label>
          <select name="colour" class="colour form-control" required="required">
					@foreach($colours as $colour)
						@if ($colour->id == $driver->colour)
	                    	<option value="{{ $colour->id }}" selected="true">hi</option>
		                @else
		                    <option value="{{ $colour->id }}">hello</option>
		                @endif
          			@endforeach
					</select>
					</div> -->
					
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
					@la_input($module, 'status')	
					<div class="col-sm-8" style="display: none">
					 <input type="hidden" value="" name="mot_expire_date" id="mot_expire_date"/>
					</div>	
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}">Cancel</a></button>
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

	$("#driver-edit-form").validate({
		
	});
	 
	$('select[name ="make"]').change(function(){	
        var url ="<?= URL::to('/').'/admin/get_model_ajax/' ?>"+$(this).val()+"/<?=$driver->colour?>"+"/<?=$driver->model?>";   
			  $.ajax({
			  method: "GET",
			  url: url,			
			})
			  .done(function( data ) {
				var aryHtml = JSON.parse(data);
			    $('select[name ="model"]').html(aryHtml[0]);
			    $('select[name ="model"]').trigger('change');
			    $('select[name ="colour"]').html(aryHtml[1]);
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
  if($('input[name ="mot_issue_date"]').val() != ''){
  	mot_expire_date($('input[name ="mot_issue_date"]').val());
  }

}, 500);

function mot_expire_date(val){
	console.log(val);
	       var d= val.split('/');
				 var dt = new Date(d[2],d[1],d[0]);
         var date = add_months(dt, 5).toString();
         var mot_expire_date =convert(date);
        $('input[name="mot_expire_date"]').val(mot_expire_date); 
}
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
