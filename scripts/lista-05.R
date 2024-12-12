# Lista 05 - 11/12/2024
# Carregar os pacotes
library(tidyverse)
library(agricolae)

# Carregar o arquivo geomorlogia
geomorfologia <- read_rds(
  "data/geomorfologia.rds"
  )
glimpse(geomorfologia)

# Estatística descritiva: por Sup e Solo
geomorfologia |>
  group_by(sup, solo) |>
  summarise(
    N = n(),
    MEDIA = mean(amg),
    DP = sd(amg),
    EPM = DP/sqrt(N),
    CV = 100*DP/MEDIA
  ) |>
  writexl::write_xlsx("output/estdesc.xlsx")
# Criar um resumo estatístico para todas
# as variáveis numéricas do banco de dados
est_desc <- function(x){
  n = length(x)
  media = mean(x)
  dp = sd(x)
  epm = dp/sqrt(n)
  return(c(n, media, dp, epm))
}

geomorfologia |>
  summarise(
    est_amg = est_desc(amg),
    est_ag = est_desc(ag),
    est_am = est_desc(am)
  )

# Aplicar pra todas as variáveis
# numéricas função est_desc
geomorfologia |>
  summarise(across(.cols = amg:v,
                   .fns = est_desc)) |>
  add_column(
    estatistica = c("N","Média","DP","EPM")
  ) |>
  relocate(estatistica) |>
  writexl::write_xlsx("output/est_geomorf.xlsx")

# Selecionar apenas as linhas da superficie II
geomorfologia |>
  filter(sup == "II") |>
  glimpse()

# Vamos ver a relação entre ca e mg na
# superfície 2
geomorfologia |>
  filter(sup == "II") |>
  ggplot(aes(x=ca,y=mg)) +
  geom_point() +
  geom_smooth(
    method = "lm",
    se=FALSE)

# Calculo do coeficiente de
# correlação linear
geomorfologia |>
  filter(sup=="II") |>
  select(ca,mg) |>
  cor()

# teste de hipótese
ca <- geomorfologia |>
  filter(sup == "II") |>
  pull(ca)

mg <- geomorfologia |>
  filter(sup == "II") |>
  pull(mg)

cor.test(ca,mg,
         alternative = "g")

## Calcular o r para várias variáveis
geomorfologia |>
  select(amg:v) |>
  cor() |>
  corrplot::corrplot(
    method = "ellipse",
    type = "upper"
  )























