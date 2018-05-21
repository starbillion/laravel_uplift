@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/information_cards') }}">Information card</a> :
@endsection
@section("contentheader_description", $information_card->$view_col)
@section("section", "Information cards")
@section("section_url", url(config('laraadmin.adminRoute') . '/information_cards'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Information cards Edit : ".$information_card->$view_col)

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
				{!! Form::model($information_card, ['route' => [config('laraadmin.adminRoute') . '.information_cards.update', $information_card->id ], 'method'=>'PUT', 'id' => 'information_card-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'card_subject')
					@la_input($module, 'card_message')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/information_cards') }}">Cancel</a></button>
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
	$("#information_card-edit-form").validate({
		
	});
});
</script>
@endpush
