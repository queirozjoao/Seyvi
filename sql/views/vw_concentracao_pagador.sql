SELECT
  id_pagador,
  COUNT(*) AS qtd_boletos,
  ROUND(SUM(vlr_nominal), 2) AS volume_total,
  ROUND(
    SUM(vlr_nominal) / SUM(SUM(vlr_nominal)) OVER () * 100
  , 2) AS pct_carteira,
  COUNTIF(status_pagamento != 'Pago no Prazo') AS qtd_inadimplente,
  CASE
    WHEN SUM(vlr_nominal) / SUM(SUM(vlr_nominal)) OVER () > 0.10 THEN 'ALTO'
    WHEN SUM(vlr_nominal) / SUM(SUM(vlr_nominal)) OVER () > 0.03 THEN 'MÉDIO'
    ELSE 'BAIXO'
  END AS rating_concentracao
FROM nuclea_raw.vw_boletos_status
GROUP BY id_pagador
ORDER BY volume_total DESC
