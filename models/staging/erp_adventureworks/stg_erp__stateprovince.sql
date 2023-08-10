with 

source_state as (

    select * from {{source('erp', 'stateprovince') }}

),

renamed as (

    select
        stateprovinceid as estadoID,
        stateprovincecode as codigoEstado,
        countryregioncode as codigoPais,
        name as nomeEstado,
        territoryid as territorioID,
        

    from source_state

)

select * from renamed
