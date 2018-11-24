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
