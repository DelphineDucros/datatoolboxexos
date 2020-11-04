

# Exo 5
usethis::use_pipe()
devtools::document(export = TRUE)

library(tidyverse)

pantheria <- readr::read_delim("data/pantheria-traits/PanTHERIA_1-0_WR05_Aug2008.txt", delim = "\t")

# Transform MSW05_Order and MSW05_Family columns in factors

pantheria

pantheria_m <- mutate(pantheria, MSW05_Order = as.factor(MSW05_Order))
pantheria_m

pantheria_m2 <- mutate(pantheria_m, MSW05_Family = as.factor(MSW05_Family))
pantheria_m2

# Rename columns 5-1_AdultBodyMass_g, 7-1_DispersalAge_d, 9-1_GestationLen_d, 22-2_HomeRange_Indiv_km2, 16-1_LittersPerYear,
# 17-1_MaxLongevity_m as you see fit

pantheria_r <- rename(pantheria_m2,
                      Adult_body_mass = '5-1_AdultBodyMass_g',
                      Disp_age= '7-1_DispersalAge_d',
                      Gest_len = '9-1_GestationLen_d',
                      HR_indiv = '22-2_HomeRange_Indiv_km2',
                      Litters_per_year = '16-1_LittersPerYear',
                      Max_longevity = '17-1_MaxLongevity_m')
pantheria_r

# Select a few columns for convenience, and at least: family, order, longevity, home range and litter size

pantheria_rs <- pantheria_r %>%
  select(MSW05_Family, MSW05_Order, Max_longevity, HR_indiv, Litters_per_year)

pantheria_rs


# Replace -999 by NA (hint: check out na_if() function)

# cette fonction appartient au package dplyr

pantheria_rsNA <- pantheria_rs %>%
  mutate(Max_longevity = na_if(Max_longevity, "-999"))

pantheria_rsNA







