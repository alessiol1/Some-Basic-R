library(devtools)
# devtools::install_github("rstudio/EDAWR")
library(EDAWR)
# Datasets
# ?storms
# ?cases
# ?pollution
# ?tb



library(tidyr)
# Main functions:
# ?gather   -> Make observations from variables
# ?spread   -> Make variables from observations
# ?unite    -> unites columns into a single column
# ?separate -> splits a column by a character string separator


# gather() Bsp. mit cases Datenset
head(cases)
gather(cases, "year", "n", 2:4)


# spread() Bsp. mit pollution Datenset
head(pollution)
spread(pollution, size, amount)


# separate() Bsp. mit storms Datenset
head(storms)
separate(storms, date, c("year", "month", "day"), sep = "-")


# unite() Bsp. mit storms Datenset
storms2 = separate(storms, date, c("year", "month", "day"), sep = "-")
head(storms2)

unite(storms2, "date", year, month, day, sep = "-")


library(dplyr)
# Effizienter als viele Funktionen ineinander zu verschachteln
# Bsp.
PlantGrowth$weight %>%
  sum()%>%
  round(1)
# Main functions
# ?select     -> extract existing variable
# ?mutate     -> derive new variables from existing ones
# ?filter     -> extract existing observations
# ?summarise  -> change the unit of analysis
# ?arrange    ?group_by

# Bsp. select()
head(storms)
select(storms, name, pressure)
select(storms, -name)
select(storms, category:pressure)

# Bsp. filter()
head(storms)
filter(storms, wind >= 50)
filter(storms, wind >= 50, name %in% c("Alberto","Alex","Alison"))

# Bsp. mutate()
head(storms)
mutate(storms, ratio = pressure / wind)
mutate(storms, ratio = pressure / wind, inverse = ratio^-1)

# Bsp. summarise()
head(pollution)
pollution %>% summarise(median = median(amount), variance = var(amount), n = n())

# Bsp. arrange()
head(storms)
arrange(storms, wind)
arrange(storms, desc(wind))
arrange(storms, wind, pressure)

# Bsp. group_by()
head(pollution)
pollution %>% group_by(city) %>% 
  summarise(mean = mean(amount), sum = sum(amount), n = n())
  
pollution %>% group_by(size) %>% 
  summarise(mean = mean(amount), sum = sum(amount), n = n())

# Other dplyr functions
# ?bind_cols
# ?bind_rows
# ?union      -> ABC + BCD = ABCD
# ?setdiff    -> ABC + BCD = AD
# ?intersect  -> ABC + BCD = BC