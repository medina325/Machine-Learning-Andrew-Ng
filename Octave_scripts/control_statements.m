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

# Essa fun��o que criamos precisa estar definida em um arquivo chamado
# squareThisNumber.m, sen�o um erro ser� lan�ado
squareThisNumber(2)

# Obs.: se o arquivo que cont�m a fun��o n�o estiver no diret�rio atual,
# � necess�rio mudar o diret�rio de trabalho atual para onde o arquivo est�
# ou melhor ainda, adicionar a fun��o ao search path, para que possa se chamada
# de qualquer diret�rio, o comando para isso �:
#addpath('\minhasfuncoes');

[a,b] = squareAndCubeThisNumber(5);

# Finalmente vamos fazer uma fun��o
X = [1 1; 1 2; 1 3]

theta = [8; 1]
y = [1; 2; 3]
j = costFunctionJ(X, y, theta)