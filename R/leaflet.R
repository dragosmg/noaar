#' @name eq_map
#'
#' @title eq_map
#'
#' @description A function to create a leaflet map of earthquakes and annotations.
#'
#' @details \code{eq_map} creates a map with the epicenters
#' (\code{LATITUDE} & \code{LONGITUDE}) of selected earthquakes and annotates
#' each point with a pop up window containing annotation data stored in a
#' column of the data frame (e.g. \code{DATE})
#'
#' @references
#'   \url{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}
#'
#' @param data A cleaned version of a NOAA data frame
#' @param annot_col A character. The column of the data frame for which to annotate the
#' pop up window for the selected earthquake.
#'
#' @return A leaflet map with earthquakes and annotations.
#'
#' @importFrom leaflet leaflet
#' @importFrom leaflet addTiles
#' @importFrom leaflet addCircleMarkers
#' @importFrom dplyr filter
#' @importFrom lubridate year
#'
#' @examples
#' \dontrun{
#' NOAAdf <- eq_clean_data("signif.txt")
#' NOAAdf %>%
#'         dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(DATE) >= 2000) %>%
#'         eq_map(annot_col = "DATE")
#' }
#'
#' @export
eq_map <- function(data, annot_col) {
    map <- data %>%
        leaflet::leaflet() %>%
        leaflet::addTiles() %>%
        leaflet::addCircleMarkers(lng = ~LONGITUDE,
                                  lat = ~LATITUDE,
                                  radius = ~EQ_PRIMARY,
                                  weight = 1,
                                  popup = data[[annot_col]])

    map
}


#' @name eq_create_label
#'
#' @title eq_create_label
#'
#' @description A function to create labels for popups of earthquakes in leaflet maps.
#'
#' @details \code{eq_create_label} pust together a character string for each earthquake
#' that will show the cleaned location (\code{LOCATION_NAME}, as cleaned by \code{eq_location_clean}),
#' the magnitude (e.g., \code{EQ_PRIMARY}), and the total number of deaths (e.g.,
#' \code{TOTAL_DEATHS}), with boldface labels for each. If an earthquake has missing
#' values for any of these, both the label and the value should be skipped.
#'
#' @references
#'   \url{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}
#'
#' @param data A cleaned version of a NOAA data frame
#'
#' @return A character vector of strings in html format to label the popups in
#'   \code{\link{eq_map}}
#'
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom lubridate year
#'
#' @examples
#' \dontrun{
#' NOAAdf <- eq_clean_data("signif.txt")
#' NOAAdf %>%
#'         dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(DATE) >= 2000) %>%
#'         dplyr::mutate(popup_text = eq_create_label(.)) %>%
#'         eq_map(annot_col = "popup_text")
#' }
#'
#' @export
eq_create_label <- function(data) {
    popup_labels <- with(data, {
        label1 <- ifelse(is.na(LOCATION_NAME), "",
                         paste("<strong>Location: </strong>",
                               LOCATION_NAME))
        label2 <- ifelse(is.na(EQ_PRIMARY), "",
                         paste("<strong>Magnitude: </strong>",
                               EQ_PRIMARY))
        label3 <- ifelse(is.na(TOTAL_DEATHS), "",
                         paste("<strong>Total deaths: </strong>",
                               TOTAL_DEATHS))
        paste(label1, label2, label3, sep = '<br/>')
    })

}
