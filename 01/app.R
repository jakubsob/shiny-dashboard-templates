
ui <- function(request) {
  bslib::page_sidebar(
    theme = theme,
    sidebar = bslib::sidebar(
      title = "Dashboard",
      sidebar_menu(
        id = "sidebarMenu",
        sidebar_menu_item(
          text = "Dashboard",
          tabName = "dashboard",
          selected = TRUE,
          icon = shiny::icon("line-chart", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = "Product",
          tabName = "product",
          icon = shiny::icon("box", verify_fa = FALSE),
          sidebar_menu_sub_item(text = "All Products", tabName = "all_products"),
          sidebar_menu_sub_item(text = "Add Products", tabName = "add_products"),
          sidebar_menu_sub_item(text = "Product Details", tabName = "product_details")
        ),
        sidebar_menu_item(
          text = "Category",
          tabName = "category",
          icon = shiny::icon("shopping-bag", verify_fa = FALSE),
          sidebar_menu_sub_item(text = "All Categories", tabName = "all_categories")
        ),
        sidebar_menu_item(
          text = "User",
          tabName = "user",
          icon = shiny::icon("clipboard-list", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = "Report",
          tabName = "report",
          icon = shiny::icon("chart-bar", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = "FAQ",
          tabName = "faq",
          icon = shiny::icon("question-circle", verify_fa = FALSE)
        ),
        sidebar_menu_item(
          text = "Feedback",
          tabName = "feedback",
          icon = shiny::icon("comment", verify_fa = FALSE)
        )
      )
    ),
    shiny::tags$head(
      shiny::tags$script(src = "sidebar.js")
    ),
    bslib::navset_hidden(
      bslib::nav_panel_hidden("dashboard",
        bslib::navset_tab(
          bslib::nav_panel(
            "Charts",
            mod_dashboard_ui("dashboard")
          )
        )
      )
    )
  )
}

server <- function(input, output, session) {

}

shiny::shinyApp(ui, server)
