
# Setup

usethis::use_r(name = "wrangle.R")
usethis::use_r(name = "plots.R")
usethis::use_r(name = "plan.R")

file.create("_drake.R")
#file.create("make.R") eesayons de modifier celui que l'on a déjà
dir.create("output")
#dir.create("text") #on peut aussi utliser notre répertoire "exercices" ici ;)
dir.create("output/plots")
dir.create("output/text")
# alternativement on peut aussi faire clique-bouton pour créer les dossiers
# ça permet d'avoir tous les dossiers dès le début

# si on veut automatiser tout ça: aller voir sur son github à Nina
# et elle a créé une fonction fishproject pour tout générer d'un coup

# on travaille ds un research compendium donc on va les ajouter au RC
# à l'aide de la fonction suivante:

# add needed packages
usethis::use_package("dplyr")
usethis::use_package("ggplot2")
usethis::use_package("magrittr")
usethis::use_package("forcats")
install.packages("fishualize")
usethis::use_package("fishualize")
usethis::use_package("sf")
usethis::use_package("drake")

# problème: si le package n'est pas déjà dans le système, du coup
# ça ne fonctionne pas pour certains packages
# il faut le télécharger, d'où le fait que je l'ai rajotué

# si problème de dépendance, on peut faire: devtools::install_deps()


# ignore files: use_build_ignore() is designed to ignore individual files.
# ça permet de ne pas tout sauvegarder sur github (54')
#.Rbuildignore est un fichier qui liste les fichiers qui seront ignorés quand le package sera buildé/checké

usethis::use_build_ignore(".drake") # important pour celui là car peut devenir très gros et donc on ne veut pas l'importer
usethis::use_build_ignore("_drake.R")
usethis::use_build_ignore("make.R")
usethis::use_git_ignore(".drake")
usethis::use_build_ignore("output/")
usethis::use_build_ignore("text/")

#' Import pantheria data
#'
#' @return A 2 columns tibble linking species IDs to ecoregions IDs
#' @export
#' @importFrom readr read_csv
#' @importFrom here here
#'
data_pantheria   <- function() {
  readr::read_delim(
    here::here("data","pantheria-traits","PanTHERIA_1-0_WR05_Aug2008.txt"),
    delim = "\t")
}



