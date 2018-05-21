@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/vat_reports') }}">Vat Report</a> :
@endsection
@section("contentheader_description", $vat_report->$view_col)
@section("section", "Vat Reports")
@section("section_url", url(config('laraadmin.adminRoute') . '/vat_reports'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Vat Reports Edit : ".$vat_report->$view_col)

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
				{!! Form::model($vat_report, ['route' => [config('laraadmin.adminRoute') . '.vat_reports.update', $vat_report->id ], 'method'=>'PUT', 'id' => 'vat_report-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'vat')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/vat_reports') }}">Cancel</a></button>
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
	$("#vat_report-edit-form").validate({
		
	});
});
</script>
@endpush
