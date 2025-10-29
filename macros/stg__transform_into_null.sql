{% macro transform_into_null(column_name) %}
    case
        {% for i in var('null_list') %}
            when {{ column_name }} = '{{ i }}' then null
        {% endfor %}
        else {{ column_name }}
    end
{% endmacro %}