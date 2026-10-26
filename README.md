# E-Commerce Cart Abandonment & Checkout Funnel Analysis

![Dashboard Overview](dashboard_screenshot.png)

## 📌 Project Overview
This project performs an end-to-end analytics workflow to examine customer drop-offs across an e-commerce checkout funnel. By combining **Python** for data synthesis and preprocessing, **SQL** for relational transformation and funnel querying, and **Power BI** for interactive visualization, this project provides data-backed recommendations for product and UX engineering teams to minimize revenue leakage.

---

## 🎯 Business Problem & Core Questions
* **Primary Question:** Where in the checkout flow are customers dropping off most, and what should the product team fix first?
* **Sub-Questions Evaluated:**
  1. What is the step-by-step conversion rate across *Cart View $\rightarrow$ Shipping $\rightarrow$ Payment $\rightarrow$ Purchase*?
  2. How do drop-off rates vary across device types (*Mobile, Desktop, Tablet*)?
  3. Which product categories experience the highest cart abandonment?
  4. Are there specific peak hours during the day where abandonment spikes?

---

## 💡 Key Business Insights
1. **Primary Bottleneck:** The largest drop-off occurs between **Cart View to Shipping (30.4%)** and **Shipping to Payment (32.55%)**.
2. **Device Friction:** Mobile users exhibit a significantly higher drop-off during payment steps (over **60%** abandonment on mobile compared to ~20% on desktop during evening peak hours).
3. **Category Vulnerability:** *Home & Kitchen* recorded the lowest conversion rate (**35.59%**), followed closely by *Beauty* (**37.89%**).
4. **Temporal Patterns:** Peak abandonment occurs between **7:00 PM and 10:00 PM**, coinciding with high mobile user volume.

---

## 🛠️ Tool Architecture & Workflow
* **Python (Data Synthesis & Cleaning):** Generated a 5,000-session dataset incorporating timestamps, multi-step checkout flags, product categories, and device segments.
* **SQL (Analytics & Aggregation):** Applied CTEs and window calculations to evaluate checkout step transition percentages and isolate high-friction buckets.
* **Power BI (Interactive Dashboard):** Constructed a dashboard with KPI cards, dynamic funnel visuals, category performance matrices, and a time-of-day heatmap.

---

## 📂 Repository Structure
```text
├── data/
│   └── cart_abandonment_full_data.csv
├── scripts/
│   ├── generate_data.py
│   └── funnel_analysis.sql
├── dashboard/
│   └── Cart_Abandonment_Analysis.pbix
├── images/
│   └── dashboard_screenshot.png
└── README.md
```

---

## 🚀 How to Replicate This Project
1. **Generate Dataset:** Run `python scripts/generate_data.py` to output the CSV dataset.
2. **Execute SQL Queries:** Load the CSV into DBeaver/SQLite/PostgreSQL and execute `scripts/funnel_analysis.sql`.
3. **Open Dashboard:** Open `dashboard/Cart_Abandonment_Analysis.pbix` in Power BI Desktop to inspect or edit the visual report.
