{{config(materialized='table',schema=env_var('DBT_TRANSFORMINGSCHEMA', 'transforming_dev'))}}

{% set min_order_date = get_min_order_date() %}
{% set max_order_date = get_max_order_date() %}

{{ dbt_date.get_date_dimension(min_order_date,max_order_date) }}