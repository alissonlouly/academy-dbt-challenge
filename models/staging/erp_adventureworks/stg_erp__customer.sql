with    
    source_customer as (
        select 
        cast(customerid as int)  as clienteID,	
        cast (personid as int)	as pessoaID,
        cast (storeid as int)	as lojaID,
        cast (territoryid as int)  territorioID
        
        
        from {{ source('erp', 'customer') }} 
    )

select *
from source_customer