
#' Get ecoregion data
#'
#' @return data.frame with info on ecoregions
#' @export
#'
data_ecoregion <- function() {

  readr::read_csv(here::here("data", "wwf-wildfinder", "wildfinder-ecoregions_list.csv"))

}



#' Get mammal species data
#'
#' @return data.frame with info on mammal species
#' @export
#'
data_mammals <- function() {

  readr::read_csv(here::here("data", "wwf-wildfinder", "wildfinder-mammals_list.csv"))

}


#' Get mammal <-> ecoregions data
#'
#' @return data.frame with info on which mammal species in ecoregions
#' @export
#'
data_mammals_ecoregions <- function() {

  readr::read_csv(here::here("data", "wwf-wildfinder", "wildfinder-ecoregions_species.csv"))

}


data_pantheria <- function() {

  readr::read_csv(here::here("data", "pantheria-traits", "wildfinder-PanTHERIA_1-0_WR05_Aug2008.txt"))

}
