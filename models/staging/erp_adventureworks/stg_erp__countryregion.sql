with 

source as (

    select * from {{ source('erp', 'countryregion') }}

),

renamed as (

    select
        cast (countryregioncode as string) as codigoPais ,
        cast(name as string) as nomePais
    

    from source

)

select * from renamed
