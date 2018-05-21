@extends("la.layouts.app")

@section("contentheader_title", "Vat Reports")
@section("contentheader_description", "Vat Reports listing")
@section("section", "Vat Reports")
@section("sub_section", "Listing")
@section("htmlheader_title", "Vat Reports Listing")

@section("headerElems")
@la_access("Vat_Reports", "create")
	<!--button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Vat Report</button-->
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

	<div class="box-header"> 
	{!! Form::open(['action' => 'LA\Vat_ReportsController@store', 'id' => 'ride-form']) !!}
		<div class="pull-left col-lx-12">
		  <div class="pull-left col-lx-1">
		     <strong >Filter by  &nbsp;&nbsp;</strong>
		  </div>

		  <div class="pull-left col-lg-2 mr_10">
			  <input type="text" name="start_date" required value="{{!empty($start_date)?$start_date:''}}" id="start_date" placeholder="Start Date" class="form-control">
			</div>
			<div class="pull-left col-lg-2 mr_10">
			   <input type="text" name="end_date" required value="{{!empty($end_date)?$end_date:''}}" id="end_date" placeholder="End Date" class="form-control">
			</div>
			<!--div class="pull-left col-lg-3 mr_10">
			  <select name="driver_filter" class="form-control select2" >
			  	 <option value="">Select Driver</option>
			  	 @foreach($drivers as $driver)
				  	 <option value="{{$driver->users_id}}" @if(!empty($driver_filter) && $driver_filter == $driver->users_id) {{'selected="selected"'}} @endif>{{$driver->first_name}} {{$driver->last_name}} </option>				  	
			  	 @endforeach
			  </select>
			</div-->
			<div class="pull-left col-lg-3 mr_10">
			  <select name="passenger_filter" class="form-control select2" >
			  	 <option value="">Select Passenger</option>
			  	 @foreach($passengers as $passenger)
			  	  @if(!empty($passenger->client_first_name))
				  	 <option value="{{$passenger->client_first_name}} {{$passenger->client_last_name}}" @if(!empty($passenger_filter) && $passenger_filter == $passenger->client_first_name.' '.$passenger->client_last_name) {{'selected="selected"'}} @endif>{{$passenger->client_first_name}} {{$passenger->client_last_name}}</option>		
				  	@endif		  	
			  	 @endforeach
			  </select>
			</div>
			<div class="pull-left col-lg-3 mr_10"> 
			<?php $vat_status = !empty($vat_status)?$vat_status:''; ?>
			  <select name="vat_status" class="form-control select2" >
			  	 <option value="" @if($vat_status == '') {{'selected="selected"'}} @endif>Select Status</option>
			  	 <option value="1" @if($vat_status == '1') {{'selected="selected"'}} @endif>Paid</option>
			  	 <option value="0" @if($vat_status == '0') {{'selected="selected"'}} @endif>Unpaid</option>
			  </select>
			</div>
			<!--div class="pull-left col-lg-3 mr_10">
			  <select name="passenger_filter" class="form-control select2" >
			  	 <option value="">Select Passenger</option>
			  	 @foreach($passengers as $passenger)
			  	  @if(!empty($passenger->client_first_name))
				  	 <option value="{{$passenger->client_first_name}} {{$passenger->client_last_name}}" @if(!empty($passenger_filter) && $passenger_filter == $passenger->client_first_name.' '.$passenger->client_last_name) {{'selected="selected"'}} @endif>{{$passenger->client_first_name}} {{$passenger->client_last_name}}</option>		
				  	@endif		  	
			  	 @endforeach
			  </select>
			</div-->
			<!--div class="pull-left col-lg-2 mr_10">
			  <select name="status_filter" class="form-control select2" >
			  	 <option value="">Select Status</option>
			  	 <option value="Pending" @if(!empty($status_filter) && $status_filter == 'Pending') {{'selected="selected"'}} @endif>Pending</option>
			  	 <option value="Cancel" @if(!empty($status_filter) && $status_filter == 'Cancel') {{'selected="selected"'}} @endif>Cancel</option>
			  	 <option value="Completed" @if(!empty($status_filter) && $status_filter == 'Completed') {{'selected="selected"'}} @endif>Completed</option>
			  </select>
			</div-->
			<div class="pull-left col-lx-2">
			  <button class="btn btn-success btn-sm pull-right"  type="submit"  style="padding: 7px;" >Search</button>
			</div>
	  </div>
	  {!! Form::close() !!}
  </div>
	<div class="box-body">
	{!! Form::open(['action' => 'LA\Vat_ReportsController@store', 'id' => 'ride-form']) !!}
	 <input type="hidden" name="start_date" value="{{!empty($start_date)?$start_date:''}}" >
	 <input type="hidden" name="end_date" value="{{!empty($end_date)?$end_date:''}}" >
	 <input type="hidden" name="passenger_filter" value="{{!empty($passenger_filter)?$passenger_filter:''}}" >	 
	 <input type="hidden" name="vat_status" value="{{!empty($vat_status)?$vat_status:''}}" >	 

	  @if(!empty($rideDatass)) 
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_colss as $col )
			 @if($col == 'Select All')
				<th> <input type="checkbox" class="selectCheck"  >{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
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
		 {{--*/ $k=1; /*--}}
				 @foreach($rideDatas as $rideData)				 
				 <tr>                                     
           <td>   
           <?php 
           $amt=round(str_replace('£ ','',$rideData->paid_amount) * str_replace(' %','',$rideData->vat)/100,2);
           if($rideData->vat_status == 0) {             
            ?>
				   <input type="checkbox" class="checkboxSelected" value="<?= $rideData->payment_id;?>" name="payments[]" onClick="checkboxPayment()" data-amount="<?php echo $amt; ?> " >
				   <?php } ?>
					 </td>
					 <td>{{!empty($rideData->first_name)?$rideData->first_name:''}} </td>
					 <td>{{!empty($rideData->last_name)?$rideData->last_name:''}}</td>				 
					 <td>{{'£ '.$rideData->paid_amount}}</td>					 
					 <td>{{$rideData->vat .' %'}}</td>
					 <td><?php echo '£ '.$amt; ?></td>
					 <td> <?php if($rideData->vat_status == 0){        		
              echo  '<span class="label label-danger">Unpaid</span>';
        		 }else{
              echo  '<span class="label label-success">Paid</span>';       	           
          	} ?>          		
           </td>
				 </tr>
				 {{--*/ $k++; /*--}}
				 @endforeach
		</tbody>
		</table>
		@else 

		<table id="example1" class="table table-bordered">
			<thead>
			<tr class="success">
				@foreach( $listing_colss as $col )
					@if($col == 'Select All')
					<th> <input type="checkbox" class="selectCheck" >{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
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
		@endif
	</div>
	{!! Form::close() !!}
</div>


<style type="text/css">
 .mr_10{
 	margin-right: -10px;
 }	    
</style>
@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
<!-- Date Picker -->
<link rel="stylesheet" href="<?php echo e(asset('la-assets/plugins/datepicker/datepicker3.css')); ?>">
<style type="text/css">
	#example1_filter{
		display: none;
	}
</style>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script src="<?php echo e(asset('la-assets/plugins/datepicker/bootstrap-datepicker.js')); ?>"></script>
 @if(empty($rideDatass))
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
    serverSide: true,
    columnDefs: [ { orderable: false, targets: [0] }],
        ajax: "{{ url(config('laraadmin.adminRoute') . '/vat_report_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		 aLengthMenu: [
        [25, 50, 100, 200, -1],
        [25, 50, 100, 200, "All"]
    ],
    iDisplayLength: -1

	});
	$('#start_date').datepicker({
		 format: "dd/mm/yyyy",
     autoclose: true
	});
	$('#end_date').datepicker({
		 format: "dd/mm/yyyy",
     autoclose: true
	});

	$("#ride-add-form").validate({
		
	});
	});
</script>
@else
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,   
		columnDefs: [ { orderable: false, targets: [0] }],
		 aLengthMenu: [
        [25, 50, 100, 200, -1],
        [25, 50, 100, 200, "All"]
    ],
    iDisplayLength: -1

	});
	$('#start_date').datepicker({
		 format: "dd/mm/yyyy",
     autoclose: true
	});
	$('#end_date').datepicker({
		 format: "dd/mm/yyyy",
     autoclose: true
	});

	$("#ride-add-form").validate({
		
	});
});
</script>
@endif
<script>
$(function () {
		$(".selectCheck").click(function() {
    $('#example1_length span').remove('.btnClass');
		if($(this).is(':checked')){		
      $('.checkboxSelected').prop('checked', true);
     
      var button = '<span class="btnClass"> <button class="btn btn-success btn-sm" type="submit" style="padding: 4px;margin-left: 2%;">Mark as paid</button> <span style="margin-left: 2%;" id="amt"></span></span>';
      if($('[name="payments[]"]:checked').length > 0){
      	$('#example1_length label').after(button);  
      }      
		}else{			
      $('.checkboxSelected').prop('checked', false);    
      $('#example1_length span').remove('.btnClass');
 		}	
 		var amt=0;
		$('.checkboxSelected').each(function( index ) {
		  if($(this).is(':checked')){		
		  	amt+=parseFloat($(this).attr('data-amount'));
		  }
		});	
		var feeamt=0;
		$('.checkboxSelected').each(function( index ) {
		  if($(this).is(':checked')){		
		  	feeamt+=parseFloat($(this).attr('data-feeamount'));
		  }
		});	
		$('#amt').html('');
    $('#amt').html('Toatal Amount : £ '+amt.toFixed(2)+' ');
	}); 

});
 function checkboxPayment(){
 	$('#example1_length span').remove('.btnClass');
 	$(".selectCheck").prop('checked',false);
 	if($('[name="payments[]"]:checked').length > 0)
			 { 			 
			 	if($('#example1_length button').length == 0){   
          var button = '<span class="btnClass"> <button class="btn btn-success btn-sm" type="submit" style="padding: 4px;margin-left: 2%;">Mark as paid</button> <span style="margin-left: 2%;" id="amt"></span></span>';
          if($('[name="payments[]"]:checked').length > 0){
			      	$('#example1_length label').after(button);  
			      }             
			  }
			 }else{
          $('#example1_length span').remove('.btnClass');
			 }
		var amt=0;
		$('.checkboxSelected').each(function( index ) {
		  if($(this).is(':checked')){		
		  	amt+=parseFloat($(this).attr('data-amount'));
		  }
		});	
		var feeamt=0;
		$('.checkboxSelected').each(function( index ) {
		  if($(this).is(':checked')){		
		  	feeamt+=parseFloat($(this).attr('data-feeamount'));
		  }
		});
		$('#amt').html('');
    $('#amt').html('Toatal Amount : £ '+amt.toFixed(2)+' <span style="margin-left:15px">  ');
 }
</script>
@endpush
