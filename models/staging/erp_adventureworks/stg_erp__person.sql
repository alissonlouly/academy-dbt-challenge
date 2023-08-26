with 

source_person as (

    select * from {{ source('erp', 'person') }}

),

source_person_card as (
    select * from {{ source('erp','personcreditcard') }}
),

source_credit_card as (
    select * from {{ source('erp','creditcard') }}
),

join_person_credit_card as (

    select
        cast (source_person.businessentityid as int) as businessID,
        source_person.persontype as tipoPessoa,
        source_person.firstname nome,
        source_person.lastname sobrenome,
        source_person.firstname || ' ' || source_person.lastname as nomeCompleto,
        source_person_card.creditcardid as cartaoID,
        source_credit_card.cardtype as tipoCartao

    from source_person
    left join source_person_card on source_person.businessentityid = source_person_card.businessentityid
    left join source_credit_card on source_person_card.creditcardid = source_credit_card.creditcardid
    
    

)

select * from join_person_credit_card
