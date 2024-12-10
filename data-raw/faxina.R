# FAXINA DE DADOS
library(tidyverse)
library(janitor)
library(readxl)
read_xlsx("data-raw/geomorfologia.xlsx") |>
  clean_names() -> df
glimpse(df)
write_rds(df,"data/geomorfologia.rds")
