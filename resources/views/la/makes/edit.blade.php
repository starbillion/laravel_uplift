@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/makes') }}">Make</a> :
@endsection
@section("contentheader_description", $make->$view_col)
@section("section", "Makes")
@section("section_url", url(config('laraadmin.adminRoute') . '/makes'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Makes Edit : ".$make->$view_col)

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
				
				{!! Form::model($make, ['route' => [config('laraadmin.adminRoute') . '.makes.update', $make->id ], 'method'=>'PUT', 'id' => 'make-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'make_value')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/makes') }}">Cancel</a></button>
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
	$("#make-edit-form").validate({
		
	});
});
</script>
@endpush
