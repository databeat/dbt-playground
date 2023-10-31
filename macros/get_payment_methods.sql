{# Macro to get the distinct payment_methods #}
{% macro get_payment_methods() %}

    {{ return(get_distinct_column_values("payment_method", ref("stg_stripe_order_payments"))) }}

{% endmacro %}
