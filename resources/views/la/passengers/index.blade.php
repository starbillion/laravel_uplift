@extends("la.layouts.app")

@section("contentheader_title", "Passengers")
@section("contentheader_description", "Passengers listing")
@section("section", "Passengers")
@section("sub_section", "Listing")
@section("htmlheader_title", "Passengers Listing")

@section("headerElems")
@la_access("Passengers", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Passenger</button>
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
		<table id="example1" class="table table-bordered" onload="pop_alert();">
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

@la_access("Passengers", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Passenger</h4>
			</div>
			{!! Form::open(['action' => 'LA\PassengersController@store', 'id' => 'passenger-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
         {{--  @la_form($module) 	--}}					
					
					@la_input($module, 'client_first_name')
					@la_input($module, 'client_last_name')
					@la_input($module, 'client_email')
					@la_input($module, 'country_code')
					@la_input($module, 'client_phone')
				
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
        ajax: "{{ url(config('laraadmin.adminRoute') . '/passenger_dt_ajax') }}",
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
	$("#passenger-add-form").validate({
		
	});
});

</script>
@endpush
