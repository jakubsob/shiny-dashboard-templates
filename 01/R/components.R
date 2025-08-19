dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

`%OR%` <- function(a, b) if (is.null(a)) b else a

sidebar_menu <- function(id = "sidebarMenu", ..., .list = NULL) {
  items <- c(list(...), .list)

  selectedItem <- NULL
  for (item in items) {
    if (!is.null(item$attribs$`data-start-selected`)) {
      selectedItem <- item$attribs$`data-value`
      break
    }
  }

  tagList(
    tags$input(
      type = "hidden",
      id = id,
      value = selectedItem %OR% ""
    ),
    items
  )
}

sidebar_menu_item <- function(
  text,
  ...,
  icon = NULL,
  badgeLabel = NULL,
  badgeColor = "success",
  tabName = NULL,
  href = NULL,
  newTab = TRUE,
  selected = NULL,
  expandedName = as.character(gsub("[[:space:]]", "", text)),
  startExpanded = FALSE,
  condition = NULL,
  .list = NULL
) {
  subItems <- c(list(...), .list)

  if (!is.null(icon)) {
    icon$attribs$class <- paste0(icon$attribs$class, " nav-icon")
  }

  if (!is.null(href) + !is.null(tabName) + (length(subItems) > 0) != 1) {
    stop("Must have either href, tabName, or sub-items (contained in ...).")
  }

  if (!is.null(badgeLabel) && length(subItems) != 0) {
    stop("Can't have both badge and subItems")
  }

  # Generate badge if needed
  if (!is.null(badgeLabel)) {
    validateStatus(badgeColor)
    badgeTag <- dashboardBadge(badgeLabel, color = badgeColor, position = "right")
  } else {
    badgeTag <- NULL
  }

  # Classic menuItem with 1 element (no subitems)
  if (length(subItems) == 0) {
    class_str <- if (isTRUE(selected)) {
      "nav-item sidebar-nav-item active"
    } else {
      "nav-item sidebar-nav-item"
    }

    return(
      tags$a(
        class = class_str,
        id = if (!is.null(tabName)) paste0("tab-", tabName),
        href = if (!is.null(href)) href else "#",
        target = if (!is.null(href) && newTab) "_blank",
        `data-tab` = tabName,
        `data-value` = tabName,
        `data-start-selected` = if (isTRUE(selected)) 1 else NULL,
        `data-display-if` = condition,
        onClick = if (is.null(href) && !is.null(tabName)) sprintf("switchTab('%s')", tabName),
        icon,
        tags$span(class = "ms-2", text, badgeTag)
      )
    )
  } else {
    # Menu item with subitems (collapsible menu)
    # Generate unique ID for collapse
    collapseId <- paste0("collapse-", expandedName)

    # Check if should start expanded
    isExpanded <- startExpanded

    return(
      tags$div(
        `data-display-if` = condition,
        tags$div(
          tags$a(
            class = "nav-item sidebar-nav-item w-100",
            "data-bs-toggle" = "collapse",
            "data-bs-target" = sprintf("#%s", collapseId),
            "aria-expanded" = if (isExpanded) "true" else "false",
            "aria-controls" = collapseId,
            href = sprintf("#%s", collapseId),
            `data-start-selected` = if (isTRUE(selected)) 1 else NULL,
            icon,
            tags$span(class = "ms-2", text, badgeTag)
          )
        ),
        tags$div(
          class = if (isExpanded) "collapse show" else "collapse",
          id = collapseId,
          tags$ul(
            class = "list-unstyled",
            subItems |> purrr::map(tags$li)
          )
        )
      )
    )
  }
}

sidebar_menu_sub_item <- function(
  text,
  tabName = NULL,
  href = NULL,
  newTab = NULL,
  icon = NULL,
  selected = NULL
) {
  if (!is.null(icon)) {
    icon$attribs$class <- paste0(icon$attribs$class, " nav-icon")
  }

  class_str <- if (isTRUE(selected)) {
    "ps-4 nav-item sidebar-nav-item sidebar-nav-subitem active"
  } else {
    "ps-4 nav-item sidebar-nav-item sidebar-nav-subitem"
  }

  tags$a(
    class = class_str,
    id = if (!is.null(tabName)) paste0("tab-", tabName),
    href = if (!is.null(href)) href else "#",
    target = if (!is.null(href) && newTab) "_blank",
    `data-tab` = tabName,
    `data-value` = tabName,
    `data-start-selected` = if (isTRUE(selected)) 1 else NULL,
    onClick = if (is.null(href) && !is.null(tabName)) sprintf("switchTab('%s')", tabName),
    icon,
    tags$span(class = "ms-2", text)
  )
}

theme <- bslib::bs_theme(
  version = 5,
  primary = "hsla(0, 0%, 5%, 1.00)",
  secondary = "#c3562e",
  bg = "hsla(0, 0%, 98%, 1.00)",
  fg = "hsla(0, 0%, 5%, 1.00)",
  "sidebar-bg" = "hsla(0, 0%, 100%, 1.00)",
  "card-bg" = "hsla(0, 0%, 100%, 1.00)",
  "spacer" = "1rem",
  "text-black-50" = "#E7E7E7",
  "gray-light" = "#fcfcfc",
  "gray-dark" = "#343a40",
  "btn-padding-y" = "0.5em",
  "btn-padding-x" = "0.5em",
  "border-radius" = "0.25rem",
  "card-border-radius" = "var(--bs-border-radius)",
  "card-box-shadow" = "none",
  "border-color" = "var(--bs-gray-100)",
  "input-border-color" = "var(--bs-gray-100)"
) |>
  bslib::bs_add_rules(sass::sass_file("www/main.scss"))

pickerInput <- purrr::partial(
  shinyWidgets::pickerInput,
  options = list(
    `actions-box` = TRUE,
    style = "btn-default",
    container = "body",
    `none-selected-text` = "Please make a selection!",
    size = "auto"
  )
)

virtualSelectInput <- purrr::partial(
  shinyWidgets::virtualSelectInput,
  additionalToggleButtonClasses = "btn btn-default"
)
