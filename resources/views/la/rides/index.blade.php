@extends("la.layouts.app")

@section("contentheader_title", "Rides")
@section("contentheader_description", "Rides listing")
@section("section", "Rides")
@section("sub_section", "Listing")
@section("htmlheader_title", "Rides Listing")

@section("headerElems")
@la_access("Rides", "create")

	<!--button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Ride</button-->
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
	{!! Form::open(['action' => 'LA\RidesController@store', 'id' => 'ride-form']) !!}
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
			<div class="pull-left col-lg-2 mr_10">
			  <select name="driver_filter" class="form-control select2" >
			  	 <option value="">Select Driver</option>
			  	 @foreach($drivers as $driver)
				  	 <option value="{{$driver->users_id}}" @if(!empty($driver_filter) && $driver_filter == $driver->users_id) {{'selected="selected"'}} @endif>{{$driver->first_name}} {{$driver->last_name}}</option>				  	
			  	 @endforeach
			  </select>
			</div>
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
			<div class="pull-left col-lg-2 mr_10">
			  <select name="status_filter" class="form-control select2" >
			  	 <option value="">Select Status</option>
			  	 <option value="Pending" @if(!empty($status_filter) && $status_filter == 'Pending') {{'selected="selected"'}} @endif>Pending</option>
			  	 <option value="Cancel" @if(!empty($status_filter) && $status_filter == 'Cancel') {{'selected="selected"'}} @endif>Cancel</option>
			  	 <option value="Completed" @if(!empty($status_filter) && $status_filter == 'Completed') {{'selected="selected"'}} @endif>Completed</option>
			  </select>
			</div>
			<div class="pull-left col-lx-2">
			  <button class="btn btn-success btn-sm pull-right"  type="submit"  style="padding: 7px;" >Search</button>
			</div>
	  </div>
	  {!! Form::close() !!}
  </div>
	<div class="box-body">
	  @if(!empty($rideDatass)) 
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_colss as $col )
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
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
           @if(empty($status_filter))      
           <span class="label label-success">Pending</span>                    
				   @elseif(!empty($status_filter) &&  $status_filter == 'Pending')
					 <span class="label label-success">Pending</span>
					 @elseif(!empty($rideData->rides_status) && $rideData->rides_status == 'cancel')
					 <span class="label label-danger">{{$rideData->rides_status}}</span>
					 @elseif(!empty($rideData->rides_status) && $rideData->rides_status == 'completed')
					 <span class="label label-warning">{{$rideData->rides_status}}</span>
					 @endif
					 </td>
					 <td>{{!empty($rideData->first_name)?$rideData->first_name:''}} {{!empty($rideData->last_name)?$rideData->last_name:''}}</td>
					 <td><?= date('l, F d, Y (H:i)',strtotime($rideData->date_time_slot)) ?></td>
					 <td>{{$rideData->client_first_name}}</td>
					 <td>{{$rideData->client_last_name}}</td>					 
					 <td>{{$rideData->client_email}}</td>
					 <td>{{$rideData->client_phone}}</td>
					 <td>{{$k}}</td>
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
		@endif
	</div>
</div>

@la_access("Rides", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Ride</h4>
			</div>
			{!! Form::open(['action' => 'LA\RidesController@store', 'id' => 'ride-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    @la_form($module)
					
					{{--
					@la_input($module, 'status')
					--}}
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
        ajax: "{{ url(config('laraadmin.adminRoute') . '/ride_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
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
@endpush
