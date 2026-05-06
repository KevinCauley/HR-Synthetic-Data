library(rmarkdown)
library(here)

# Render Index (Home)
rmarkdown::render(
  input = here::here("analysis", "Index.Rmd"),
  output_file = "index.html",
  output_dir = here::here("docs")
)

# Render EDA
rmarkdown::render(
  input = here::here("analysis", "HR_Data_EDA.Rmd"),
  output_file = "HR_Data_EDA.html",
  output_dir = here::here("docs")
)

# Render Turnover Intention
rmarkdown::render(
  input = here::here("analysis", "HR_Data_Turnover_Intention.Rmd"),
  output_file = "HR_Data_Turnover_Intention.html",
  output_dir = here::here("docs")
)

# Render Quiet Quitting
rmarkdown::render(
  input = here::here("analysis", "HR_Data_Quiet_Quitting.Rmd"),
  output_file = "HR_Data_Quiet_Quitting.html",
  output_dir = here::here("docs")
)

# Render Monitoring & Privacy
rmarkdown::render(
  input = here::here("analysis", "HR_Data_Monitoring_Privacy.Rmd"),
  output_file = "HR_Data_Monitoring_Privacy.html",
  output_dir = here::here("docs")
)

# Render Insights Gleaned
rmarkdown::render(
  input = here::here("analysis", "HR_Data_Insights_Gleaned.Rmd"),
  output_file = "HR_Data_Insights_Gleaned.html",
  output_dir = here::here("docs")
)