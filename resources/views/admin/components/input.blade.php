<div class="form-group">
    <label for="{{ $name }}">{{ $text }}</label>
    <input class="form-control" type="text" id="{{ $name }}" name="{{ $name }}"
        value="{{ $model != '' ? old($name, $model->$name) : old($name) }}">
    @error($name)
        <div class="alert alert-danger">{{ $message }}</div>
    @enderror
</div>
