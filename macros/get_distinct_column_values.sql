{# Generic macro. Given column and table names, output the distinct values for that column in the table. #}
{% macro get_distinct_column_values(column_name, table_name) %}

    {% set distinct_values_query %}
    select distinct {{ column_name }}
    from {{ table_name }}
    order by 1
    {% endset %}

    {% set results = run_query(distinct_values_query) %}

    {% if execute %}
        {# Return the first column #}
        {% set results_list = results.columns[0].values() %}
    {% else %} {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}

{% endmacro %}
