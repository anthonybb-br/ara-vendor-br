
# ARA Vendor BR — Starter Kit (v2) — Sales, Traffic, Inventory, Forecast, Net PPM

Pronto para **Brasil**, com consolidados **DAY + WEEK + MONTH** (PST-aligned) e **Real‑Time** (hora a hora) e upload opcional para **Azure Blob** (para Power BI).

> **Fontes oficiais**: **Reports API fluxo**; **Analytics Reports** (Vendor Retail Analytics, PST, real‑time, períodos); **Schemas** (Sales/Traffic/Inventory/Forecast/Net PPM/Real‑Time); **MarketplaceId BR**. citeturn1search18turn1search2turn2search61turn2search58turn2search55turn2search60turn2search49turn1search25turn2search35

## Estrutura
```
ara_vendor_br_starter_kit_v2/
  config/
    .env.sample
  output/
  src/
    spapi_vendor_br.py
  excel/
    export_to_excel.py
  powerbi/
    PowerQuery_FolderConnector.pq
    Measures_ARA_BR.dax
  .github/workflows/
    ara_br.yml
  requirements.txt
  README.md
```

## Como usar
1. Copie `config/.env.sample` → `config/.env` e preencha credenciais LWA, AWS e (opcional) **AZURE_BLOB**.
2. `pip install -r requirements.txt`
3. `python src/spapi_vendor_br.py` → salva JSONs em `output/` **e** envia ao Azure Blob se `AZURE_BLOB_CONNECTION_STRING`/`AZURE_BLOB_CONTAINER` estiverem definidos.
4. `python excel/export_to_excel.py` → gera `ARA_BR.xlsx`.
5. Power BI → **Azure Blob Storage** → selecione o *container* (nativo do Power BI) e publique; configure refresh.

### Observações importantes
- **Vendor ARA** segue **PST** para períodos (WEEK/MONTH etc.); o script usa *boundaries* do **último período completo**. citeturn1search2
- **Real‑Time** (Sales/Traffic/Inventory) é quase em tempo real (hora a hora) e pode divergir até o fechamento do dia. citeturn1search2
- **Forecast** traz **mean/p70/p80/p90** de demanda de cliente; **não é** promessa de PO. citeturn2search60turn1search15
- **Conversion** e **ASP** são derivados: `Ordered Units/Glance Views` e `Shipped Revenue/Shipped Units`. citeturn1search15
