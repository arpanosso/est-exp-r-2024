# Pressupostos da Análise de Variância
# - Aditividade do modelo
# - Independência dos Erros (resíduo)
# - Igualdade das variância (Homocedasticidade)
# - Normalidade dos Erros (resíduo)

# Diagnósticos da ANOVA
library(tidyverse)
dados <- read_rds("data/geomorfologia.rds")
glimpse(dados)

# Identificar os valores da superfície
# para a variável argila
dados |>
  ggplot(aes(x=x,y=argila,color = sup)) +
  geom_point()

# Aplicando um modelo de delineamento
# inteiramente casualizado.
y <- dados |> pull(argila)
trat <- dados |> pull(sup) |> as_factor()

## Criar o modelo para análise
mod <- aov(y ~ trat)

## Estrutura do objeto mod
str(mod)

## Extraindo os resíduos do modelo
rs <- rstudent(mod)

## Extraindo os preditos pelo modelo
yp <- predict(mod)

## Começar o diagnóstico construindo um
## arquivo com trat, y, yp e rs
diagnostico <- tibble(trat,y,yp,rs)
diagnostico

# NORMALIDADE DOS RESÍDUOS
## Hitograma
diagnostico |>
  ggplot(aes(x=rs)) +
  geom_histogram(bins = 10,
                 color="black",
                 fill="gray") +
  theme_bw()

# QQ-Plot
diagnostico |>
  ggplot(aes(sample = rs)) +
  stat_qq() +
  stat_qq_line(color="blue")

## Aplicar os teste de normalidade
shapiro.test(rs) # Não rejeitamos H0
nortest::lillie.test(rs) # Não rejeitamos H0
nortest::cvm.test(rs) # Não rejeitamos H0
nortest::ad.test(rs) # Não rejeitamos H0

## Conclusão
## Os resíduos seguem uma distribuição Normal
## Boxplot ou Gráfico dos 5 números.
diagnostico |>
  ggplot(aes(x=trat, y=y,fill=trat)) +
  geom_boxplot()

# Teste de Homocedasticidade
# Teste de Levene
lawstat::levene.test(y,trat) # Rejeitamos H0

# Bartlett
bartlett.test(y,trat) # Rejeitamos H0

## Dados são heterocedásticos, precisamos
## estudar sua regularidade...
## calcular a média e avariância dos
## valores de y em função dos trat.
diagnostico |>
  group_by(trat) |>
  summarise(
    log_media = log(mean(y)),
    log_variancia = log(var(y))
  ) |>
  ggplot(aes(x=log_media, y= log_variancia))+
  geom_point() +
  geom_smooth(method = "lm",
              se=FALSE)

## Análise de regressão
modelo_lienar <- lm(log_variancia~log_media,
                    data = diagnostico |>
                      group_by(trat) |>
                      summarise(
                        log_media = log(mean(y)),
                        log_variancia = log(var(y))
                      ))
summary.lm(modelo_lienar)

# Não rejeitamos H0 para a estimativa do parâmetro Beta,
# ou seja, o coeficiente angular da equação linear. Portanto
# Concluímos que a Heterocedasticidade é Irregular.









