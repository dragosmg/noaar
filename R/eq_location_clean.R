#' Cleans earthquake location data
#'
#' @param data A data frame with raw data obtained from NOAA website
#'
#' @return A data frame with cleaned LOCATION_NAME column
#'
#' @details This function transforms NOAA data frame LOCATION_NAME column by
#' trimming the country name (if applicable) and converting to title case
#'
#' @note The function is not exported
#'
#' @examples
#' \dontrun{
#' data <- readr::read_delim("earthquakes.tsv.gz", delim = "\t")
#' clean_data <- eq_location_clean(data)
#' }
#'
#' @importFrom dplyr %>% mutate
#' @importFrom stringr str_replace str_trim str_to_title
eq_location_clean <- function(data) {
    data <- data %>%
        dplyr::mutate_(LOCATION_NAME = ~LOCATION_NAME %>%
                           stringr::str_replace(paste0(COUNTRY, ":"), "") %>%
                           stringr::str_trim("both") %>%
                           stringr::str_to_title())
    data
}
