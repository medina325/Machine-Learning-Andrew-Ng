v = zeros(10,1);

# for
for i=1:10,
  v(i) = 2^i;
end;

# Obs.: break e continue keywords funcionam normalmente

# while
i = 1;
while i <= 5,
  v(i) = 100;
  i = i+1;
end;

# Essa função que criamos precisa estar definida em um arquivo chamado
# squareThisNumber.m, senão um erro será lançado
squareThisNumber(2)

# Obs.: se o arquivo que contém a função não estiver no diretório atual,
# é necessário mudar o diretório de trabalho atual para onde o arquivo está
# ou melhor ainda, adicionar a função ao search path, para que possa se chamada
# de qualquer diretório, o comando para isso é:
#addpath('\minhasfuncoes');

[a,b] = squareAndCubeThisNumber(5);

# Finalmente vamos fazer uma função
X = [1 1; 1 2; 1 3]

theta = [8; 1]
y = [1; 2; 3]
j = costFunctionJ(X, y, theta)