@extends("la.layouts.app")

@section("contentheader_title", "Users")
@section("contentheader_description", "Users listing")
@section("section", "Users")
@section("sub_section", "Listing")
@section("htmlheader_title", "Users Listing")

@section("headerElems")
@la_access("Users", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add User</button>
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

@la_access("Users", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add User</h4>
			</div>
			{!! Form::open(['action' => 'LA\UsersController@store', 'id' => 'driver-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
           {{--  @la_form($module) --}}

					@la_input($module, 'first_name')
					@la_input($module, 'last_name')					
					@la_input($module, 'email')
					@la_input($module, 'password')
			{{--@la_input($module, 'address_line_1')
					@la_input($module, 'address_line_2')						
					@la_input($module, 'address_line_3')
					@la_input($module, 'town')
					@la_input($module, 'city')
					@la_input($module, 'county')
					@la_input($module, 'postcode')
					@la_input($module, 'country')--}}
					<div class="form-group">
					<label for="first_name">Roles* :</label>
						<select required="required" name="user_type" class="form-control">
						 <option value="">Select</option>
						@foreach($roles as $role)
						 <option value="{{$role->id}}">{{$role->display_name}}</option>
						@endforeach
					</select>
					</div>
				
					@la_input($module, 'country_code')
					@la_input($module, 'telephone')
					@la_input($module, 'mobile_number')						
				{{-- @la_input($module, 'status')	 --}}	
					
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
        ajax: "{{ url(config('laraadmin.adminRoute') . '/user_dt_ajax') }}",
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
			    $('select[name ="model"]').html(html);
			 });
	});

		 $('input[name="mot_issue_date"]').blur(function(){		
					var d= $(this).val().split('/');
					var dt = new Date(d[2],d[1],d[0]);
         var date = add_months(dt, 5).toString();
         var mot_expire_date =convert(date);
        $('input[name="mot_expire_date"]').val(mot_expire_date); 
			});

});
setTimeout(function(){ 
	$('select[name ="make"]').trigger('change');
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
