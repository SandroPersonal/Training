
{{
    config(
        materialized ='incremental',
        incremental_strategy = "delete+insert",
        unique_key='O_ORDERKEY'
    )
}}
select * from {{ source('kenx_training_database', 'orders') }} o 
join {{ source('kenx_training_database', 'customer') }} c on o.o_custkey = c.c_custkey
-- where o.o_custkey = 750415



