SELECT
  COUNT(*) AS total_boletos,
  ROUND(SUM(vlr_nominal), 2) AS volume_total,
  COUNTIF(status_pagamento = 'Pago no Prazo') AS qtd_no_prazo,
  COUNTIF(status_pagamento = 'Pago com Atraso') AS qtd_atraso,
  COUNTIF(status_pagamento = 'Sem Pagamento') AS qtd_sem_pagamento,
  ROUND(
    COUNTIF(status_pagamento != 'Pago no Prazo') / COUNT(*) * 100
  , 1) AS taxa_inadimplencia_pct,
  COUNT(DISTINCT id_pagador) AS total_pagadores,
  COUNT(DISTINCT id_beneficiario) AS total_beneficiarios
FROM nuclea_raw.vw_boletos_status
