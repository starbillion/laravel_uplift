@extends("la.layouts.app")

@section("contentheader_title", "Permissions")
@section("contentheader_description", "permissions listing")
@section("section", "Permissions")
@section("sub_section", "Listing")
@section("htmlheader_title", "Permissions Listing")

@section("headerElems")
@la_access("Permissions", "create")
	<!--button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Permission</button-->
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
	 <?php
      $menuItems = Dwij\Laraadmin\Models\Menu::where("parent", 0)->orderBy('hierarchy', 'asc')->get();
    ?>
    {!! Form::open(['action' => 'LA\PermissionsController@store', 'id' => 'driver-add-form']) !!}
	  <?php $i = 0; ?>

	  @foreach ($user_roles as $user_role)	  
    <?php $role=str_replace(' ','_',strtolower($user_role->display_name)); ?>
    <input type="hidden" name="roles[]" value="<?= $role;?>" >
		<div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse_<?= $i ?>"><i class="fa fa-bars"></i> Permissions for: {{$user_role->display_name}}</a></h4>
                          </div>  
                          <div id="collapse_<?= $i ?>" class="panel-collapse collapse in">
                            <div class="panel-body table-responsive">
                              <table class="table table-bordered dt-responsive rolesPermissionTable">
                                <thead>
                                  <tr class="showRolesPermission">
                                    <th scope="col">Modules</th>
                                    <th scope="col">Read</th>
                                    <th scope="col">Create</th>
                                    <th scope="col">Update</th>
                                    <th scope="col">Delete</th>
                                  </tr>
                                </thead>
                                <tbody> 

                               <?php $j=0;?> 
                               @foreach ($role_modules as $role_module)   
                                @if($role_module->role_id == $user_role->id)                           
                                <?php $modules = DB::table('modules')->where('id',$role_module->module_id)->first();
                         
                                $activeModule= \Dwij\Laraadmin\Helpers\LAHelper::activeModule($modules->name);  ?>

                                @if(!empty($activeModule))
                                      <tr>
                                        <th scope="row" class="thfont">{{str_replace('_',' ',$activeModule)}}</th>
                                        <td>
                                        <input type="hidden" name="data[<?=$role?>][<?= $j ?>][module_id]"  value="<?= $role_module->module_id ?>">
                                        <input type="hidden" name="data[<?=$role?>][<?= $j ?>][role_id]"  value="<?= $role_module->role_id ?>">
                                        <input type="checkbox" class="acc_view"  id="acc_view_<?=$role?>_<?= $j ?>" name="data[<?=$role?>][<?= $j ?>][acc_view]" value="1" <?php if($role_module->acc_view == 1) { echo 'checked="checked"';}?>></td>
                                        <td><input type="checkbox" class="acc_create reading"  data-id="<?=$role?>_<?= $j ?>" name="data[<?=$role?>][<?= $j ?>][acc_create]" value="1"<?php if($role_module->acc_create == 1) { echo 'checked="checked"';}?>></td>
                                        <td><input type="checkbox" class="chk_update reading"  data-id="<?=$role?>_<?= $j ?>" name="data[<?=$role?>][<?= $j ?>][acc_edit]" value="1"<?php if($role_module->acc_edit == 1) { echo 'checked="checked"';}?>></td>
                                        <td><input type="checkbox" class="chk_delete reading"  data-id="<?=$role?>_<?= $j ?>" name="data[<?= $role ?>][<?= $j ?>][acc_delete]" value="1"<?php if($role_module->acc_delete == 1) { echo 'checked="checked"';}?>></td>
                                      </tr> 
                                       <?php $j++;?>    
                                   @endif
                                  @endif
                                 @endforeach                
                                  </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                                  <?php $i++; ?>
                                 @endforeach
                             	<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				{!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
                                    
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
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/permission_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#permission-add-form").validate({
		
	});
  $('.reading').click(function(){

      var view = $(this).attr('data-id');  
      $('#acc_view_'+view).attr( "checked","checked");
  });
});
</script>
@endpush