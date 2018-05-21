@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/payments') }}">Payment</a> :
@endsection
@section("contentheader_description", $payment->$view_col)
@section("section", "Payments")
@section("section_url", url(config('laraadmin.adminRoute') . '/payments'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Payments Edit : ".$payment->$view_col)

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
				{!! Form::model($payment, ['route' => [config('laraadmin.adminRoute') . '.payments.update', $payment->id ], 'method'=>'PUT', 'id' => 'payment-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'first_name')
					@la_input($module, 'last_name')
					@la_input($module, 'transaction_id')
					@la_input($module, 'paid_amount')
					@la_input($module, 'amount')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/payments') }}">Cancel</a></button>
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
	$("#payment-edit-form").validate({
		
	});
});
</script>
@endpush
