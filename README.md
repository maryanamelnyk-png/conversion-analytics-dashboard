# Conversion Analytics Dashboard

## Project Overview

This project focuses on analyzing conversion performance in an e-commerce store using GA4 data. The goal was to transform raw event-level data into structured metrics and an interactive dashboard to support marketing and product decision-making.

## Key Questions
-How do users move through the conversion funnel?
-Where do the biggest drop-offs occur?
-How does conversion rate vary across traffic sources?
-What differences exist between mobile and desktop users?
-How do conversion metrics change over time?

## What Was Done
-Built session-based datasets using SQL in BigQuery
-Constructed a full conversion funnel (7 stages)
-Calculated key metrics: Sessions, Conversion Rate, Purchases
-Analyzed traffic sources (source / medium / campaign)
-Segmented users by device, OS, language, and country
-Created time-based analysis of sessions and conversion rate
-Developed an interactive dashboard in Tableau with filters and drill-down

## Key Insights
-Significant drop-off between product view and add-to-cart stage → potential UX or pricing issues
-Paid traffic shows higher conversion compared to organic traffic
-Mobile users convert хуже than desktop users → potential mobile UX gap
-Conversion rate varies significantly across traffic channels
-Time-based analysis shows fluctuations in conversion → possible seasonality or campaign impact

## Recommendations
-Improve product page experience to reduce drop-off before add-to-cart
-Optimize mobile user journey
-Focus on high-performing traffic channels
-Analyze campaign performance to stabilize conversion trends

## Tools & Technologies
-SQL (BigQuery)
-GA4 (event-based data)
-Tableau (dashboard & visualization)

## Links
Tableau Dashboard: https://public.tableau.com/app/profile/mariana.melnyk/viz/EcommerceFunnelConversionDashboard_17720610478790/Dashboard1?publish=yes
<img width="1999" height="2249" alt="Dashboard 1" src="https://github.com/user-attachments/assets/55b78d93-4316-490d-a2ac-93f2dbface93" />

BigQuery Query: https://console.cloud.google.com/bigquery?sq=280920115893:92400a6ca4b24baca8b5c5b19ded8f70&project=goit-475214&ws=!1m4!1m3!8m2!1s280920115893!2s92400a6ca4b24baca8b5c5b19ded8f70
