# Workforce Risk Analytics with Synthetic HR Data  
### Predictive Modeling, Executive Reporting, and Responsible HR Decision Support

This project demonstrates an end-to-end workforce analytics portfolio using research-informed synthetic HR data. It shows how raw workforce data can be transformed into exploratory insights, baseline modeling benchmarks, outcome-specific predictive models, and executive-level recommendations for responsible decision support.

The project focuses on three workforce-risk outcomes:

- **Turnover Intention**
- **Quiet Quitting Risk**
- **Monitoring & Privacy Risk**

The goal is not to automate employee decisions. The goal is to demonstrate how predictive analytics can support **human-in-the-loop review**, helping HR, leadership, and governance stakeholders identify where additional context, support, or policy review may be warranted.

---

## Live Portfolio

View the full interactive report:

https://mrp-synthetic-data-files.netlify.app

---

## Project Overview

This portfolio replicates a real-world HR analytics workflow using synthetic data designed to preserve privacy while still supporting realistic analysis.

The workflow includes:

1. Synthetic HR data preparation and cleaning  
2. Exploratory data analysis  
3. Baseline model benchmarking  
4. Outcome-specific predictive modeling  
5. Model selection using cross-validation and holdout confirmation  
6. Executive insight synthesis  
7. Responsible-use and governance recommendations  

The final site is structured as a multi-page analytics portfolio:

- Exploratory Data Analysis  
- Modeling Baseline & Strategy  
- Turnover Intention Modeling  
- Quiet Quitting Analysis  
- Monitoring & Privacy Risk  
- Insights & Recommendations  

---

## Business Problem

Organizations often have access to workforce data but struggle to translate it into responsible, decision-ready insight.

This project addresses that challenge by asking:

- Which workforce signals appear most associated with turnover intention?
- Can quiet quitting risk be modeled as an early engagement signal?
- How can monitoring and privacy-related signals support governance-focused review?
- How should predictive outputs be interpreted responsibly in HR decision-making?

The project treats predictive models as **risk-prioritization tools**, not automated decision systems.

---

## Methodology

### Baseline-First Modeling Strategy

Before evaluating outcome-specific sampling strategies, the project establishes a no-sampling baseline across five supervised learning models:

- Logistic Regression
- Random Forest
- XGBoost
- Naive Bayes
- Support Vector Machine

This baseline provides a reference point for understanding whether later model configurations improve performance or simply behave differently.

### Outcome-Specific Modeling

Each workforce outcome is then modeled separately using multiple sampling strategies:

- No Sampling
- Up Sampling
- Down Sampling
- SMOTE

Model selection follows a cross-validation-first approach. Cross-validated F1 Score is used as the primary selection metric, while holdout performance is used to confirm practical stability on unseen data.

This structure separates three important concepts:

- **Baseline winner**
- **Holdout checkpoint**
- **Final selected model**

That distinction is important because the best model on one holdout split is not always the most defensible final model.

---

## Final Model Interpretation

### Turnover Intention

The turnover model is best interpreted as a **retention-risk prioritization tool**. It helps identify employees or workforce segments that may warrant earlier retention review, manager follow-up, workload review, or career-pathing support.

### Quiet Quitting Risk

The quiet quitting model is best interpreted as a **cautious early engagement signal**. Because quiet quitting is behavioral and harder to observe directly, predictions should be paired with employee voice, survey results, manager observations, and organizational context.

### Monitoring & Privacy Risk

The monitoring and privacy model is best interpreted as a **privacy-aware governance review tool**. It supports review of monitoring practices, workforce trust, transparency, and privacy-related concerns. This outcome is especially sensitive because false positives can create unnecessary governance burden or employee concern.

---

## Evaluation Metrics

Models were evaluated using:

- Accuracy
- Precision
- Recall
- F1 Score
- ROC AUC

The project emphasizes precision, recall, and F1 Score because workforce-risk modeling requires balancing detection coverage with the reliability of flagged cases.

Accuracy is included, but it is not treated as the primary decision metric because it can be misleading when class distributions are uneven.

---

## Responsible Use

This project is intentionally framed around responsible analytics.

The models should be used to:

- Prioritize HR or manager review
- Identify patterns across workforce-risk outcomes
- Support earlier intervention and better questions
- Guide governance review for monitoring and privacy concerns
- Improve workforce planning and executive decision support

The models should **not** be used to:

- Make automatic employment decisions
- Label employees as problems or flight risks
- Replace manager judgment, HR review, or employee voice
- Justify expanded monitoring without governance review
- Trigger punitive action without human validation

The appropriate use case is **human-in-the-loop decision support**.

---

## Tools and Technologies

- R / RStudio
- RMarkdown
- tidyverse
- tidymodels
- ggplot2
- gt
- Python
- Synthetic data generation
- Machine learning classification
- Git and GitHub
- Netlify deployment
- HTML / CSS portfolio reporting

---

## Skills Demonstrated

This project demonstrates:

- End-to-end analytics pipeline design
- Exploratory data analysis
- Predictive modeling
- Model benchmarking and comparison
- Cross-validation and holdout evaluation
- Class imbalance handling
- Executive dashboard-style reporting
- Responsible AI and HR analytics framing
- Data storytelling for technical and non-technical audiences
- Portfolio website deployment

---

## Repository Structure

```text
analysis/
  index.Rmd
  HR_Data_EDA.Rmd
  HR_Data_Modeling_Baseline.Rmd
  HR_Data_Turnover_Intention.Rmd
  HR_Data_Quiet_Quitting.Rmd
  HR_Data_Monitoring_Privacy.Rmd
  HR_Data_Insights_Gleaned.Rmd
  helper.R

data/
  processed/
  model_summaries/

docs/
  index.html
  hr_data_eda.html
  hr_data_modeling_baseline.html
  hr_data_turnover_intention.html
  hr_data_quiet_quitting.html
  hr_data_monitoring_privacy.html
  hr_data_insights_gleaned.html
  assets/
  figures/

build_site.R
netlify.toml
README.md
```

## Key Takeaway

The final value of this project is not just model performance. It is the full demonstration of how synthetic data, predictive modeling, executive visualization, and responsible governance can work together in a realistic HR analytics workflow.

The project shows how organizations can move from reactive workforce reporting toward proactive, privacy-aware, and human-centered decision support.

## Author

**Kevin Cauley**
M.S. Applied Data Analytics
Saint Louis University

GitHub: https://github.com/KevinCauley