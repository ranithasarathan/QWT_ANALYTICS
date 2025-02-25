import snowflake.snowpark.functions as f

def model(dbt, session):
    
    dbt.config(materialized = 'table')
    
    shipments_df = dbt.ref("shipment_snapshot")
    shippers_df = dbt.ref("lkp_shippers")

    final_shipment_df = (
                            shipments_df.join(shippers_df, shipments_df.shipperid == shippers_df.shipperid,'left')
                            .select(
                                        shipments_df.orderid,
                                        shipments_df.lineno,
                                        shipments_df.shipmentdate,
                                        shipments_df.status,
                                        shippers_df.companyname
                            )
                        )

    final_shipment_df = final_shipment_df.filter(f.col('dbt_valid_to').isNull())                        
    
    return final_shipment_df