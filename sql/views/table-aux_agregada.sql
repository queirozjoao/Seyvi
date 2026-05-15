# O CODIGO ABAIXO AGREGA A TABELA BOLETOS COM A TABELA NOMEADA COMO AUX_AGREGADA.#
create or replace table nuclea_raw.auxiliar agregada as 
select
b.*,
a.cd_cnae_prin,
a.Atividade,
a.Setor
FROM nuclea_raw.boletos as b
inner join nuclea_raw.base agregada as a
On b.id_beneficiario = a.id_cnpj
