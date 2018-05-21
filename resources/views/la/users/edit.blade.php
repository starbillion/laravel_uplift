@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/users') }}">User</a> :
@endsection

@section("contentheader_description", $user->first_name ." ". $user->last_name)

@section("section", "Users")

@section("section_url", url(config('laraadmin.adminRoute') . '/users'))
@section("sub_section", "Edit")



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
				{!! Form::model($user, ['route' => [config('laraadmin.adminRoute') . '.users.update', $user->id ], 'method'=>'PUT', 'id' => 'user-edit-form']) !!}
				{{--	@la_form($module) --}}
					
					
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')	
					@la_input($module, 'email')
				{{--	@la_input($module, 'address_line_1')
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
						 <option value="{{$role->id}}" <?php if($role->id == $user->user_type){echo 'selected="selected"';} ?>>{{$role->display_name}}</option>
						@endforeach
					</select>
					</div>
					@la_input($module, 'country_code')
					@la_input($module, 'telephone')
					@la_input($module, 'mobile_number')					
				{{-- @la_input($module, 'status')	--}}

					<!--div class="col-sm-8" style="display: none">
					 <input type="hidden" value="" name="mot_expire_date" id="mot_expire_date"/>
					</div-->	
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/users') }}">Cancel</a></button>
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
        var url ="<?= URL::to('/').'/admin/get_model_ajax/' ?>"+$(this).val();   
			  $.ajax({
			  method: "GET",
			  url: url,			
			})
			  .done(function( html ) {
			    $('select[name ="model"]').html(html);
			 });
	});

	/*	  $('input[name="mot_issue_date"]').blur(function(){		
					var d= $(this).val().split('/');
					var dt = new Date(d[2],d[1],d[0]);
         var date = add_months(dt, 5).toString();
         var mot_expire_date =convert(date);
        $('input[name="mot_expire_date"]').val(mot_expire_date); 
		});*/
});
setTimeout(function(){ 

	$('select[name ="make"]').trigger('change'); 
  if($('input[name ="mot_issue_date"]').val() != ''){
  //	mot_expire_date($('input[name ="mot_issue_date"]').val());
  }

}, 500);

function mot_expire_date(val){
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
