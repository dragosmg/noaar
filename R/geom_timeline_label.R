#' Add Annotation to Earthquake Data
#'
#' This geom adds a vertical line to each data point with a text annotation
#' (e.g. the location of the eartquake) attached to each line. Aesthetics are x,
#' which is the date of the eartquake and label which takes the column name from
#' which annotations will be obtained.
#'
#' @param mapping
#' @param data
#' @param stat
#' @param position
#' @param show.legend
#' @param inherit.aes
#' @param xmin
#' @param xmax
#' @param n_max
#' @param na.rm
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
geom_timeline_label <- function(mapping = NULL, data = NULL,
                                stat = "timeline_label", position = "identity",
                                show.legend = NA, inherit.aes = TRUE,
                                xmin = NULL, xmax = NULL, n_max = NULL,
                                na.rm = FALSE, ...) {
    ggplot2::layer(
        geom = GeomTimelineLabel, stat = stat, mapping = mapping, data = data,
        position = position, show.legend = show.legend,
        inherit.aes = inherit.aes,
        params = list(xmin = xmin, xmax = xmax, n_max = n_max, na.rm = na.rm,
            ...)
    )
}
