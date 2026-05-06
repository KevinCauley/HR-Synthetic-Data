# Ethical HR Analytics with Synthetic Data  
### Machine Learning Models for Workforce Risk & Engagement

This project builds an end-to-end workforce analytics pipeline using **synthetic HR data** to model employee risk and engagement outcomes while preserving privacy.

The objective is to demonstrate how organizations can apply **predictive analytics responsibly**, enabling data-driven decision-making without exposing sensitive employee information.

---

## 🔗 Live Analysis

Explore the full interactive analysis:

👉 https://mrp-synthetic-data-files.netlify.app

---

## 📊 Project Overview

A synthetic HR dataset was generated in Python using:

- U.S. Census benchmarks  
- Workforce research  
- Studies on employee well-being, monitoring, and engagement  

The dataset was analyzed in R using multiple machine learning models to evaluate workforce risk outcomes.

---

## 🎯 Workforce Outcomes Modeled

- Turnover Intention  
- Quiet Quitting Risk  
- Monitoring-Related Turnover Risk  

---

## 🤖 Machine Learning Approach

Multiple classification models were implemented and compared:

- Logistic Regression (baseline, interpretable)
- Random Forest (ensemble learning)
- XGBoost (boosted trees for performance)
- Support Vector Machines (nonlinear classification)
- Naïve Bayes (probabilistic baseline)

Model performance was evaluated using **10-fold cross-validation**.

---

## ⚖️ Handling Class Imbalance

To improve model reliability, several resampling techniques were applied:

- SMOTE (synthetic minority oversampling)
- Oversampling
- Undersampling

These approaches significantly impacted recall and F1 performance, highlighting the importance of balancing workforce data.

---

## 📈 Evaluation Metrics

Models were evaluated using:

- Accuracy  
- Precision  
- Recall  
- F1 Score  
- Specificity  
- ROC-AUC  

This multi-metric approach ensures performance is aligned with real-world decision-making priorities.

---

## 🧠 Key Insights

- Turnover risk is driven by **nonlinear relationships** between engagement, well-being, and workplace factors  
- Sampling strategies materially improve model performance, particularly for identifying at-risk employees  
- Tree-based and ensemble models outperform linear approaches in capturing complex workforce behavior  
- Predictive modeling enables **proactive intervention strategies** rather than reactive HR decisions  

---

## 🛠️ Tools & Technologies

- Python (data generation)
- R / RStudio (modeling & analysis)
- Machine Learning (classification models)
- Synthetic Data Design
- Git & GitHub
- Netlify (deployment)

---

## 🔒 Ethical Considerations

This project demonstrates how **synthetic data can enable advanced HR analytics without compromising employee privacy**, supporting ethical and responsible use of predictive modeling in workforce contexts.

---

## 👤 Author

**Kevin Cauley**  
MS Applied Analytics – Saint Louis University  

🔗 GitHub: https://github.com/KevinCauley  