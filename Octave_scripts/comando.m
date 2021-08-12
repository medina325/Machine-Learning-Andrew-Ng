# Esse arquivo vai servir como um resum�o de comandos
# CONSULTE-O!!!

# Consultar informa��es de qualquer fun��o
# <nome_funcao> help
help disp

# Imprimir no console
disp('Ol�')

# Imprimir no console, que nem em C
disp(sprintf('N�mero com 5 casas decimais %0.5f', 10.2))

# Valor de pi sempre est� dispon�vel como
pi

# Inicializar uma matriz de uma linha com
v = 1:0.1:2
# Significa que o primeiro elemento vai ser 1, o �ltimo vai ser 2
# e que o tamanho do incremento de 1 at� 2 � 0.1

# Se o incremento for 1 ent�o basta fazer
v = 1:6

# Criar matriz (2x3) de 1's
ones(2,3)

# Criar matriz (3x3) de 0's
zeros(3,3)

# Criar matriz (3x3) de valores aleat�rios
rand(3,3)

# Criar matriz (3x100) de valores aleat�rios de uma distribui��o gaussiana
randn(3,100) 

# Criar histograma
hist(randn(1,10))

# Criar matriz (3x3) identidade
eye(3)
