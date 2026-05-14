SELECT
  id_cnpj,
  uf,
  cd_cnae_prin,
  sacado_indice_liquidez_1m,
  cedente_indice_liquidez_1m,
  score_materialidade_v2,
  score_quantidade_v2,
  score_materialidade_evolucao,
  media_atraso_dias,
  indicador_liquidez_quantitativo_3m,
  share_vl_inad_pag_bol_6_a_15d,
  CASE
    WHEN score_materialidade_v2 >= 950 THEN 'AAA – Muito Baixo'
    WHEN score_materialidade_v2 >= 900 THEN 'AA – Baixo'
    WHEN score_materialidade_v2 >= 700 THEN 'A – Moderado'
    WHEN score_materialidade_v2 >= 500 THEN 'B – Elevado'
    ELSE 'C – Alto'
  END AS rating_seyvi,
  CASE
    WHEN cedente_indice_liquidez_1m IS NULL THEN 'Sem dado'
    WHEN cedente_indice_liquidez_1m < 0.3 THEN '0 – 0,3'
    WHEN cedente_indice_liquidez_1m < 0.5 THEN '0,3 – 0,5'
    WHEN cedente_indice_liquidez_1m < 0.7 THEN '0,5 – 0,7'
    WHEN cedente_indice_liquidez_1m < 0.9 THEN '0,7 – 0,9'
    ELSE '0,9 – 1,0'
  END AS faixa_liquidez
FROM nuclea_raw.auxiliar
