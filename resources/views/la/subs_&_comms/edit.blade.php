@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/subs_&_comms') }}">Subs & Comm</a> :
@endsection
@section("contentheader_description", $subs_&_comm->$view_col)
@section("section", "Subs & Comms")
@section("section_url", url(config('laraadmin.adminRoute') . '/subs_&_comms'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Subs & Comms Edit : ".$subs_&_comm->$view_col)

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
				{!! Form::model($subs_&_comm, ['route' => [config('laraadmin.adminRoute') . '.subs_&_comms.update', $subs_&_comm->id ], 'method'=>'PUT', 'id' => 'subs_&_comm-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'subscription_name')
					@la_input($module, 'commission')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/subs_&_comms') }}">Cancel</a></button>
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
	$("#subs_&_comm-edit-form").validate({
		
	});
});
</script>
@endpush
