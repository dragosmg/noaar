#' Clean Location Name
#'
#' Cleans LOCATION_NAME by stripping out the country name (including the colon)
#' and converts names to title case (as opposed to all caps).
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
eq_location_clean <- function(data){
    data %>%
        mutate(pattern = word(LOCATION_NAME),
               LOCATION_NAME = str_replace(LOCATION_NAME, pattern, ""),
               LOCATION_NAME = str_to_title(LOCATION_NAME)) %>%
        select(-pattern)
}
