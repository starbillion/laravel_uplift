@extends("la.layouts.app")

@section("contentheader_title", "Set Availabilities")
@section("contentheader_description", "Set Availabilities listing")
@section("section", "Set Availabilities")
@section("sub_section", "Listing")
@section("htmlheader_title", "Set Availabilities Listing")

@section("headerElems")
@la_access("Set_Availabilities", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Set Availability</button>
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
		<table id="example1" class="table table-bordered" style="    ">
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

@la_access("Set_Availabilities", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Set Availability</h4>
			</div>
			{!! Form::open(['action' => 'LA\Set_AvailabilitiesController@store', 'id' => 'set_availability-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
          {{-- @la_form($module)
					
					
					@la_input($module, 'sunday_to')
					@la_input($module, 'sunday_from')
					@la_input($module, 'monday_to')
					@la_input($module, 'monday_from')
					--}}


      <div class="row">
           <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Sunday</label>
              </div>
                <p id="sunday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="sunday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="sunday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="monday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="monday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="tuesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="tuesday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="wednesday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="wednesday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="thursday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="thursday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="friday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="friday_from" autocomplete="off">
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
                  <input type="text" class="time start form-control ui-timepicker-input" value="" name="saturday_to" autocomplete="off">
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control ui-timepicker-input" value="" name="saturday_from" autocomplete="off">
                </span>
                </p>
              </div>
            </div>
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
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.css') }}"/>
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/css/jquery-confirm.min.css') }}"/>

<style type="text/css">
	.form-control {
    border-radius: 0;
    box-shadow: none;
    border-color: #d2d6de;
    border-radius: 4px;
}
div#example1_wrapper .row:nth-child(2) {
    padding: 0px 20px 10px 20px!important;
}
</style>
@endpush

@push('scripts')
 <script src="{{ asset('la-assets/plugins/timepicker/jquery.timepicker.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/datepair.js') }}"></script>
 <script src="{{ asset('la-assets/plugins/datepair/jquery.datepair.js') }}"></script>
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script src="{{ asset('la-assets/js/pages/jquery-confirm.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/set_availability_dt_ajax') }}",
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
	$("#set_availability-add-form").validate({
		
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

