# =========================================================
# Helper Functions
# HR Synthetic Analytics Portfolio
# =========================================================

library(ggplot2)
library(stringr)
library(dplyr)
library(forcats)
library(here)

# =========================================================
# Label Helpers
# =========================================================

clean_label <- function(x) {
  x <- as.character(x)
  x[is.na(x)] <- ""
  
  x %>%
    stringr::str_replace_all("_", " ") %>%
    stringr::str_replace_all("\\.", " ") %>%
    stringr::str_squish() %>%
    stringr::str_to_title()
}

wrap_label <- function(x, width = 25) {
  stringr::str_wrap(x, width = width)
}

# =========================================================
# Plot Folder Helper
# =========================================================

get_plot_subfolder <- function(default = "general") {
  
  plot_subfolder <- get0(
    "PLOT_SUBFOLDER",
    envir = parent.frame(2),
    inherits = TRUE,
    ifnotfound = default
  )
  
  plot_subfolder <- as.character(plot_subfolder)
  
  if (length(plot_subfolder) == 0 || is.na(plot_subfolder) || plot_subfolder == "") {
    plot_subfolder <- default
  }
  
  plot_subfolder
}

# =========================================================
# Save Plot
# =========================================================
# Usage:
#   PLOT_SUBFOLDER <- "eda"
#   save_plot(p, "my_plot.png", width = 9, height = 5)
#
# Expected folders:
#   docs/figures/eda
#   docs/figures/baseline
#   docs/figures/turnover
#   docs/figures/quiet_quitting
#   docs/figures/monitoring_privacy
#   docs/figures/insights
# =========================================================

save_plot <- function(
    p,
    filename,
    width = 9.5,
    height = 5.75,
    dpi = 300,
    plot_dir = NULL,
    bg = "white"
) {
  
  if (missing(p) || is.null(p)) {
    stop("save_plot error: plot object `p` is missing or NULL.")
  }
  
  if (missing(filename) || is.null(filename) || filename == "") {
    stop("save_plot error: `filename` must be provided.")
  }
  
  if (is.null(plot_dir)) {
    
    plot_subfolder <- get0(
      "PLOT_SUBFOLDER",
      envir = parent.frame(),
      inherits = TRUE,
      ifnotfound = "general"
    )
    
    plot_subfolder <- as.character(plot_subfolder)
    
    if (
      length(plot_subfolder) == 0 ||
      is.na(plot_subfolder) ||
      plot_subfolder == ""
    ) {
      plot_subfolder <- "general"
    }
    
    plot_dir <- here::here(
      "docs",
      "figures",
      plot_subfolder
    )
  }
  
  if (!dir.exists(plot_dir)) {
    dir.create(
      plot_dir,
      recursive = TRUE,
      showWarnings = FALSE
    )
  }
  
  full_path <- file.path(plot_dir, filename)
  
  ggplot2::ggsave(
    filename = full_path,
    plot = p,
    width = width,
    height = height,
    dpi = dpi,
    bg = bg
  )
  
  if (exists("VERBOSE_SAVE", inherits = TRUE) && isTRUE(get("VERBOSE_SAVE", inherits = TRUE))) {
    message("Saved plot to: ", full_path)
  }
  
  invisible(full_path)
}

# =========================================================
# Theme
# =========================================================

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
        color = "#5A6B7C",
        margin = ggplot2::margin(b = 8)
      ),
      axis.text = ggplot2::element_text(
        size = base_size - 1,
        color = "#4F4F4F"
      ),
      axis.title = ggplot2::element_text(
        size = base_size,
        color = "#243447"
      ),
      strip.text = ggplot2::element_text(
        size = base_size,
        face = "bold",
        color = "#243447"
      ),
      legend.title = ggplot2::element_text(
        size = base_size,
        face = "bold",
        color = "#243447"
      ),
      legend.text = ggplot2::element_text(
        size = base_size - 1,
        color = "#243447"
      ),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(
        color = "#EAEAEA",
        linewidth = 0.4
      ),
      plot.margin = ggplot2::margin(10, 10, 10, 10),
      legend.position = "right"
    )
}

# =========================================================
# Category Plot
# =========================================================

plot_cat <- function(var, df) {
  
  if (!var %in% names(df)) {
    stop(paste("plot_cat error:", var, "not found in dataframe"))
  }
  
  df %>%
    dplyr::count(.data[[var]]) %>%
    dplyr::mutate(
      prop = n / sum(n),
      category = clean_label(.data[[var]])
    ) %>%
    dplyr::slice_max(prop, n = 5) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = prop,
        y = forcats::fct_reorder(category, prop),
        fill = prop
      )
    ) +
    ggplot2::geom_col() +
    ggplot2::scale_fill_gradient(
      low = "#A8DADC",
      high = "#E63946"
    ) +
    ggplot2::labs(
      title = wrap_label(clean_label(var), 20),
      x = "Proportion",
      y = NULL
    ) +
    theme_hr(10) +
    ggplot2::theme(
      legend.position = "none",
      plot.title = ggplot2::element_text(size = 10),
      plot.margin = ggplot2::margin(5, 5, 5, 5)
    )
}