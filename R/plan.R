
#' plan

#' Write basic plan
#' Là on écrit les fonctions que l'on utilisera pour la suite
#' il n'y a que les fonctions qui serviront à créer des targets
#'
#' @return A drake plan
#' @export
#'
#' @importFrom drake drake_plan
#' @examples
write_plan <- function() { # j'appelle la fonction write_plan_simple
  drake::drake_plan(
    eco_list = data_mammals_ecoregions(),
    sp_eco = data_ecoregion(),
    sp_list = data_mammals(),
    pantheria = data_pantheria()
  )
}


# on pourrait aussi utiliser une fonction de ce style avec read.csv:
#write_plan <- function() { # j'appelle la fonction write_plan_simple
#  drake::drake_plan(
#    eco_list = read.scv...
