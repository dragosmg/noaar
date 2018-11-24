#' Add Annotation to Earthquake Data
#'
#' A geom for labelling earthquake timeline plots created using
#' \code{\link{geom_timeline}}
#'
#' This geom adds a vertical line to each data point with a text annotation
#' (e.g. the location of the eartquake) attached to each line. Aesthetics are x,
#' which is the date of the eartquake and label which takes the column name from
#' which annotations will be obtained.
#'
#' @inheritParams ggplot2::geom_point
#' @inheritParams geom_timeline
#' @param n_max integer corresponding to the top number of earthquakes to label,
#'   sorted in descending order by magnitude
#' @param ... any additional relevant arguments
#'
#' @return a ggplot2 graphical object
#' @export
#'
#' @examples
#' \dontrun{
#'
#' }
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
