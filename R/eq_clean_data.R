#' Clean Raw NOAA Data
#'
#' The function takes a raw NOAA data frame and returns a clean data frame.
#'
#' @param data data frame containing raw NOAA data
#'
#' @return a data frame of cleaned NOAA data
#' @export
#'
#' @importFrom dplyr filter if_else mutate
#' @importFrom lubridate ymd
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @importFrom stringr str_c
#'
#' @examples
#' \dontrun{
#' eq_clean_data(raw_noaa_data)
#' }
eq_clean_data <- function(data){
    data %>%
        dplyr::filter(.data$YEAR > 1000) %>%
        dplyr::mutate(MONTH = dplyr::if_else(is.na(.data$MONTH),
                                                   1L, .data$MONTH),
                      DAY = dplyr::if_else(is.na(.data$DAY),
                                           1L, .data$DAY),
                      date = stringr::str_c(
                          .data$YEAR, .data$MONTH, .data$DAY, sep = "-"),
                      date = lubridate::ymd(date))
}
