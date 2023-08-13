with
    clientes as (
        select*
        from {{ ref('dim_clientes') }}
    ),

    loc as (
        select*
        from {{ ref('dim_loc') }}
    ),

    produtos as (
        select*
        from {{ ref('dim_produtos') }}
    ),

    razaovendas as (
        select*
        from {{ ref('dim_razaovendas') }}
    ),

    datas as (
        select*
        from {{ ref('dim_datas') }}
    ),

    pedidos_itens as (
        select*
        from {{ ref('int_sales_orders') }}
    ),

    joined_tabelas as (
        select
            pedidos_itens.pk_vendas,
            produtos.produtoID,
            pedidos_itens.pedidoID,
            pedidos_itens.clienteID,
            pedidos_itens.cartaoID,
            pedidos_itens.territoryID,
            pedidos_itens.enderecoCompraID,
            pedidos_itens.enderecoEntregaID,
            pedidos_itens.pessoaID,
            pedidos_itens.pedidoDetalheID,
            pedidos_itens.ofertaID,
            pedidos_itens.status,
            pedidos_itens.pedidoOnline,
            pedidos_itens.numeropedido,
            pedidos_itens.numeroConta,
            pedidos_itens.tipoEntrega,
            pedidos_itens.cartaoAprovadoCodigo,
            pedidos_itens.taxaCambio,
            pedidos_itens.subtotal,
            pedidos_itens.imposto,
            pedidos_itens.frete ,
            pedidos_itens.total,
            pedidos_itens.dataPedido,
            pedidos_itens.dataVencimento,
            pedidos_itens.dataEntrega,
            pedidos_itens.codigoRastreio,
            produtos.nomeProduto,
            produtos.categoriaProduto,
            pedidos_itens.quantidadePedido,
            pedidos_itens.precoUnitario,
            pedidos_itens.descontoUnitario


        from pedidos_itens
        left join produtos on pedidos_itens.produtoID = produtos.produtoID
        
    ),

    transformacoes as (
        select
            *,
            (quantidadePedido*precoUnitario) as  totalBruto,
            ((quantidadePedido*precoUnitario)*(1-descontoUnitario)) as totalLiquido,
            frete / (count (*) over (partition by pedidoID)) as fretePorItem
            from joined_tabelas
    )



    select *
    from transformacoes