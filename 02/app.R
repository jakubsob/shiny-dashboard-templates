
ui <- function(request) {
  bslib::page_sidebar(
    theme = theme,
    sidebar = bslib::sidebar(
      sidebar_menu(
        id = "sidebarMenu",
        sidebar_menu_item(
          text = NULL,
          tabName = "dashboard",
          selected = TRUE,
          icon = shiny::icon("line-chart", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = NULL,
          tabName = "product",
          icon = shiny::icon("box", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = NULL,
          tabName = "category",
          icon = shiny::icon("shopping-bag", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = NULL,
          tabName = "user",
          icon = shiny::icon("clipboard-list", verify_fa = FALSE)
        )
      )
    ),
    shiny::tags$head(
      shiny::tags$script(src = "sidebar.js")
    ),
    bslib::navset_hidden(
      bslib::nav_panel_hidden("dashboard",
        mod_dashboard_ui("dashboard")
      )
    )
  )
}

server <- function(input, output, session) {
  mod_dashboard_server("dashboard")
}

shiny::shinyApp(ui, server)
