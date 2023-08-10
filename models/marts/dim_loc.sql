with 
    erp_endereco as (
        select *
        from {{ ref('stg_erp__address') }}

    ),

    erp_estado as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    ),

    erp_territorio as (
        select *
        from {{ ref('stg_erp__salesterritory') }}
    ),

    join_endereco_estado_territorio as (
        select
            erp_estado.territorioID,
            erp_endereco.enderecoID,
            erp_endereco.estadoID,
            erp_estado.codigoEstado,
            erp_estado.nomeEstado,
            erp_endereco.cidade,
            erp_estado.codigoPais,
            erp_territorio.nomePais,
            erp_territorio.regiao

        from erp_endereco
        left join erp_estado on erp_endereco.estadoID = erp_estado.estadoID
        left join erp_territorio on erp_estado.territorioID = erp_territorio.territorioID
    )

    select *
    from join_endereco_estado_territorio