create_stat_row <- function(color_class, label, number, pct1, pct2) {
  tags$li(
    class = "list-group-item",
    div(
      class = "row align-items-center",
      div(
        class = "col-5 d-flex align-items-center",
        span(class = paste("stat-dot", color_class)),
        span(class = "stat-label", label)
      ),
      div(class = "col-3 text-end stat-number", number),
      div(class = "col-2 text-end stat-percent", pct1),
      div(class = "col-2 text-end stat-percent", pct2)
    )
  )
}

plot <- function() {
  plot_data <- data.frame(
    time_step = 1:10,
    value = c(30, 35, 32, 45, 55, 65, 50, 40, 25, 30),
    bar_value = c(30, 35, 32, 45, 55, 65, 50, 40, 25, 30) * 0.95
  )

  # Find peak point for annotation
  peak_idx <- which.max(plot_data$value)
  peak_value <- max(plot_data$value)

  colors <- list(
    background = "#CDE6E6",
    bars = "#eaf1f3",
    line_point = "#6c939b",
    label_bg = "#fcfc98"
  )

  plot_data |>
    echarts4r::e_charts(time_step) |>
    # Add bars (scaled down to 95% like in ggplot)
    echarts4r::e_bar(
      bar_value,
      name = "Background",
      itemStyle = list(
        color = colors$bars,
        borderRadius = c(8, 8, 0, 0)
      ),
      barWidth = "60%"
    ) |>
    # Add line
    echarts4r::e_line(
      value,
      name = "Value",
      lineStyle = list(
        color = colors$line_point,
        width = 2
      ),
      itemStyle = list(
        color = colors$line_point
      ),
      symbol = "circle",
      symbolSize = 6
    ) |>
    # Highlight peak point
    echarts4r::e_mark_point(
      serie = "Value",
      data = list(list(
        coord = c(peak_idx, peak_value),
        itemStyle = list(
          color = colors$line_point
        ),
        label = list(
          show = TRUE,
          position = "top",
          offset = c(0, -15),
          backgroundColor = colors$label_bg,
          color = "black",
          fontWeight = "bold",
          padding = c(8, 12),
          borderRadius = 6,
          formatter = "+524k"
        )
      ))
    ) |>
    # Remove axes and grid
    echarts4r::e_x_axis(
      show = FALSE
    ) |>
    echarts4r::e_y_axis(
      show = FALSE
    ) |>
    echarts4r::e_grid(
      show = FALSE,
      left = "5%",
      right = "5%",
      top = "15%",
      bottom = "5%"
    ) |>
    # Set background color and remove legend
    echarts4r::e_color(background = colors$background) |>
    echarts4r::e_legend(show = FALSE) |>
    echarts4r::e_tooltip(show = FALSE)
}

mod_dashboard_ui <- function(id) {
  ns <- NS(id)
  bslib::page_fill(
    bslib::layout_columns(
      tags$div(
        tags$h1(class = "fw-bold", style = "font-size: 36pt", "Financial security report"),
      ),
      tags$div(
        tags$h2(class = "fw-bold fs-4", "Prevention measures"),
        tags$p(
          class = "text-black-50",
          "Conduct regular audits to ensure all financial transactions and reporting are in compliance with regulations and policies"
        )
      )
    ),
    bslib::layout_columns(
      bslib::card(
        bslib::card_body(
          class = "px-0 py-0",
          bslib::card(
            class = "bg-primary",
            bslib::card_header("Overview"),
            echarts4r::echarts4rOutput(ns("plot"))
          )
        ),
        bslib::layout_columns(
          tags$div(
            class = "h-100 d-flex flex-column justify-content-center align-items-center",
            tags$label(class = "text-black-50", "Peak date"),
            tags$p(class = "fs-4", "10.06.2023")
          ),
          tags$div(
            class = "h-100 d-flex flex-column justify-content-center align-items-center",
            tags$label(class = "text-black-50", "Amount"),
            tags$p(class = "fs-4", "324213")
          ),
          tags$div(
            class = "h-100 d-flex flex-column justify-content-center align-items-center",
            tags$label(class = "text-black-50", "Raise"),
            tags$p(class = "fs-4", "+4213")
          )
        )
      ),
      tags$div(
        bslib::layout_columns(
          bslib::card(
            bslib::card_header(
              bslib::card_title("Performance"),
              tags$p(class = "text-black-50", "Source on stats")
            ),
            bslib::card_body(
              class = "fs-1",
              "88%"
            )
          ),
          bslib::card(
            bslib::card_header(
              bslib::card_title("Prevention"),
              tags$p(class = "text-black-50", "Source on stats")
            ),
            bslib::card_body(
              class = "fs-1",
              "99%"
            )
          )
        ),
        bslib::card(
          class = "mb-0",
          bslib::card_header(
            class = "d-flex justify-content-between align-items-baseline mb-3",
            div(
              tags$h5(class = "card-title", "Traffic"),
              tags$h6(class = "card-subtitle", "Source on stats")
            ),
            span(class = "quarter-text", "Q4 · '23")
          ),
          bslib::card_body(
            div(
              class = "progress mb-4",
              div(
                class = "progress-bar bg-custom-green",
                role = "progressbar",
                style = "width: 55%",
                "aria-valuenow" = "55",
                "aria-valuemin" = "0",
                "aria-valuemax" = "100"
              ),
              div(
                class = "progress-bar bg-custom-purple",
                role = "progressbar",
                style = "width: 25%",
                "aria-valuenow" = "25",
                "aria-valuemin" = "0",
                "aria-valuemax" = "100"
              ),
              div(
                class = "progress-bar bg-custom-blue",
                role = "progressbar",
                style = "width: 12%",
                "aria-valuenow" = "12",
                "aria-valuemin" = "0",
                "aria-valuemax" = "100"
              ),
              div(
                class = "progress-bar bg-custom-pink",
                role = "progressbar",
                style = "width: 8%",
                "aria-valuenow" = "8",
                "aria-valuemin" = "0",
                "aria-valuemax" = "100"
              )
            ),
            tags$ul(
              class = "list-group list-group-flush stat-list",
              create_stat_row(
                "bg-custom-green",
                "Approved",
                "1405665",
                "56.3%",
                "94.3%"
              ),
              create_stat_row(
                "bg-custom-purple",
                "Under review",
                "478540",
                "32.6%",
                "97.7%"
              ),
              create_stat_row(
                "bg-custom-blue",
                "Verification",
                "239003",
                "82.0%",
                "80.1%"
              ),
              create_stat_row(
                "bg-custom-pink",
                "Fraudulent",
                "2375777",
                "74.5%",
                "67.0%"
              ),
              create_stat_row(
                "bg-custom-grey",
                "Other",
                "566040",
                "40.1%",
                "95.4%"
              )
            )
          )
        )
      )
    )
  )
}

mod_dashboard_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$plot <- echarts4r::renderEcharts4r(plot())
  })
}
