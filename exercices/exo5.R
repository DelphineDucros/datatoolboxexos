

# Exo 5
usethis::use_pipe()

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

pantheria_rsNA1 <- pantheria_rs %>%
  mutate(Max_longevity = na_if(Max_longevity, "-999"))

pantheria_rsNA1

pantheria_rsNA2 <- pantheria_rsNA1 %>%
  mutate(HR_indiv = na_if(HR_indiv, "-999"))

pantheria_rsNA3 <- pantheria_rsNA2 %>%
  mutate(Litters_per_year = na_if(Litters_per_year, "-999"))

pantheria_rsNA3



# Correction:

dat <- pantheria %>%
  mutate(                                    # Conversion de type
    order   = as_factor(MSW05_Order),
    family  = as_factor(MSW05_Family)
  ) %>%
  rename(                                    # Nom des colonnes
    adult_bodymass = `5-1_AdultBodyMass_g`,
    dispersal_age  = `7-1_DispersalAge_d`,
    gestation      = `9-1_GestationLen_d`,
    homerange      = `22-2_HomeRange_Indiv_km2`,
    litter_size    = `16-1_LittersPerYear`,
    longevity      = `17-1_MaxLongevity_m`
  )

dat <- dat %>%
  select(                                    # Sélection de colonnes
    order,
    family,
    adult_bodymass,
    dispersal_age,
    gestation,
    homerange,
    litter_size,
    longevity
  ) %>%
  na_if(-999)                                # Conversion des NA

dat                                          # dat %>% View()


# How many observations in family? In order?

# What is the mean home range by family? Standard deviation? The sample size?

pantheria_rsNA3 %>%
  count(MSW05_Order)

pantheria_rsNA3 %>%
  count(MSW05_Family)


pantheria_rsNA3 %>%
  filter(!is.na(HR_indiv)) %>%
  summarise(mean(HR_indiv))

pantheria_rsNA3 %>%
  filter(!is.na(HR_indiv)) %>%
  group_by(MSW05_Family) %>%
  summarise(m = mean(HR_indiv), sd = sd(HR_indiv),n = n())

pantheria_rsNA3

# Graph:

# Group by family, and select only those with more than 100 observations.

pantheria_rsNA3 %>%
  group_by(MSW05_Family) %>% # group by family
  mutate(n = n()) %>% # calculate number of entries per family
  filter(n > 100) %>% # select only the families with more than 100 entries
  ggplot() +
  aes(x = fct_reorder(family, n), y = n) + # order bars
  geom_col() +
  coord_flip() + # flip the bar chart
  xlab("Family") + # add label for X axis
  ylab("Counts") + # add label for Y axis
  ggtitle("Number of entries per family") # add title


