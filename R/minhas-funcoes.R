# GUARDAR AS FUNÇÕES CRIADAS EM AULAS
soma_digitos <- function(x){
  a <- x %/% 100
  b <- x %% 100 %/% 10
  c <- x %% 10
  soma <- a+b+c
  return(soma)
}
