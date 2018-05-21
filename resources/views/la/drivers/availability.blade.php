@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/drivers') }}">Availability</a> :
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
	
    {{--*/ $availability_id=!empty($availability->users_id) ? $availability->users_id :'';      /*--}}

        @if(!empty($availability_id))
        {!!Form::open(array('action' => array('LA\DriversController@availableupdate', $availability_id ),'method'=>'POST', 'id' => 'avail-edit-form')) !!}
      
       @else

        {!!Form::open(array('action' => array('LA\DriversController@availablecreate', $availability_id ),'method'=>'POST', 'id' => 'avail-edit-form')) !!}

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
      <div class="row">
           <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Sunday</label>
              </div>
                <p id="sunday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->sunday_to)?$availability->sunday_to:'00:00'}}" name="sunday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->sunday_from)?$availability->sunday_from:'00:00'}}" name="sunday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Monday</label>
              </div>
                <p id="monday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->monday_to)?$availability->monday_to:'00:00'}}" name="monday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->monday_from)?$availability->monday_from:'00:00'}}" name="monday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>

            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Tuesday</label>
              </div>
                <p id="tuesday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->tuesday_to)?$availability->tuesday_to:'00:00'}}" name="tuesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->tuesday_from)?$availability->tuesday_from:'00:00'}}" name="tuesday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Wednesday</label>
              </div>
                <p id="wednesday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->wednesday_to)?$availability->wednesday_to:'00:00'}}" name="wednesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->wednesday_from)?$availability->wednesday_from:'00:00'}}" name="wednesday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Thursday</label>
              </div>
                <p id="thursday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->thursday_to)?$availability->thursday_to:'00:00'}}" name="thursday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->thursday_from)?$availability->thursday_from:'00:00'}}" name="thursday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Friday</label>
              </div>
                <p id="friday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->friday_to)?$availability->friday_to:'00:00'}}" name="friday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->friday_from)?$availability->friday_from:'00:00'}}" name="friday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Saturday</label>
              </div>
                <p id="saturday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($availability->saturday_to)?$availability->saturday_to:'00:00'}}" name="saturday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($availability->saturday_from)?$availability->saturday_from:'00:00'}}" name="saturday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
        </div>   

                <input type="hidden" name="users_id" value="{{$driver->id}}">
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
