rm(list=ls())     # Environment Cleaning
#Atencao, abrir todos os arquivos no linux e depois salvar.
t1 = proc.time();

print(c('Comecando a execucao do programa.'))

N <- 10

bitsalice <- sample(0:1, N,TRUE)

#base da alice
basealice <- sample(0:1, N,TRUE)

#base do bob
basebob <- sample(0:1, N,TRUE)

bitsbob <- sample(0:1, N,TRUE)

bitscertos  <- matrix(2,1,N)

j1 <- 1
n1 <- 0

for (i1 in 1:N) {
  if (basealice[i1] == basebob[i1]) {
    bitsbob[i1] <- bitsalice[i1];
 #   n1 = n1+1   
    bitscertos[j1] <- bitsalice[i1]
    j1 <- j1+1
    n1 <- n1 + 1
 } #else bitsbob[i1] <- sample(0:1,1,TRUE)
}

bitscertos <- bitscertos[ bitscertos != 2 ]

if (N <= 15 ) {
print(c('Bases utilizadas: alice e depois bob.'))
print(basealice)

print(basebob)

print(c('Bits: alice e depois bob.'))

print(bitsalice)

print(bitsbob)

print(c('Bits certos.'))

print(bitscertos) }

print(c('Numero total de bits enviados pela Alice.'))
print(N)

print(c('Numero de bits corretos lidos por Bob.'))
print(n1)

print(c('Fracao dos bits lidos corretamente.'))
print(n1/N)

print(c('Se esta fracao ficar proximo de 0.5, e uma evidencia de.'))
print(c('que a Eva nao interceptou os dados.'))

print(c('Considerando agora uma interceptacao da Eva.'))

#base da eva
baseeva <- sample(0:1, N,TRUE)
bitseva <- sample(0:1, N,TRUE)

for (i2 in 1:N) if (basealice[i2] == baseeva[i2]) bitseva[i2] <- bitsalice[i2]
   # else bitseva[i2] <- sample(0:1,1,TRUE)
  

print(bitseva)
print(c('Porem, a Eva nao sabe quais dados estao certos, pois ela nao sabe a base da Alice.'))

bits2bob <- sample(0:1, N,TRUE)

for (i3 in 1:N) if (basebob[i3] == baseeva[i3]) bits2bob[i3] <- bitseva[i3]
  #else bits2bob[i3] <- sample(0:1,1,TRUE)


print(c('Bob le os dados interceptados e depois enviados pela Eva.'))

if (N <= 15 ) {
  print(c('Bases utilizadas: alice e depois bob.'))
  print(basealice)
  
  print(basebob)
  
  print(c('Bits: alice e depois bob.'))
  
  print(bitsalice)
  
  print(bits2bob)
  }

n4 <- 0
n5 <- 0

for (i4 in 1:N) {
  if (basealice[i4] == basebob[i4]) {
  if (bitsalice[i4] == bits2bob[i4] ) n4 <- n4 + 1
  else n5 <- n5 +1 }
}

print(c('Numero de bits lido corretamente por Bob.'))
print(n4)

print(c('Numero de bits lido erroneamente por Bob.'))
print(n5)

print(c('Se houver pelo menos um bit lido erroneamente, fica provado que houve interceptacao.'))





tempo <-(proc.time()-t1)[3]
s=sprintf('tempoo = %g',tempo)

print(c('Fim',s))



tempo
# fclose(fid);