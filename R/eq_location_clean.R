#' Clean Location Name
#'
#' Cleans LOCATION_NAME by stripping out the country name (including the colon)
#' and converts names to title case (as opposed to all caps).
#'
#' @param data data frame containing raw NOAA data
#'
#' @return a data frame with clean location names
#' @export
#'
#' @importFrom rlang .data
#' @importFrom stringr str_replace str_to_title word
#'
#' @examples
eq_location_clean <- function(data){
    data %>%
        dplyr::mutate(pattern = stringr::word(.data$LOCATION_NAME),
               LOCATION_NAME = stringr::str_replace(.data$LOCATION_NAME,
                                                    .data$pattern, ""),
               LOCATION_NAME = stringr::str_to_title(.data$LOCATION_NAME)) %>%
        dplyr::select(-.data$pattern)
}
