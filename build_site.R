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

message("Done. HTML files were rendered to docs/.")