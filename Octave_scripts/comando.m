# Esse arquivo vai servir como um resumão de comandos
# CONSULTE-O!!!

# Consultar informações de qualquer função
# <nome_funcao> help
help disp

# Imprimir no console
disp('Olá')

# Imprimir no console, que nem em C
disp(sprintf('Número com 5 casas decimais %0.5f', 10.2))

# Valor de pi sempre está disponível como
pi

# Inicializar uma matriz de uma linha com
v = 1:0.1:2
# Significa que o primeiro elemento vai ser 1, o último vai ser 2
# e que o tamanho do incremento de 1 até 2 é 0.1

# Se o incremento for 1 então basta fazer
v = 1:6

# Criar matriz (2x3) de 1's
ones(2,3)

# Criar matriz (3x3) de 0's
zeros(3,3)

# Criar matriz (3x3) de valores aleatórios
rand(3,3)

# Criar matriz (3x100) de valores aleatórios de uma distribuição gaussiana
randn(3,100) 

# Criar histograma
hist(randn(1,10))

# Criar matriz (3x3) identidade
eye(3)
