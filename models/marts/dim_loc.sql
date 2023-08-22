with 
    erp_endereco as (
        select *
        from {{ ref('stg_erp__address') }}

    ),

    erp_estado as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    ),

    erp_pais as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    ),

    join_endereco_estado_pais as (
        select
            erp_estado.territorioID,
            erp_endereco.enderecoID,
            erp_endereco.estadoID,
            erp_estado.codigoEstado,
            erp_estado.nomeEstado,
            erp_endereco.cidade,
            erp_estado.codigoPais,
            erp_pais.nomePais,
           

        from erp_endereco
        left join erp_estado on erp_endereco.estadoID = erp_estado.estadoID
        left join erp_pais on erp_estado.codigoPais = erp_pais.codigoPais
    )

    select *
    from join_endereco_estado_pais