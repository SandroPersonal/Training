{{ config(materialized='table') }}
select
ps.PS_SUPPKEY as part_supplier_key,
p.P_PARTKEY as part_key,
p.P_NAME as part_name,
p.P_MFGR as manufacturer,
p.P_BRAND as brand,
p.P_TYPE as part_type,
p.P_SIZE as part_size,
p.P_CONTAINER as container,
p.P_RETAILPRICE as retail_price,

s.S_SUPPKEY as supplier_key,
s.S_NAME as supplier_name,
s.S_ADDRESS as supplier_address,
s.S_PHONE as phone_number,
s.S_ACCTBAL as account_balance,
s.S_NATIONKEY as nation_key,

ps.PS_AVAILQTY as available_quantity,
ps.PS_SUPPLYCOST as cost
from part_suppliers ps
join parts p on p_partkey = ps_partkey
join suppliers s on s_suppkey = ps_suppkey
order by p.P_PARTKEY