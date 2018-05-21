@extends('la.layouts.app')

@section('htmlheader_title')
	Driver View
@endsection


@section('main-content')
<div id="page-content" class="profile2">
	<div class="bg-primary clearfix">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-3">
					<!--<img class="profile-image" src="{{ asset('la-assets/img/avatar5.png') }}" alt="">-->
					<div class="profile-icon text-primary"><i class="fa {{ $module->fa_icon }}"></i></div>
				</div>
				<div class="col-md-9">
					<h4 class="name">{{ $driver->first_name }} {{ $driver->last_name }}</h4>
					<!--div class="row stats">
						<div class="col-md-4"><i class="fa fa-facebook"></i> 234</div>
						<div class="col-md-4"><i class="fa fa-twitter"></i> 12</div>
						<div class="col-md-4"><i class="fa fa-instagram"></i> 89</div>
					</div-->
					<!--p class="desc">Test Description in one line</p-->
				</div>
			</div>
		</div>
		<!--div class="col-md-3">
			<div class="dats1"><div class="label2">Admin</div></div>
			<div class="dats1"><i class="fa fa-envelope-o"></i> superadmin@gmail.com</div>
			<div class="dats1"><i class="fa fa-map-marker"></i> Pune, India</div>
		</div-->
		<div class="col-md-4">
			<!--
			<div class="teamview">
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user1-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user2-160x160.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user3-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user4-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user5-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user6-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user7-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user8-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user5-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user6-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user7-128x128.jpg') }}" alt=""></a>
			</div>
			-->
			<!--div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #1</span>
					<small class="pull-right">20%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">20% Complete</span>
					</div>
				</div>
			</div-->
			<!--div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #2</span>
					<small class="pull-right">90%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 90%" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">90% Complete</span>
					</div>
				</div>
			</div-->
			<!--div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #3</span>
					<small class="pull-right">60%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 60%" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">60% Complete</span>
					</div>
				</div>
			</div-->
		</div>
		<!--div class="col-md-1 actions">
			@la_access("Drivers", "edit")
				<a href="{{ url(config('laraadmin.adminRoute') . '/drivers/'.$driver->users_id.'/edit') }}" class="btn btn-xs btn-edit btn-default"><i class="fa fa-pencil"></i></a><br>
			@endla_access
			
			@la_access("Drivers", "delete")
				{{ Form::open(['route' => [config('laraadmin.adminRoute') . '.drivers.destroy', $driver->users_id], 'method' => 'delete', 'style'=>'display:inline']) }}
					<button class="btn btn-default btn-delete btn-xs" type="submit"><i class="fa fa-times"></i></button>
				{{ Form::close() }}
			@endla_access
		</div-->
	</div>

	<ul data-toggle="ajax-tab" class="nav nav-tabs profile" role="tablist">
		<li class=""><a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}" data-toggle="tooltip" data-placement="right" title="Back to Drivers"><i class="fa fa-chevron-left"></i></a></li>
		<li class="active"><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-info"><i class="fa fa-bars"></i> General Info</a></li>
		<li class=""><a role="tab" data-toggle="tab" href="#availability" data-target="#availability"><i class="fa fa-clock-o"></i> Availability</a></li>
		<li class=""><a role="tab" data-toggle="tab" href="#rates" data-target="#rates"><i class="fa fa-clock-o"></i> Rates</a></li>
		<li class=""><a role="tab" data-toggle="tab" href="#ride_history" data-target="#ride_history"><i class="fa fa-clock-o"></i> Ride History</a></li>
	
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active fade in" id="tab-info">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">
						<h4>General Info</h4>
					</div>
					<div class="panel-body">
						@la_display($module, 'first_name')
						@la_display($module, 'last_name')
						@la_display($module, 'email')
						@la_display($module, 'address_line_1')
						@la_display($module, 'address_line_2')						
						@la_display($module, 'address_line_3')
						@la_display($module, 'town')
						@la_display($module, 'city')
						@la_display($module, 'county')
						@la_display($module, 'postcode')
						@la_display($module, 'country')
						
						@la_display($module, 'telephone')
						@la_display($module, 'mobile_number')
						@la_display($module, 'profile_pic')
						@la_display($module, 'make')
						@la_display($module, 'model')
						<!-- @la_display($module, 'colour') -->
						<div class="form-group">
							<label for="email" class="col-md-2">Color :</label>
							<div class="col-md-10 fvalue">{{$color}}</div>
						</div>
						@la_display($module, 'registration')				
					  @la_display($module, 'upload_doc')				
						@la_display($module, 'phv_expire_date')
					  @la_display($module, 'upload_mot_doc')
						@la_display($module, 'mot_issue_date')		
					  @la_display($module, 'license')				
						@la_display($module, 'license_expire_date')					
					  @la_display($module, 'pco_doc')				
						@la_display($module, 'pco_expire_date')
					  @la_display($module, 'insurance_doc')				
						@la_display($module, 'insurance_expire_date')		
						@la_display($module, 'license_pic')
						@la_display($module, 'name')
						@la_display($module, 'password')
					</div>
				</div>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="availability">
			<div class="panel-default panel-heading">			
			  <div class="col-md-1 actions pull-right" style="padding: 3px;">
						@la_access("Drivers", "edit")
							<a href="{{ url(config('laraadmin.adminRoute') . '/drivers/'.$driver->id.'/availability') }}" class="btn btn-xs btn-edit btn-default" ><i class="fa fa-pencil"></i></a><br>
						@endla_access	
					</div>
						<h4>Availability</h4>	
			 </div>
			 <div class="panel-body">
			   
		    <table id="example1" class="table">
		     <thead>
              <tr>
	                <th>&nbsp;</th>
	                <th>Sunday</th>
	                <th>Monday</th>
	                <th>Tuesday</th>                                  
	                <th>Wednesday</th>
	                <th>Thursday</th>
	                <th>Friday</th>
	                <th>Saturday</th>                    
              </tr>
              @if(!empty($availability))
              <tr> 
                  <td><strong>From</strong></td>              
                  <td>{{$availability->sunday_to}}</td>
                  <td>{{$availability->monday_to}}</td>
                  <td>{{$availability->tuesday_to}}</td>
                  <td>{{$availability->wednesday_to}}</td>
                  <td>{{$availability->thursday_to}}</td>
                  <td>{{$availability->friday_to}}</td>
                  <td>{{$availability->saturday_to}}</td>
                  
               </tr>
               <tr> 
	                <td><strong>To</strong></td>              
	                <td>{{$availability->sunday_from}}</td>
                  <td>{{$availability->monday_from}}</td>
                  <td>{{$availability->tuesday_from}}</td>
                  <td>{{$availability->wednesday_from}}</td>
                  <td>{{$availability->thursday_from}}</td>
                  <td>{{$availability->friday_from}}</td>
                  <td>{{$availability->saturday_from}}</td>
                
              </tr>
              @endif
				 </thead>
		    </table>
			 </div>
			<!--<div class="text-center p30"><i class="fa fa-list-alt" style="font-size: 100px;"></i> <br> No posts to show</div>-->
		</div>
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="rates">
			<div class="panel-default panel-heading">
			  <div class="col-md-1 actions pull-right" style="padding: 3px;">
						@la_access("Drivers", "edit")
							<a href="{{ url(config('laraadmin.adminRoute') . '/drivers/'.$driver->id.'/rates') }}" class="btn btn-xs btn-edit btn-default" ><i class="fa fa-pencil"></i></a><br>
						@endla_access	
					</div>
						<h4>Rates</h4>
			</div>
				<div class="panel-body">
		    <table id="example1" class="table">
		     <thead>
              <tr>
	                <th>Name</th>
	                <th>Duration</th>
	                <th>Price (£)</th>	                                  
              </tr>
              @if(!empty($fares))
              @foreach($fares as $fare)
               @if($fare->fare_status == 'duration')
               <tr> 
                  <td>{{$fare->fare_name}}</td>              
                  <td>{{$fare->fare_duration}}</td>
                  <td>{{$fare->fare_price}}</td>  
               </tr>   
               @endif 
              @endforeach
              @foreach($fares as $fare)
               @if($fare->fare_status == 'mile')
               {{--*/ $vars = explode('/',$fare->fare_duration); /*--}}
               {{--*/ $i=0; $fare_price = explode('/',$fare->fare_price); /*--}}
               @foreach($vars as $var)
               <tr> 
                  <td>{{$fare->fare_name}}</td>              
                  <td>{{$var}}</td>
                  <td>{{$fare_price[$i]}}</td>  
               </tr>  
               {{--*/ $i++; /*--}}
               @endforeach 
               @endif           
              @endforeach
              @endif
				 </thead>
		    </table>
			 </div>
			<!--<div class="text-center p30"><i class="fa fa-list-alt" style="font-size: 100px;"></i> <br> No posts to show</div>-->
		</div>
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="ride_history">
			<div class="panel-default panel-heading">
						<h4>Ride history</h4>
			</div>
			<div class="panel-body">			
		    <table id="example21" class="table table-bordered">
				<thead>
				<tr class="success">
					@foreach( $listing_cols as $col )
					<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
					@endforeach		
				</tr>
				</thead>
				<tbody>
				 @if(!empty($rideDatas))
				 {{--*/ $k=1; /*--}}
				 @foreach($rideDatas as $rideData)				 
				 <tr>                                     
           <td>                              
				   @if(empty($rideData->rides_status))
					 <span class="label label-success">Pending</span>
					 @elseif(!empty($rideData->rides_status) && $rideData->rides_status == 'cancel')
					 <span class="label label-danger">{{$rideData->rides_status}}</span>
					 @elseif(!empty($rideData->rides_status) && $rideData->rides_status == 'completed')
					 <span class="label label-warning">{{$rideData->rides_status}}</span>
					 @endif
					 </td>
					 <td><?= date('l, F d, Y (H:i)',strtotime($rideData->date_time_slot)) ?></td>
					 <td>{{$rideData->client_first_name}} {{$rideData->client_last_name}}</td>
					 <td>{{$rideData->client_email}}</td>
					 <td>{{$rideData->client_phone}}</td>
					 <td>{{$k}}</td>
				 </tr>
				 {{--*/ $k++; /*--}}
				 @endforeach
				 @endif
				</tbody>
				</table>
       </div>	
		</div>

	</div>
	</div>
	</div>
</div>

@endsection
@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#example21").DataTable({
		processing: true,		
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},	
	});
	$("#driver-add-form").validate({
		
	});

});

</script>
@endpush