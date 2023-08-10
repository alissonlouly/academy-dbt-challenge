with 

source_territory as (

    select * from {{ source('erp', 'salesterritory') }}

),

renamed as (

    select
        cast (territoryid as int) as territorioID,
        name as nomePais,
        countryregioncode as codigoPais,
        source_territory.group as regiao
        

    from source_territory

)

select * from renamed
