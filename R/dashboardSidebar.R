#' Create a Boostrap 4 dashboard main sidebar
#'
#' Build an adminLTE3 dashboard main sidebar
#'
#' @param ... Slot for \link{bs4SidebarMenu}.
#' @param title Sidebar title.
#' @param skin Sidebar skin. "dark" or "light"
#' @param status Sidebar status. "primary", "danger", "warning", "success", "info".
#' @param brandColor Brand color. NULL by default: "primary", "danger", "warning",
#' "success", "info", "white" or "gray-light".
#' @param url Sidebar brand link.
#' @param src Sidebar brand image.
#' @param elevation Sidebar elevation. 4 by default (until 5).
#' @param opacity Sidebar opacity. From 0 to 1. 0.8 by default.
#' @param img_sircle Sidebar logo round or square
# #' @param width Sidebar width. 250 px by default.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
bs4DashSidebar <- function(..., title = NULL, skin = "dark", status = "primary",
                                brandColor = NULL, url = NULL, src = NULL,
                                elevation = 4, opacity = .8, img_sircle = TRUE) {

  # brand logo
  brandTag <- if (!is.null(title)) {
    shiny::tags$a(
      class = if (!is.null(brandColor)) paste0("brand-link bg-", brandColor) else "brand-link",
      href = url,
      shiny::tags$img(
        src = src,
        class = ifelse(img_sircle, "brand-image img-circle elevation-3", "brand-image elevation-3"),
        style = paste0("opacity: ", opacity)
      ),
      shiny::tags$span(class = "brand-text font-weight-light", title)
    )
  }

  # sidebar content
  contentTag <- shiny::tags$div(
    class = "sidebar",
    shiny::tags$nav(
      class = "mt-2",
      ...
    )
  )

  sidebarTag <- shiny::tags$aside(
    class = paste0(
      "main-sidebar sidebar-", skin, "-", 
      status, " elevation-", elevation
    )
   )

  sidebarTag <- shiny::tagAppendChildren(sidebarTag, brandTag, contentTag)
  sidebarTag
  
  
  ## change sidebar width
  #shiny::tagList(
  #  shiny::singleton(
  #    shiny::tags$head(
  #      shiny::tags$style(
  #        shiny::HTML(
  #          paste0(
  #            ".main-sidebar, .main-sidebar:before {
  #              transition: margin-left 0.3s ease-in-out, width 0.3s ease-in-out;
  #              width: ", width, "px;
  #            }
  #            .sidebar-mini.sidebar-collapse .main-sidebar:hover {
  #                width: ", width, "px;
  #            }
  #            @media (min-width: 768px) {
  #              .content-wrapper,
  #              .main-footer,
  #              .main-header {
  #                transition: margin-left 0.3s ease-in-out;
  #                margin-left: ", width, "px;
  #                z-index: 3000;
  #              }
  #            }
  #            .nav-sidebar:hover {
  #              overflow: hidden;
  #            }
  #            "
  #          )
  #        )
  #      )
  #    )
  #  ),
  #  sidebarTag
  #)
  
}



#' Create a Boostrap 4 dashboard main sidebar menu
#'
#' Build an adminLTE3 dashboard main sidebar menu
#'
#' @param ... Slot for \link{bs4SidebarMenuItem} or \link{bs4SidebarHeader}.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
bs4SidebarMenu <- function(...) {
  
  # menuItems <- list(...)
  # navItems <- lapply(X = 1:length(menuItems), FUN = function(i) {
  #   # select only items with class nav-item
  #   menuItem <- menuItems[[i]]
  #   itemClass <- menuItem$attribs[["class"]]
  #   if (sum(grep(x = itemClass, pattern = "nav-item")) == 1) {
  #     menuItem
  #   } else {
  #     NULL
  #   }
  # })
  # # remove NULL elements
  # navItems <- navItems[!sapply(navItems, is.null)]
  # 
  # #handle the case we have a list of items in navItems and store it
  # #in another object
  # for (i in 1:length(navItems)) {
  #   subnavItem <- navItems[[i]]
  #   subnavItemClass <- subnavItem$attribs[["class"]]
  #   if (sum(grep(x = subnavItemClass, pattern = "has-treeview")) == 1) {
  #     navItems <- append(navItems, subnavItem$children[[2]]$children, i)
  #     navItems[[i]] <- NULL
  #     break
  #   }
  # }
  # navItems <- navItems[!sapply(navItems, is.null)]
  # 
  # selectedTabIndex <- lapply(X = 1:length(navItems), FUN = function(i) {
  #   children <- navItems[[i]]$children
  #   childrenClass <- children[[1]]$attribs[["class"]]
  #   if (sum(grep(x = childrenClass, pattern = "active show")) == 1) i
  # })
  # selectedTabIndex <- unlist(selectedTabIndex[!sapply(selectedTabIndex, is.null)])
  # 
  # # select the first tab by default if nothing is specified
  # if (is.null(selectedTabIndex)) {
  #   link <- navItems[[1]]$children[[1]]$attribs[["href"]]
  # } else {
  #   if (length(selectedTabIndex) == 1) {
  #     link <- navItems[[selectedTabIndex]]$children[[1]]$attribs[["href"]]
  #     # if more than two tabs have the active class
  #   } else {
  #     link <- NULL
  #   }
  # }
  # 
  # if (is.null(link)) stop("Only one item should be active in the sidebar")
  # 
  # # sidebar items hav an id like tab-cards (and body elements #shiny-tab-cards)
  # # useful to simulated a click
  # target <- gsub(x = link , pattern = "#shiny-", replacement = "")
  
  # menu Tag
  shiny::tags$ul(
    class = "nav nav-pills nav-sidebar flex-column",
    `data-widget` = "treeview",
    id = "mymenu",
    role = "menu",
    `data-accordion` = "false",
    ...
  )
  
}




# #' Create a Boostrap 4 dashboard main sidebar menu item list
# #'
# #' Build an adminLTE3 dashboard main sidebar menu item list
# #'
# #' @param ... Slot for bs4SidebarMenuItem.
# #' @param name Item list name.
# #' @param icon Item list icon.
# #' @param open Whether to display the item list in an open state. FALSE by default.
# #' @param active Whether the section is active. FALSE by default.
# #'
# #' @author David Granjon, \email{dgranjon@@ymail.com}
# #'
# #' @export
# bs4SidebarMenuItemList <- function(..., name = NULL, icon = NULL,
#                                    open = FALSE, active = FALSE) {
# 
#   menuItemCl <- "nav-item has-treeview"
#   if (isTRUE(open)) menuItemCl <- paste0(menuItemCl, " menu-open")
# 
#   shiny::tags$li(
#     class = menuItemCl,
#     shiny::tags$a(
#       href = "#",
#       `data-toggle` = "tab",
#       class = if (isTRUE(active)) "nav-link active" else "nav-link",
#       shiny::tags$i(class = paste0("nav-icon fas fa-", icon)),
#       shiny::tags$p(
#         name,
#         shiny::tags$i(class = "right fas fa-angle-left")
#       )
#     ),
#     shiny::tags$ul(
#       class = "nav nav-treeview",
#       ...
#     )
#   )
# }




#' Create a Boostrap 4 dashboard main sidebar menu item
#'
#' Build an adminLTE3 dashboard main sidebar menu item
#'
#' @param ... Item name.
#' @param tabName Should correspond exactly to the tabName given in \code{\link{bs4TabItem}}.
#' @param icon Item icon.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
bs4SidebarMenuItem <- function(..., tabName = NULL, icon = NULL) {

  shiny::tags$li(
    class = "nav-item",
    shiny::tags$a(
      class = "nav-link",
      id = paste0("tab-", tabName),
      href = paste0("#shiny-tab-", tabName),
      `data-toggle` = "tab",
      `data-value` = tabName,
      shiny::tags$i(class = paste0("nav-icon fas fa-", icon)),
      shiny::tags$p(
        ...
      )
    )
  )
}




#' Create a Boostrap 4 dashboard main sidebar header
#'
#' Build an adminLTE3 dashboard main sidebar header
#'
#' @param title SidebarHeader title.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
bs4SidebarHeader <- function(title) {
  shiny::tags$li(
    class = "nav-header",
    title
  )
}



#' Create a Boostrap 4 dashboard main sidebar user panel
#'
#' Build an adminLTE3 dashboard main sidebar user panel
#'
#' @param img User panel image path or url.
#' @param text User panel text.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
bs4SidebarUserPanel <- function(img = NULL, text = NULL) {
  shiny::tags$div(
    class = "user-panel mt-3 pb-3 mb-3 d-flex",
    shiny::tags$div(
      class = "image",
      shiny::img(src = img, class = "img-circle elevation-2")
    ),
    shiny::tags$div(
      class = "info",
      shiny::a(class = "d-block", href = "#", text)
    )
  )
}
