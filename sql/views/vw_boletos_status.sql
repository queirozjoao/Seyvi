SELECT
  id_boleto,
  id_pagador,
  id_beneficiario,
  dt_emissao,
  dt_vencimento,
  dt_pagamento,
  vlr_nominal,
  vlr_baixa,
  tipo_baixa,
  tipo_especie,
  DATE_DIFF(dt_pagamento, dt_vencimento, DAY) AS dias_atraso,
  CASE
    WHEN dt_pagamento IS NULL THEN 'Sem Pagamento'
    WHEN dt_pagamento > dt_vencimento THEN 'Pago com Atraso'
    ELSE 'Pago no Prazo'
  END AS status_pagamento,
  FORMAT_DATE('%Y-%m', dt_emissao) AS mes_emissao
FROM nuclea_raw.boletos
