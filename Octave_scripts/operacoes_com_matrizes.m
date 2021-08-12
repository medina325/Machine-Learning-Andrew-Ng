A = [1 2; 4 2; 1 23]
B = [2 1; 22 2; 1 2]
C = [1 1; 2 2]

# Operações com elementos das matrizes geralmente usam um '.' antes da operação

# Multiplicação elemento a elemento
A .* B

# Elevando cada elemento ao quadrado
A .^2

# Inversão elemento a elemento
1 ./ A

# Log, exponencial e módulo elemento a elemento
log(A)
exp(A)
abs(A)

# Comparação elemento a elemento
A < 3 # retorna matriz de true(1) e false(0) para cada elemento

# Achar index de elementos que correspondem a uma condição
find(A < 3)

