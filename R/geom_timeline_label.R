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


#' @name GeomTimelineLabel
#' @title GeomTimelineLabel
#' @description geom_timeline_label-ggproto. See \code{\link{geom_timeline_label}}.
#' @import ggplot2
#' @import grid
GeomTimelineLabel <-
    ggplot2::ggproto(
        "GeomTimelineLabel", ggplot2::Geom,
        required_aes = c("x", "label"),
        default_aes = ggplot2::aes(y = NULL, measure = NULL, alpha = 0.3,
                                   color = "grey", fill = "grey", lty = 1,
                                   lwd = 1),
        draw_key = ggplot2::draw_key_blank,
        draw_group = function(data, panel_params, coord) {
            coords <- coord$transform(data, panel_params)
            grid::gList(
                grid::segmentsGrob(
                    x0 = coords$x,
                    y0 = coords$y,
                    x1 = coords$x,
                    y1 = coords$y + .1,
                    gp = grid::gpar(col = "lightgrey",
                                    lty = coords$lty,
                                    lwd = coords$lwd)),
                grid::textGrob(
                    label = coords$label,
                    x = coords$x,
                    y = coords$y + .11,
                    just = c('left', 'center'),
                    rot = 45,
                    gp = grid::gpar(fontsize = grid::unit(10, "char")
                    )
                )
            )
            }
)
