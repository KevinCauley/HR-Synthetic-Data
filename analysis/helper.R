# Helper Functions
clean_label <- function(x) {
  x <- ifelse(is.na(x), "", as.character(x))
  
  x %>%
    stringr::str_replace_all("_", " ") %>%
    stringr::str_replace_all("\\.", " ") %>%
    stringr::str_squish() %>%
    stringr::str_to_title()
}

save_plot <- function(p, filename, width = 8, height = 5, plot_dir) {
  
  # Ensure directory exists
  if (!dir.exists(plot_dir)) {
    dir.create(plot_dir, recursive = TRUE)
  }
  
  ggsave(
    filename = file.path(plot_dir, filename),
    plot = p,
    width = width,
    height = height,
    dpi = 300
  )
}

theme_hr <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", size = base_size + 2),
      plot.subtitle = ggplot2::element_text(size = base_size),
      axis.text = ggplot2::element_text(size = base_size - 1),
      axis.title = ggplot2::element_text(size = base_size),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "#EAEAEA"),
      legend.position = "right"
    )
}