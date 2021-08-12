A = [1 2; 4 2; 1 23]
B = [2 1; 22 2; 1 2]
C = [1 1; 2 2]

# Opera��es com elementos das matrizes geralmente usam um '.' antes da opera��o

# Multiplica��o elemento a elemento
A .* B

# Elevando cada elemento ao quadrado
A .^2

# Invers�o elemento a elemento
1 ./ A

# Log, exponencial e m�dulo elemento a elemento
log(A)
exp(A)
abs(A)

# Compara��o elemento a elemento
A < 3 # retorna matriz de true(1) e false(0) para cada elemento

# Achar index de elementos que correspondem a uma condi��o
find(A < 3)

