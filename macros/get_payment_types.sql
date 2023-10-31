{# Macro to get the distinct payment_types #}
{% macro get_payment_types() %}

    {{ return(get_distinct_column_values("payment_type", ref("stg_stripe_order_payments"))) }}

{% endmacro %}
