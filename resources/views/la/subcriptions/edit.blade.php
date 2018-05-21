@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/subcriptions') }}">Subcription</a> :
@endsection
@section("contentheader_description", $subcription->$view_col)
@section("section", "Subcriptions")
@section("section_url", url(config('laraadmin.adminRoute') . '/subcriptions'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Subcriptions Edit : ".$subcription->$view_col)

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
				{!! Form::model($subcription, ['route' => [config('laraadmin.adminRoute') . '.subcriptions.update', $subcription->id ], 'method'=>'PUT', 'id' => 'subcription-edit-form']) !!}
				 {{--	@la_form($module) --}}
					
					
					@la_input($module, 'subscription_name')
					@la_input($module, 'commission')
					@la_input($module, 'subscription_amount')
				{{--	@la_input($module, 'subscription_valid')
					@la_input($module, 'vat') --}}
					
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/subcriptions') }}">Cancel</a></button>
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
	$("#subcription-edit-form").validate({
		
	});
});
</script>
@endpush
