@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}">Rates</a> :
@endsection
@section("contentheader_description", $driver->$view_col)
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
	
    {{--*/ $availability_id=!empty($driver->id) ? $driver->id :'';      /*--}}

        @if(!empty($availability_id))
        {!!Form::open(array('action' => array('LA\DriversController@ratesupdate', $availability_id ),'method'=>'POST', 'id' => 'avail-edit-form')) !!}
      
       @else

        {!!Form::open(array('action' => array('LA\DriversController@ratescreate', $availability_id ),'method'=>'POST', 'id' => 'avail-edit-form')) !!}

       @endif

				{{--	@la_form($module) --}}
					
					
				{{-- 	
				  @la_input($module, 'fullname')
					@la_input($module, 'email')
					@la_input($module, 'address')
					@la_input($module, 'country_code')
					@la_input($module, 'telephone')
					@la_input($module, 'mobile_number')
					@la_input($module, 'profile_pic')
					@la_input($module, 'make')
					@la_input($module, 'model')
					@la_input($module, 'colour')
					@la_input($module, 'registration')
					@la_input($module, 'upload_doc')
					@la_input($module, 'upload_mot_doc')
					@la_input($module, 'license')
					@la_input($module, 'pco_doc')
					@la_input($module, 'insurance_doc')
					@la_input($module, 'name')					
					@la_input($module, 'status')	
			  --}}
<div class="modal-body" style="padding: 0px 0px 0px 0px;">
  <div class="box-body"> 
  {{--*/ 

  $m_fare_p = !empty($m_fares[0]->fare_price)?explode('/',$m_fares[0]->fare_price):''; 

  /*--}}
      <div class="row">
      <table id="fare_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
          <thead>
          <tr>
            <th>Name</th>
            <th class="fare_duration">Hourly Hire</th>
            <th class="fare_mile" style="display: none;">Fare type</th>
            <th>Price (£)</th>         
           
            </tr>
           </thead>
           <tbody>
          
          @foreach($fares as $fare)

          <tr id="removeRow_0" class="fare_duration">                 
            <td>
            <input type="text" name="d_fare_name[]" readonly="readonly" value="{{!empty($fare->plan_name)?$fare->plan_name:''}}" required="" class="form-control" placeholder="Name">
             <input type="hidden" name="plan_id[]" readonly="readonly" value="{{!empty($fare->id)?$fare->id:''}}" required="" class="form-control" placeholder="Name">
            </td>
            <td><input type="number" name="d_fare_duration[]"  readonly="readonly" value="{{!empty($fare->hour_ride)?$fare->hour_ride:''}}" min="0" required="" class="form-control" placeholder="Durtaion"></td>
            <td><input type="text" title="" class="form-control fare_price" name="d_fare_price[]" size="5" value="{{!empty($fare->fare_price)?$fare->fare_price:'00.00'}}" id="fare_price" placeholder="Price"><input type="hidden" name="d_fare_id[]" value="{{!empty($fare->fare_id)?$fare->fare_id:''}}"> </td> 
          </tr>

          @endforeach

        
          
           @foreach($m_fares as $m_fare)

           <tr id="removeRow_3" class="fare_mile fare_miles" > 
            <td>{{!empty($m_fare->plan_name)?$m_fare->plan_name:''}} <input type="hidden" name="m_fare_name[]" value="{{!empty($m_fare->plan_name)?$m_fare->plan_name:''}}" class="form-control" placeholder="Name"></td>
            <td>{{!empty($m_fare->hour_ride)?$m_fare->hour_ride:''}}<input type="hidden" name="m_fare_duration[]" value="{{!empty($m_fare->hour_ride)?$m_fare->hour_ride:''}}" class="form-control" placeholder="Name">
            <input type="hidden" name="m_plan_id[]" readonly="readonly" value="{{!empty($m_fare->id)?$m_fare->id:''}}" required="" class="form-control" placeholder="Name">
             </td>
            <td><input type="text" title="" class="form-control fare_price" name="m_fare_price[]" size="5" value="{{!empty($m_fare->fare_price)?$m_fare->fare_price:'00.00'}}" id="fare_price" placeholder="Price"><input type="hidden" name="m_fare_id[]" value="{{!empty($m_fare->fare_id)?$m_fare->fare_id:''}}"> </td>
     
          </tr>
           @endforeach
            

                  </tbody> 
       </table>
       </div>   

                <input type="hidden" name="users_id" value="{{$driver->id}}">
                <input type="hidden" name="users_name" value="lucky">
         <br>
         <div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}">Cancel</a></button>
					</div>
              <!-- /.box-body -->
              
   

     </div>
    </div>
                   
		
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.css') }}"/>
@endpush

@push('scripts')
 <script src="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/datepair.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/jquery.datepair.js') }}"></script>
<script>

$(function () {
	$('select[name ="make"]').change(function(){	
        var url ="<?= URL::to('/').'/admin/get_model_ajax/' ?>"+$(this).val();   
			  $.ajax({
			  method: "GET",
			  url: url,			
			})
			  .done(function( html ) {
			    $('select[name ="model"]').html(html);
			 });
	});
});
setTimeout(function(){ $('select[name ="make"]').trigger('change'); }, 500);
</script>
      <script>
          // initialize input widgets first
          $('#sunday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });    

          $('#monday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          }); 

          $('#tuesday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#wednesday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#thursday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#friday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#saturday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });


          // initialize datepair
         $('#sunday').datepair();
          $('#monday').datepair();
          $('#tuesday').datepair();
          $('#wednesday').datepair();
          $('#thursday').datepair();
          $('#friday').datepair();
          $('#saturday').datepair();

      </script>
@endpush
