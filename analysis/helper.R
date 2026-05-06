# Helper Functions
library(ggplot2)
library(stringr)
library(dplyr)
library(forcats)
library(here)

# Global Settings
if (!exists("PLOT_SUBFOLDER")) {
  PLOT_SUBFOLDER <- "eda"
}

# Label Helpers
clean_label <- function(x) {
  x <- as.character(x)
  x[is.na(x)] <- ""
  
  x %>%
    str_replace_all("_", " ") %>%
    str_replace_all("\\.", " ") %>%
    str_squish() %>%
    str_to_title()
}

wrap_label <- function(x, width = 25) {
  stringr::str_wrap(x, width = width)
}

# Save Plot
save_plot <- function(p, filename, width, height, plot_dir = NULL) {
  
  # If no custom plot directory is provided, use the project-wide
  # PLOT_SUBFOLDER convention.
  #
  # Example:
  # PLOT_SUBFOLDER <- "eda"              -> docs/figures/eda
  # PLOT_SUBFOLDER <- "turnover"         -> docs/figures/turnover
  # PLOT_SUBFOLDER <- "quiet_quitting"   -> docs/figures/quiet_quitting
  # PLOT_SUBFOLDER <- "monitoring_privacy" -> docs/figures/monitoring_privacy
  
  if (is.null(plot_dir)) {
    
    if (!exists("PLOT_SUBFOLDER")) {
      PLOT_SUBFOLDER <- "eda"
    }
    
    plot_dir <- here::here("docs", "figures", PLOT_SUBFOLDER)
  }
  
  if (!dir.exists(plot_dir)) {
    dir.create(plot_dir, recursive = TRUE)
  }
  
  full_path <- file.path(plot_dir, filename)
  
  ggplot2::ggsave(
    filename = full_path,
    plot = p,
    width = width,
    height = height,
    dpi = 300
  )
  
  # Safe Verbose Check
  if (exists("VERBOSE_SAVE") && isTRUE(VERBOSE_SAVE)) {
    message("Saved plot to: ", full_path)
  }
}

# Theme
theme_hr <- function(base_size = 10) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        face = "bold",
        size = base_size + 2,
        margin = ggplot2::margin(b = 6)
      ),
      plot.subtitle = ggplot2::element_text(
        size = base_size,
        margin = ggplot2::margin(b = 8)
      ),
      axis.text = ggplot2::element_text(size = base_size - 1),
      axis.title = ggplot2::element_text(size = base_size),
      strip.text = ggplot2::element_text(size = base_size, face = "bold"),
      legend.title = ggplot2::element_text(size = base_size),
      legend.text = ggplot2::element_text(size = base_size - 1),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "#EAEAEA", linewidth = 0.4),
      plot.margin = ggplot2::margin(10, 10, 10, 10),
      legend.position = "right"
    )
}

# Category Plot
plot_cat <- function(var, df) {
  
  if (!var %in% names(df)) {
    stop(paste("plot_cat error:", var, "not found in dataframe"))
  }
  
  df %>%
    count(.data[[var]]) %>%
    mutate(
      prop = n / sum(n),
      category = clean_label(.data[[var]])
    ) %>%
    slice_max(prop, n = 5) %>%
    ggplot(aes(x = prop, y = forcats::fct_reorder(category, prop), fill = prop)) +
    geom_col() +
    scale_fill_gradient(low = "#A8DADC", high = "#E63946") +
    labs(
      title = wrap_label(clean_label(var), 20),
      x = "Proportion",
      y = NULL
    ) +
    theme_hr(10) +
    theme(
      legend.position = "none",
      plot.title = element_text(size = 10),
      plot.margin = ggplot2::margin(5, 5, 5, 5)
    )
}