@php
    $params = [
        'id' => data_get($row, $primaryKey),
        'isHidden' => !$showToggleable,
        'tableName' => $tableName,
        'field' => $column->field,
        'toggle' => (int) $row->{$column->field},
        'trueValue' => $column->toggleable['default'][0],
        'falseValue' => $column->toggleable['default'][1],
    ];
@endphp

<div x-data="pgToggleable(@js($params))">
    @if ($column->toggleable['enabled'] && $showToggleable === true)

        <div class="custom-switch custom-switch-primary-inverse custom-switch-small pl-1">
            <input x-on:change="save()" class="custom-switch-input" :checked="{{ $params['toggle'] }} === 1"
                id="switch{{ $column->field }}{{ $params['id'] }}" type="checkbox">
            <label class="custom-switch-btn" for="switch{{ $column->field }}{{ $params['id'] }}"></label>
        </div>

        {{-- <div class="form-check form-switch">
            <label>
                <input class="form-check-input" type="checkbox">
            </label>
        </div> --}}
    @else
        <div class="text-center">
            @if ($row->{$column->field} == 0)
                <div x-text="falseValue" style="padding-top: 0.1em; padding-bottom: 0.1rem" class="badge bg-danger">
                </div>
            @else
                <div x-text="trueValue" style="padding-top: 0.1em; padding-bottom: 0.1rem" class="badge bg-success">
                </div>
            @endif
        </div>
    @endif
</div>
