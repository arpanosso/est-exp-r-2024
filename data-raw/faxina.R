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

# FAXINA DE DADOS - producao-da-cultura
read_xlsx("data-raw/producao-de-cultura.xlsx") |>
  clean_names() -> df
write_rds(df,"data/producao-de-cultura.rds")

# FAXINA DE DADOS - ganho-de-peso
read_xlsx("data-raw/ganho-de-peso.xlsx") |>
  clean_names() -> df
write_rds(df,"data/ganho-de-peso.rds")

# FAXINA DE DADOS - dados-crotalaria
read_xlsx("data-raw/dados-crotalaria.xlsx") |>
  clean_names() -> df
write_rds(df,"data/dados-crotalaria.rds")

# FAXINA DE DADOS -subdividida
read.table("data-raw/subdividida.txt", h=TRUE) |>
  clean_names() -> df
write_rds(df,"data/subdividida.rds")

# FAXINA DADOS SOROLOGIA
df <- read_xlsx("data-raw/tabela_dados_vet.xlsx") |>
  janitor::clean_names() |>
  mutate(
    anemic = anemic == "Yes",
    blood_q_pcr = blood_q_pcr   == "Positive",
    culture_q_pcr = culture_q_pcr   == "Positive",
    isolate = isolate   == "Positive",
    ifa1 = ifa1   == "Positive",
    ifa2 = ifa2   == "Positive",
    ifa3 = ifa3   == "Positive",
    ifa = ifa1 | ifa2 | ifa3
  ) |> select(-ifa1, -ifa2, -ifa3)
write_rds(df, "data/tabela-dados-vet.rds")

