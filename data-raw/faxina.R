# FAXINA DE DADOS - geomorfologia
library(tidyverse)
library(janitor)
library(readxl)
read_xlsx("data-raw/geomorfologia.xlsx") |>
  clean_names() -> df
glimpse(df)
write_rds(df,"data/geomorfologia.rds")

# FAXINA DE DADOS - macieira
read_xlsx("data-raw/dadosprodmacieira.xlsx") |>
  clean_names() -> df
write_rds(df,"data/prodmacieira.rds")
