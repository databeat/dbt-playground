{# Macro that, considering the target name, limits the amount of data queried for the nbr_months_of_data defined #}
{% macro limit_dataset_if_not_deploy_env(column_name, nbr_months_of_data) %}
    -- macro: limit_dataset_if_not_deploy_env
    {% if target.name != "deploy" -%}
        where
        {{ column_name }} > date_sub(current_date(), interval {{ nbr_months_of_data }} month)
    {%- endif %}
{% endmacro %}
