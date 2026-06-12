library(rmarkdown)
library(here)

message("Rendering portfolio site...")

render_report <- function(input_file, output_file) {
  message("Rendering: ", input_file, " -> docs/", output_file)
  
  rmarkdown::render(
    input = here::here("analysis", input_file),
    output_file = output_file,
    output_dir = here::here("docs"),
    clean = TRUE,
    envir = new.env(parent = globalenv())
  )
}

render_report("index.Rmd", "index.html")
render_report("HR_Data_EDA.Rmd", "hr_data_eda.html")
render_report("HR_Data_Modeling_Baseline.Rmd", "hr_data_modeling_baseline.html")
render_report("HR_Data_Turnover_Intention.Rmd", "hr_data_turnover_intention.html")
render_report("HR_Data_Quiet_Quitting.Rmd", "hr_data_quiet_quitting.html")
render_report("HR_Data_Monitoring_Privacy.Rmd", "hr_data_monitoring_privacy.html")
render_report("HR_Data_Insights_Gleaned.Rmd", "hr_data_insights_gleaned.html")

message("Done. HTML files were rendered to docs/.")