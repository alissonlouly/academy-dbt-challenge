with 

source_address as (

    select * from {{ source('erp', 'address') }}

),

renamed as (

    select
        cast(addressid as int) as enderecoID,
        city as cidade,
        stateprovinceid as estadoID,
        

    from source_address

)

select * from renamed
