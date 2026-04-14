library(rmarkdown)
library(here)

files <- c(
  "Index.Rmd",
  "HR_Data_EDA.Rmd",
  "HR_Data_Turnover_Intention_Results.Rmd",
  "HR_Data_Quiet_Quitting_Results.Rmd",
  "HR_Data_Monitoring_Turnover_Risk_Results.Rmd",
  "HR_Data_Insights_Gleaned.Rmd"
)

for (f in files) {
  render(
    input = here("analysis", f),
    output_dir = here("docs"),
    output_options = list(self_contained = FALSE)
  )
}