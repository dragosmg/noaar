eq_location_clean <- function(data){
    data %>%
        mutate(pattern = word(LOCATION_NAME),
               LOCATION_NAME = str_replace(LOCATION_NAME, pattern, ""),
               LOCATION_NAME = str_to_title(LOCATION_NAME)) %>%
        select(-pattern)
}
