#O código abaixo cria as colunas de scores para os pilares A, S, G e dá o peso com base no prefixo do CNAE.#

CREATE OR REPLACE TABLE nuclea_raw.tabela_esg_final
AS 
WITH base_calculo as (
  SELECT
  *,
  SUBSTR(CAST(cd_cnae_prin as STRING), 1, 2) AS divisao_cnae,

  ABS(MOD(FARM_FINGERPRINT(id_beneficiario), 101)) as Score_A_bruto,

  ABS(MOD(FARM_FINGERPRINT(id_beneficiario), 101)) as Score_S_bruto,

  ABS(MOD(FARM_FINGERPRINT(id_beneficiario  || 'G'), 101)) as Score_G_bruto

  FROM nuclea_raw.auxiliar agregada
)

SELECT
*,
CASE
WHEN base_calculo.divisao_cnae in ('10', '11') 
THEN (base_calculo.Score_A_bruto * 0.45) + (base_calculo.Score_S_bruto * 0.20) + (base_calculo.Score_G_bruto * 0.40)

WHEN base_calculo.divisao_cnae in ('13', '19') 
THEN (base_calculo.Score_A_bruto * 0.35) + (base_calculo.Score_S_bruto * 0.25) + (base_calculo.Score_G_bruto * 0.40)

WHEN base_calculo.divisao_cnae in ('45', '47') 
THEN (base_calculo.Score_A_bruto * 0.20) + (base_calculo.Score_S_bruto * 0.45) + (base_calculo.Score_G_bruto * 0.35)

WHEN base_calculo.divisao_cnae in ('49', '53') 
THEN (base_calculo.Score_A_bruto * 0.45) + (base_calculo.Score_S_bruto * 0.20) + (base_calculo.Score_G_bruto * 0.35)

WHEN base_calculo.divisao_cnae in ('41', '43') 
THEN (base_calculo.Score_A_bruto * 0.25) + (base_calculo.Score_S_bruto * 0.45) + (base_calculo.Score_G_bruto * 0.30)

WHEN base_calculo.divisao_cnae in ('62', '63') 
THEN (base_calculo.Score_A_bruto * 0.10) + (base_calculo.Score_S_bruto * 0.45) + (base_calculo.Score_G_bruto * 0.45)

WHEN base_calculo.divisao_cnae in ('64', '66') 
THEN (base_calculo.Score_A_bruto * 0.10) + (base_calculo.Score_S_bruto * 0.30) + (base_calculo.Score_G_bruto * 0.60)

WHEN base_calculo.divisao_cnae in ('20', '21') 
THEN (base_calculo.Score_A_bruto * 0.50) + (base_calculo.Score_S_bruto * 0.15) + (base_calculo.Score_G_bruto * 0.35)

WHEN base_calculo.divisao_cnae in ('22', '38') 
THEN (base_calculo.Score_A_bruto * 0.40) + (base_calculo.Score_S_bruto * 0.25) + (base_calculo.Score_G_bruto * 0.35)

WHEN base_calculo.divisao_cnae in ('55', '96') 
THEN (base_calculo.Score_A_bruto * 0.15) + (base_calculo.Score_S_bruto * 0.35) + (base_calculo.Score_G_bruto * 0.50)

ELSE (base_calculo.Score_A_bruto *0.33) + (base_calculo.Score_S_bruto *0.33) + (base_calculo.Score_G_bruto *0.34)

END AS score_esg_final

FROM base_calculo
