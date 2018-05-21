@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/set_availabilities') }}">Set Availability</a> :
@endsection
@section("contentheader_description", $set_availability->$view_col)
@section("section", "Set Availabilities")
@section("section_url", url(config('laraadmin.adminRoute') . '/set_availabilities'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Set Availabilities Edit : ".$set_availability->$view_col)

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
				{!! Form::model($set_availability, ['route' => [config('laraadmin.adminRoute') . '.set_availabilities.update', $set_availability->id ], 'method'=>'PUT', 'id' => 'set_availability-edit-form']) !!}
					{{--@la_form($module)					
					@la_input($module, 'sunday_to')
					@la_input($module, 'sunday_from')
					@la_input($module, 'monday_to')
					@la_input($module, 'monday_from')
					@la_input($module, 'tuesday_to')
					@la_input($module, 'tuesday_from')
					@la_input($module, 'wednesday_to')
					@la_input($module, 'wednesday_from')
					@la_input($module, 'thursday_to')
					@la_input($module, 'thursday_from')
					@la_input($module, 'friday_to')
					@la_input($module, 'friday_from')
					@la_input($module, 'saturday_to')
					@la_input($module, 'saturday_from')
					--}}
					      <div class="row">
           <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Sunday</label>
              </div>
                <p id="sunday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->sunday_to)?$set_availability->sunday_to:''}}" name="sunday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->sunday_from)?$set_availability->sunday_from:''}}" name="sunday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->monday_to)?$set_availability->monday_to:''}}" name="monday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->monday_from)?$set_availability->monday_from:''}}" name="monday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->tuesday_to)?$set_availability->tuesday_to:''}}" name="tuesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->tuesday_from)?$set_availability->tuesday_from:''}}" name="tuesday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->wednesday_to)?$set_availability->wednesday_to:''}}" name="wednesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->wednesday_from)?$set_availability->wednesday_from:''}}" name="wednesday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->thursday_to)?$set_availability->thursday_to:''}}" name="thursday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->thursday_from)?$set_availability->thursday_from:''}}" name="thursday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->friday_to)?$set_availability->friday_to:''}}" name="friday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->friday_from)?$set_availability->friday_from:''}}" name="friday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="{{!empty($set_availability->saturday_to)?$set_availability->saturday_to:''}}" name="saturday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="{{!empty($set_availability->saturday_from)?$set_availability->saturday_from:''}}" name="saturday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
        </div> 
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/set_availabilities') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection


@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.css') }}"/>

<style type="text/css">
	.form-control {
    border-radius: 0;
    box-shadow: none;
    border-color: #d2d6de;
    border-radius: 4px;
}
</style>
@endpush

@push('scripts')
 <script src="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/datepair.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/jquery.datepair.js') }}"></script>
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#set_availability-edit-form").validate({
		
	});
});
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

