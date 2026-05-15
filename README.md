# Seyvi

# 📊 Análise de Recebíveis e Risco de Crédito (Projeto Acadêmico)

> **Parceiro:** Núclea  
> **Instituição:** FIAP  
> **Semestre/Ano:** 2º Semestre / 2025  

## 📝 Descrição do Projeto
Este projeto tem como objetivo modelar e analisar dados de recebíveis (boletos) e comportamento de pagadores utilizando o **Google BigQuery**. O foco é extrair inteligência a partir de dados brutos para construir indicadores de performance (KPIs) de carteira, avaliar concentração de risco e pontuação geográfica de CNPJs.

## 📈 Visualização de Dados (Dashboard)
Os dados processados e as views analíticas construídas neste repositório alimentam um dashboard interativo, projetado para o monitoramento da carteira e inteligência de risco de crédito no mercado de recebíveis.

🔗 **[Clique aqui para acessar o Dashboard Interativo](https://app.powerbi.com/view?r=eyJrIjoiZDY3M2ZiMzYtNmFlYi00Yzk2LWFhMTItMTg2NDlmM2IwNGNkIiwidCI6IjExZGJiZmUyLTg5YjgtNDU0OS1iZTEwLWNlYzM2NGU1OTU1MSIsImMiOjR9&embedImagePlaceholder=true&pageName=f71781e052ae01e08aea)**

**Detalhes da Visualização:**
* **Ferramenta utilizada:** Power BI
* **Principais métricas acompanhadas:**
  * Evolução mensal e volumetria de boletos.
  * Concentração de risco financeiro por pagador.
  * Score geográfico e distribuição de CNPJs.

## 🏗️ Arquitetura e Modelagem
O projeto está estruturado em um ambiente Cloud (GCP/BigQuery) dentro do dataset `nuclea_raw`. A arquitetura foi dividida entre tabelas base (armazenamento raw) e Views (camada analítica/semântica).

### Tabelas Base
* `boletos`: Armazena os dados transacionais brutos das cobranças.
* `auxiliar`: Tabela de apoio para cruzamento de dimensões.

### Camada Analítica (Views)
* `vw_boletos_status`: Visão consolidada do status atual dos recebíveis (pagos, em aberto, atrasados).
* `vw_cnpj_geo_score`: Análise de risco/score segmentada por região geográfica do CNPJ.
* `vw_concentracao_pagador`: Identificação de dependência financeira (quais pagadores representam a maior fatia da carteira).
* `vw_evolucao_mensal`: Série histórica para acompanhamento de volumetria e sazonalidade.
* `vw_kpis_carteira`: Visão sumarizada dos principais indicadores de saúde da carteira de crédito.

## 📁 Estrutura do Repositório
Todos os scripts SQL utilizados para construir o ambiente no BigQuery estão versionados neste repositório:

- `/base/`: Tabelas dos dados brutos.
- `/sql/views/`: Scripts DML contendo as regras de negócio de cada View.
- `/docs/`: Apresentação e documentação de apoio.

## 👥 Autores - Team Xilemas
* João Paulo Silva de Queiroz - RM-568259
* Rayssa Victorya Silva Sousa - RM-566946
* Shalla Marla Ferreira dos Santos - RM-568058
* Thiago Victor de Abreu - RM-568000
* Weberson Robert de Souza - RM-568084
