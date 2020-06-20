library(tidyverse)

head(iris)

# create tibble from an existing object with "as_tibble()"
# will work for reasonable inputs that are already data.frames, lists, matrices, or tables
as_tibble(iris)


# can also create a new tibble from column vectors with "tibble()"
tibble(x = 1:5, y = 1, z = x ^ 2 + y)


# define a tibble row-by-row with "tribble()"
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)