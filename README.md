# Impact of Macroeconomic Indicators on Stock Market Returns in India 🇮🇳

This repository contains the complete research project analyzing the relationship between key macroeconomic indicators and stock market returns (Nifty 50 & BSE Sensex) in India from 1996 to 2023 using **R Studio** and econometric models.

---

## Research Objectives

- Examine long-term relationships between GDP, inflation, FDI, unemployment, interest rates, exchange rate, and stock market indices using **Johansen Cointegration**.
- Analyze short-term adjustments and deviations using **Vector Error Correction Model (VECM)**.
- Identify predictive relationships through **Granger Causality Tests**.
- Forecast future stock returns and macro trends using **Impulse Response Functions (IRF)** and VAR models.

---

## Methodology

- **Tools Used**: R-Studio (`tseries`, `urca`, `vars`, `lmtest`, `ggplot2`, etc.)
- **Time Period**: 1996–2023
- **Data Sources**: RBI, NSE, BSE, World Bank, IMF
- **Key Techniques**:
  - ADF Test (Stationarity)
  - Johansen Cointegration
  - VECM for short-run and long-run analysis
  - Granger Causality Tests
  - Impulse Response & Forecasting using VAR/VECM
  - Diagnostic checks (Portmanteau test, stability tests)

---

## Key Insights

- **GDP** significantly drives stock market returns (confirmed by Granger causality & IRFs).
- **Inflation** and **unemployment** negatively impact short-term returns.
- **Interest rate hikes** suppress market performance.
- The **Nifty50** and **BSE** adjust quickly to macroeconomic shocks, showing dynamic interaction with GDP and FDI trends.
- Long-run cointegration confirmed; short-run shocks are absorbed over time.
- Forecasts show upward trends in stock indices but rising inflation risks.

---

## Visualization & Forecasting

- Time series trends for macro indicators & stock indices (1996–2023)
- IRF: GDP → Stock Market: Significant positive long-term impact
- IRF: Inflation → Stock Market: Short-term negative, no significant long-term effect
- Forecasts: Nifty50, BSE, GDP, and FDI showing strong growth potential

---

## Contribution & Significance

This project provides valuable insights for:
- **Investors**: Align strategies with economic indicators
- **Policymakers**: Understand how macro policies affect market behavior
- **Researchers**: Leverage robust models for emerging markets
