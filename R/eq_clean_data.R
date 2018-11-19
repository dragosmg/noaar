#' Clean Raw NOAA Data
#'
#' The function takes a raw NOAA data frame and returns a clean data frame.
#'
#' @param data
#'
#' @return
#' @export
#'
#' @importFrom dplyr filter, if_else, mutate
#' @importFrom lubridate ymd
#' @importFrom magrittr `%>%``
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
        dplyr::mutate(MONTH = dplyr::if_else(is.na(MONTH), 1L, MONTH),
                      DAY = dplyr::if_else(is.na(DAY), 1L, DAY),
                      date = stringr::str_c(YEAR, MONTH, DAY, sep = "-"),
                      date = lubridate::ymd(date))
}
