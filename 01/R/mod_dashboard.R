mod_dashboard_ui <- function(id) {
  tags$div(
    class = "container-fluid p-4",
    tags$div(
      class = "row g-4",
      tags$div(
        class = "col-12 col-lg-8",
        tags$div(
          class = "row g-4",
          # Expense Card
          tags$div(
            class = "col-12 col-md-6",
            bslib::card(
              class = "h-100",
              bslib::card_body(
                tags$div(
                  class = "d-flex justify-content-between align-items-center",
                  tags$div(
                    class = "d-flex align-items-center",
                    tags$div(class = "icon-circle text-danger-subtle me-3", shiny::icon("square-minus", class = "text-danger", verify_fa = FALSE)),
                    tags$p(class = "mb-0 text-muted", "Expense")
                  ),
                  tags$p(class = "mb-0 text-muted small", "Last Month")
                ),
                tags$div(
                  class = "d-flex align-items-center mt-3",
                  tags$h3(class = "fw-bold me-2 mb-0", "$15,585"),
                  tags$span(class = "text-success-emphasis fw-semibold", "+0.5%")
                ),
                tags$img(src = "https://placehold.co/250x100/FF6B6B/FFFFFF?text=Expense+Chart", class = "img-fluid mt-2", alt = "Expense chart placeholder")
              )
            )
          ),

          # Income Card
          tags$div(
            class = "col-12 col-md-6",
            bslib::card(
              class = "h-100",
              bslib::card_body(
                tags$div(
                  class = "d-flex justify-content-between align-items-center",
                  tags$div(
                    class = "d-flex align-items-center",
                    tags$div(class = "icon-circle text-success-subtle me-3", shiny::icon("square-plus", class = "text-success", verify_fa = FALSE)),
                    tags$p(class = "mb-0 text-muted", "Income")
                  ),
                  tags$p(class = "mb-0 text-muted small", "Last Month")
                ),
                tags$div(
                  class = "d-flex align-items-center mt-3",
                  tags$h3(class = "fw-bold me-2 mb-0", "$54,253"),
                  tags$span(class = "text-success-emphasis fw-semibold", "+0.5%")
                ),
                tags$img(src = "https://placehold.co/250x100/4ECDC4/FFFFFF?text=Income+Chart", class = "img-fluid mt-2", alt = "Income chart placeholder")
              )
            )
          ),

          # Balance Summary Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_header("Your Balance Summary"),
              bslib::card_body(
                tags$p(class = "mb-2 text-muted", "Income ", tags$span(class = "fw-bold text-dark", "$525,252.000")),
                tags$img(src = "https://placehold.co/400x200/6C5CE7/FFFFFF?text=Balance+Summary", class = "img-fluid", alt = "Balance summary chart")
              )
            )
          ),

          # Transaction History Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_header("Transaction History"),
              bslib::card_body(
                tags$p(class = "text-muted small", "Nov 5 2025 - Nov 7 2025"),
                tags$ul(
                  class = "list-group list-group-flush",
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=1", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0", "Savannah Nguyen"),
                        tags$small(class = "text-muted", "7 Nov 3:25 PM")
                      )
                    ),
                    tags$span(class = "fw-bold text-success", "+$5,520")
                  ),
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=2", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0", "Cody Fisher"),
                        tags$small(class = "text-muted", "8 Nov 4:47 PM")
                      )
                    ),
                    tags$span(class = "fw-bold text-success", "+$8,520")
                  ),
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=3", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0", "Bessie Cooper"),
                        tags$small(class = "text-muted", "12 Nov 5:00 PM")
                      )
                    ),
                    tags$span(class = "fw-bold text-success", "+$6,520")
                  )
                )
              )
            )
          )
        )
      ),

      # Right Column
      tags$div(
        class = "col-12 col-lg-4",
        tags$div(
          class = "row g-4",
          # Transactions Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_body(
                tags$div(
                  class = "d-flex justify-content-between align-items-center",
                  tags$h6(class = "card-title fw-bold mb-0", "Transactions"),
                  tags$p(class = "mb-0 text-muted small", "Last Month")
                ),
                tags$div(
                  class = "d-flex align-items-center mt-2",
                  tags$h4(class = "fw-bold me-2 mb-0", "$15,585"),
                  tags$span(class = "text-success-emphasis fw-semibold", "+0.5%")
                ),
                tags$img(src = "https://placehold.co/200x80/74B9FF/FFFFFF?text=Transaction+Chart", class = "img-fluid mt-2", alt = "Small transaction chart")
              )
            )
          ),

          # Admission Summary Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_body(
                tags$div(
                  class = "d-flex justify-content-between align-items-center",
                  tags$h6(class = "card-title fw-bold mb-0", "Admission Summary"),
                  tags$p(class = "mb-0 text-muted small", "Last Month")
                ),
                tags$div(
                  class = "d-flex align-items-center mt-2",
                  tags$h4(class = "fw-bold me-2 mb-0", "$4,563"),
                  tags$span(class = "text-success-emphasis fw-semibold", "+0.5%")
                ),
                tags$div(
                  class = "bar-chart-placeholder mt-3",
                  tags$div(class = "bar", style = "height: 60%;"),
                  tags$div(class = "bar", style = "height: 40%;"),
                  tags$div(class = "bar bg-secondary-subtle", style = "height: 80%;"),
                  tags$div(class = "bar", style = "height: 95%;"),
                  tags$div(class = "bar", style = "height: 50%;"),
                  tags$div(class = "bar bg-secondary-subtle", style = "height: 70%;"),
                  tags$div(class = "bar", style = "height: 30%;")
                ),
                tags$div(
                  class = "d-flex justify-content-around text-muted small mt-1",
                  tags$span("S"), tags$span("M"), tags$span("T"), tags$span("W"), tags$span("T"), tags$span("F"), tags$span("S")
                )
              )
            )
          ),

          # Contacts Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_body(
                tags$div(
                  class = "d-flex justify-content-between align-items-center",
                  tags$div(
                    tags$h6(class = "card-title fw-bold mb-0", "Contacts"),
                    tags$small(class = "text-muted", "You have 245 clients")
                  ),
                  tags$button(class = "btn btn-light", shiny::icon("plus", verify_fa = FALSE))
                ),
                tags$ul(
                  class = "list-group list-group-flush mt-3",
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=4", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0 small", "Esther Howard"),
                        tags$small(class = "text-muted", "Head Manager")
                      )
                    ),
                    tags$a(href = "#", class = "text-muted", shiny::icon("ellipsis-vertical", verify_fa = FALSE))
                  ),
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=5", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0 small", "Jenny Wilson"),
                        tags$small(class = "text-muted", "Programmer")
                      )
                    ),
                    tags$a(href = "#", class = "text-muted", shiny::icon("ellipsis-vertical", verify_fa = FALSE))
                  ),
                  tags$li(
                    class = "list-group-item d-flex justify-content-between align-items-center px-0",
                    tags$div(
                      class = "d-flex align-items-center",
                      tags$img(src = "https://picsum.photos/50/50?random=6", class = "rounded-circle avatar me-3", alt = "Avatar"),
                      tags$div(
                        tags$h6(class = "mb-0 small", "Ronald Richards"),
                        tags$small(class = "text-muted", "Software Engineer")
                      )
                    ),
                    tags$a(href = "#", class = "text-muted", shiny::icon("ellipsis-vertical", verify_fa = FALSE))
                  )
                )
              )
            )
          ),

          # Earning Categories Card
          tags$div(
            class = "col-12",
            bslib::card(
              bslib::card_header("Earning Categories"),
              bslib::card_body(
                tags$img(src = "https://placehold.co/300x150/FD79A8/FFFFFF?text=Pie+Chart", class = "img-fluid my-3", alt = "Earning categories chart"),
                tags$div(
                  class = "d-flex justify-content-center text-center",
                  tags$div(
                    class = "px-3",
                    tags$p(class = "mb-0 fw-bold", "$8924"),
                    tags$span(class = "badge rounded-pill text-bg-light text-muted small fw-normal", "#investment")
                  ),
                  tags$div(
                    class = "px-3",
                    tags$p(class = "mb-0 fw-bold", "$441.45"),
                    tags$span(class = "badge rounded-pill text-bg-light text-muted small fw-normal", "#transfer")
                  )
                )
              )
            )
          )
        )
      )
    )
  )
}
