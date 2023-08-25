    with 
    erp_clientes as (
        select *
        from {{ ref('stg_erp__customer') }}

    ),

    erp_pessoas as (
        select *
        from {{ ref('stg_erp__person') }}
    ),

    join_clientes_pessoas as (
        select
            erp_clientes.clienteID,
            erp_pessoas.cartaoID,
            erp_clientes.pessoaID,
            erp_clientes.lojaID,
            erp_clientes.territorioID,
            erp_pessoas.nomeCompleto,
            erp_pessoas.tipoPessoa,
            erp_pessoas.tipoCartao
            
        from erp_pessoas
        inner join erp_clientes on erp_pessoas.businessID = erp_clientes.pessoaID
    )

    select *
    from join_clientes_pessoas
