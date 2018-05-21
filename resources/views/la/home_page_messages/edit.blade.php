@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/home_page_messages') }}">Home Page Message</a> :
@endsection
@section("contentheader_description", $home_page_message->$view_col)
@section("section", "Home Page Messages")
@section("section_url", url(config('laraadmin.adminRoute') . '/home_page_messages'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Home Page Messages Edit : ".$home_page_message->$view_col)

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
				{!! Form::model($home_page_message, ['route' => [config('laraadmin.adminRoute') . '.home_page_messages.update', $home_page_message->id ], 'method'=>'PUT', 'id' => 'home_page_message-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'welcome_title')
					@la_input($module, 'welcome_logo')
					@la_input($module, 'welcome_message')
					@la_input($module, 'welcome_footer')
					@la_input($module, 'quote_title')
					@la_input($module, 'quote_logo')
					@la_input($module, 'quote_message')
					@la_input($module, 'quote_footer')
					@la_input($module, 'update_title')
					@la_input($module, 'update_logo')
					@la_input($module, 'update_message')
					@la_input($module, 'update_footer')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/home_page_messages') }}">Cancel</a></button>
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
	$("#home_page_message-edit-form").validate({
		
	});
});
</script>
@endpush
