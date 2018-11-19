#' Title
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
eq_clean_data <- function(data){
    noaa_raw_data %>%
        filter(YEAR > 1000) %>%
        mutate(MONTH = if_else(is.na(MONTH), 1L, MONTH),
               DAY = if_else(is.na(DAY), 1L, DAY),
               date = str_c(YEAR, MONTH, DAY, sep = "-"),
               date = ymd(date))
}
