#' Earthquakes timeline
#'
#' This geom plots a timeline of earthquakes between 2 dates, with options to
#' map different variables to other aesthetics. The x aesthetic is a date and
#' the y aesthetic is optional and needs to be a factor indicating some
#' stratification (e.g. country, magnitude, etc).
#'
#' @inheritParams ggplot2::geom_point
#'
#' @return
#' @export
#'
#' @importFrom ggplot2 layer
#'
#' @examples
#' \dontrun{
#'#' data %>% eq_clean_data() %>%
#'    filter(COUNTRY %in% c("GREECE", "ITALY"), YEAR > 2000) %>%
#'    ggplot(aes(x = DATE,
#'               y = COUNTRY)) +
#'    geom_timeline() +
#'    theme_timeline()
#' }
geom_timeline <- function(mapping = NULL, data = NULL, stat = "identity",
                          position = "identity", ..., na.rm = FALSE,
                          show.legend = NA, inherit.aes = TRUE) {
    ggplot2::layer(
        geom = GeomTimeline, mapping = mapping, data = data, stat = stat,
        position = position, show.legend = show.legend,
        inherit.aes = inherit.aes, params = list(na.rm = na.rm, ...)
    )
}
