@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/passenger_subscriptions') }}">Passenger Subscription</a> :
@endsection
@section("contentheader_description", $passenger_subscription->$view_col)
@section("section", "Passenger Subscriptions")
@section("section_url", url(config('laraadmin.adminRoute') . '/passenger_subscriptions'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Passenger Subscriptions Edit : ".$passenger_subscription->$view_col)

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
				{!! Form::model($passenger_subscription, ['route' => [config('laraadmin.adminRoute') . '.passenger_subscriptions.update', $passenger_subscription->id ], 'method'=>'PUT', 'id' => 'passenger_subscription-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'subscription_price')
					@la_input($module, 'subscription_driver')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/passenger_subscriptions') }}">Cancel</a></button>
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
	$("#passenger_subscription-edit-form").validate({
		
	});
});
</script>
@endpush
