#' Clean Raw NOAA Data
#'
#' The function takes a raw NOAA data frame and returns a clean data frame.
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' eq_clean_data(raw_noaa_data)
#' }
eq_clean_data <- function(data){
    noaa_raw_data %>%
        filter(YEAR > 1000) %>%
        mutate(MONTH = if_else(is.na(MONTH), 1L, MONTH),
               DAY = if_else(is.na(DAY), 1L, DAY),
               date = str_c(YEAR, MONTH, DAY, sep = "-"),
               date = ymd(date))
}
