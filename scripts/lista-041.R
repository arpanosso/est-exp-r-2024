# Lista 4.1 - 11/10/2024
# Exercício 01
frase <- "A vida é bela!!"
n <- 10
# para comparar ao n, preciso de
# uma variável auxiliar de
# contagem (i, j, k, l, m)
i <- 1
while(i <= n){
  print(frase)
  i <- i + 1
}

for(j in 1:n){
  print(frase)
}

k <- 1
repeat{
  print(frase)
  k <- k + 1
  if(k > n) break
}

for(i in 1:n){
  print(paste0(frase,"-",i))
}

# Exercício 2
# imprimir na tela os números de 1 a 20
1:20
20:1
seq(0,20,2)
seq(20,0,-2)

# Gerar a sequência:
# 1, -2, 3, -4, 5, -6, 7
for(i in  1:7){
  if(i %% 2 == 0){
    print(-i)
  }else{
      print(i)
    }
}
# ou 1:7*(-1)^(1:7)*(-1)

# Exercício 03
seq(0,25,2)
10:(-10)

# Exercício 04
S <- 0
for(i in 1:10){
  if(i %% 2 ==1){
    S = S + i/i^2
  }else{
    S = S - i/i^2
  }
}
S
4/4^2
.8333333-0.25

# Exercício 6
idade <- c(22, 28, 44, 35, 30)

# tirar a média
media <- mean(idade)
# classificar se média entre 0 e 25 - jovem
# se média entre 26 e 60 - adulto
# se média maior que 60 idosa
if(mean(idade) <=25){
  print("Jovem")
} else if(media <=60){
  print("Adulta")
} else {
  print("Idosa")
}

# Criação de Função
multiplicador <- function(x,y){
  r = x*y
  return(r)
}
multiplicador(4,5)
multiplicador(4,3)
multiplicador(256,36)

# Função que calcula
# y = 3 -4x (função linear)
calculo_linear <- function(x){
  y = 3 -4*x
  return(y)
}
calculo_linear(2)

# Cáclulo da área sob a curva
# normal padrão -1 a 1
# 1 Construir a função normal
minha_normal <- function(x, mu, sigmma){
  y = 1/sqrt(2*pi*sigmma^2)*exp(-1/2*((x-mu)/sigmma)^2)
  return(y)
}
minha_normal(1,0,1)

# 2 Construir o eixo x
delta <- 0.001
x <- seq(-1,1,delta)

# 3 Construir o eixo y (densidade)
y <- minha_normal(x,0,1)
plot(x,y)

# 4 Calcular as áreas (Regra do Trapézio)
area <- 0
for(i in 1:(length(y)-1)){
  area[i] = (y[i]+y[i+1])*delta/2
}

# 5 Integrar as áreas (integral)
sum(area)
































