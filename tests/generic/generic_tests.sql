
{% test empty_string(model,column_name) %}
    select {{ column_name }}
    from {{ model }}
    where trim({{ column_name }}) = ''

{% endtest %}

{% test positive_check(model,column_name) %}

select {{column_name}}
from {{model}}
where {{column_name}} < 0

{%endtest%}