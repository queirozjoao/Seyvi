SELECT
  mes_emissao,
  COUNT(*) AS qtd_boletos,
  ROUND(SUM(vlr_nominal), 2) AS volume_nominal,
  COUNTIF(status_pagamento = 'Pago com Atraso') AS qtd_atraso,
  COUNTIF(status_pagamento = 'Sem Pagamento') AS qtd_sem_pagamento,
  ROUND(
    COUNTIF(status_pagamento != 'Pago no Prazo') / COUNT(*) * 100
  , 1) AS taxa_inad_mes
FROM nuclea_raw.vw_boletos_status
GROUP BY mes_emissao
ORDER BY mes_emissao
