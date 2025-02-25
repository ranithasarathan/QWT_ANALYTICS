{% snapshot shipment_snapshot %}

{{
    config
    (
        target_database = 'QWT_ANALYTICS_DEV',
        target_schema = 'snapshot_dev',

        unique_key = "orderid||'-'||LineNo",
        strategy = 'timestamp',
        updated_at = 'ShipmentDate'

    )  
}}

select * from {{ref('stg_shipments')}}

{% endsnapshot %}