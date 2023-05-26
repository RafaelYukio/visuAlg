Algoritmo "Jogo da Velha"
// Disciplina   : [Crash Course - Lógica de Programação]
// Professor   : Eri
// Venturus

Var
// Jogo da velha é uma matriz 3x3
jogo: vetor[1..3, 1..3] de caractere
// Cada jogada é um vetor de tamanho 2, para coordenadas
// Linha e Coluna
jogada: vetor[1..2] de inteiro
// Necessário contador de jogadas para caso acabe em velha
qtdJogadas: inteiro
// Variáveis para os loops
i, j: inteiro
// Variável para o programa saber quando parar
// É encerrado (fim = TRUE) quando alguém ganhar
// ou dar velha (atingir número máx. de jogadas que é 9)
fim: logico
// Variável para escolher jogar novamente após termino do jogo
opcao: inteiro

Inicio
// ---------------- Inicialização de Variáveis ----------------

fim <- FALSO
qtdJogadas <- 0

// ---------------- Inicialização de Funções ----------------

// Procedimento é um método/função sem retorno
// No caso é um procedimento apenas para mostrar na tela o jogo
procedimento printaJogo
inicio

       escreval("")
       escreval(jogo[1,1], " | ", jogo[1,2],  " | ", jogo[1,3])
       escreval(jogo[2,1], " | ", jogo[2,2],  " | ", jogo[2,3])
       escreval(jogo[3,1], " | ", jogo[3,2],  " | ", jogo[3,3])
       escreval("")

fimprocedimento


// Procedimento para verificar se alguém ganhou
procedimento verificaFim
inicio

   // Verifica se há "X" ou "O" repetidos 3 vezes, na linha ou coluna
   para i de 1 ate 3 faca
        // No primeiro SE, é verificado uma linha a cada loop
        se ((jogo[i,1] = jogo[i,2]) e (jogo[i,1] = jogo[i,3])) entao
           // Esse SE é para verificar se os CARACTERE repetidos não são apenas espaços " "
           se (jogo[i,1] <> " ") entao
              escreval("Jogador: '", jogo[i,1], "' ganhou, completando a linha: ", i)
              fim <- VERDADEIRO
           fimse
        fimse
        // No segundo SE, é verificado uma coluna a cada loop
        se ((jogo[1,i] = jogo[2,i]) e (jogo[1,i] = jogo[3,i])) entao
           se (jogo[1,i] <> " ") entao
              escreval("Jogador: '", jogo[j,i], "' ganhou, completando a coluna: ", i)
              fim <- VERDADEIRO
           fimse
        fimse
   fimpara

   // Verifica diagonal principal
   se (jogo[1,1] = jogo[2,2]) e (jogo[1,1] = jogo[3,3]) entao
      se (jogo[1,1] <> " ") entao
         escreval("Jogador: '", jogo[1,1], "' ganhou, completando a diagonal principal")
         fim <- VERDADEIRO
      fimse
   fimse
   // Verifica diagonal secundária
   se (jogo[1,3] = jogo[2,2]) e (jogo[1,3] = jogo[3,1]) entao
      se (jogo[1,3] <> " ") entao
         escreval("Jogador: '", jogo[1,3], "' ganhou, completando a diagonal secundária")
         fim <- VERDADEIRO
      fimse
   fimse
   
   // Caso o número de jogadas chegue a 9 (máximo possível para jogo da velha)
   // o jogo acaba em velha
   // Obs.: O jogo da velha sempre vai acabar com quem jogou primeiro
   // caso acabe em velha
   se (qtdJogadas = 9) e (fim <> VERDADEIRO) entao
      escreval("")
      escreval("Deu velha!")
      fim <- VERDADEIRO
   fimse

fimprocedimento


// Procedimento para zerar o jogo, colocando " " em toda a matriz
procedimento zeraJogo
inicio

   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
           jogo[i,j] <- " "
      fimpara
   fimpara

fimprocedimento

// ---------------- Inicialização do Jogo ----------------

// Inicia matriz do jogo com espaços (" ")
zeraJogo

// Inicia o jogo, repetindo as jogadas até alguém ganhar
repita

//////// ------ Lógica para registrar jogada do jogador ------

   repita
      repita
         // Tive que fazer 2 repitas com validações, pois em um só quebrava a execução
         // Provavelmente o programa avalia a linha inteira de uma vez,
         // então quando valores de coordenadas menores ou maiores que
         // a matriz eram inseridos, quebrava
         escreval("Jogada linha:")
         leia(jogada[1])
         escreval("Jogada coluna:")
         leia(jogada[2])

      // Esse ATÉ verifica se coordenadas inseridas são maiores que 1
      // e menores que 4, já que em uma matriz 3x3 não existem
      // coordenadas fora desse intervalo
      ate (jogada[1] > 0) e (jogada[1] < 4) e (jogada[2] > 0) e (jogada[2] < 4)
   // Esse ATÉ verfica se a coordenada inserida já não possui jogada ("X" ou "O")
   // Assim esses dois REPITAS garantem que o jogo não vai quebrar
   // impedindo que o jogador insira coordenadas inválidas
   ate (jogo[jogada[1],jogada[2]] <> "X") e (jogo[jogada[1],jogada[2]] <> "O")

   // Após jogador ter colocado coordenadas válidas, é registrado o valor na matriz
   jogo[jogada[1],jogada[2]] <- "X"
   // O contador de jogadas é incrementado em +1
   qtdJogadas <- qtdJogadas + 1

   // Print do jogo no console
   printaJogo
   // Verificação se alguém ganhou
   verificaFim

   //////// ------ Lógica para registrar jogada do computador ------

   se fim <> VERDADEIRO entao
      repita
         // Como limitamos os valores aleatórios inseridos
         // Não há necessidade de validar se os valores
         // maiores que 3 ou menores que 1
         aleatorio 1,3
         leia(jogada[1])
         leia(jogada[2])
         aleatorio off
      // Esse ATÉ verifica se na coordenada inserida pelo computador
      // já existe jogada
      ate (jogo[jogada[1],jogada[2]] <> "X") e (jogo[jogada[1],jogada[2]] <> "O")

      // Para exibir qual jogada aleatória foi gerada pelo computador
      escreval("")
      escreval("Jogada do computador linha:")
      escreval(jogada[1])
      escreval("Jogada do computador coluna:")
      escreval(jogada[2])

      // Inserida jogada do computador na matriz
      jogo[jogada[1],jogada[2]] <- "O"
      // O contador de jogadas é incrementado em +1
      qtdJogadas <- qtdJogadas + 1

      // Print do jogo no console
      printaJogo
      // Verificação se alguém ganhou
      verificaFim
   fimse

// SE que irá dar a opção de jogar novamente após termino do jogo
se fim = VERDADEIRO entao
   escreval("")
   escreval("Jogar novamente?")
   escreval("[1] - SIM")
   escreval("[2] - NÃO")
   leia(opcao)
   escreval("")
   // Caso escolha jogar novamente é preciso resetar as variáveis
   // de controle para fim do jogo (qtdJogadas é 0 e fim é FALSO)
   // O jogo é zerado para recomeçar (todos as jogadas viram " ")
   se opcao = 1 entao
      qtdJogadas <- 0
      fim <- FALSO
      zeraJogo
   fimse
fimse

ate (fim)

Fimalgoritmo