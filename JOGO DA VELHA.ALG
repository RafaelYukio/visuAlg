Algoritmo "Jogo da Velha"
// Disciplina   : [Crash Course - L�gica de Programa��o]
// Professor   : Eri
// Venturus

Var
// Jogo da velha � uma matriz 3x3
jogo: vetor[1..3, 1..3] de caractere
// Cada jogada � um vetor de tamanho 2, para coordenadas
// Linha e Coluna
jogada: vetor[1..2] de inteiro
// Necess�rio contador de jogadas para caso acabe em velha
qtdJogadas: inteiro
// Vari�veis para os loops
i, j: inteiro
// Vari�vel para o programa saber quando parar
// � encerrado (fim = TRUE) quando algu�m ganhar
// ou dar velha (atingir n�mero m�x. de jogadas que � 9)
fim: logico
// Vari�vel para escolher jogar novamente ap�s termino do jogo
opcao: inteiro

Inicio
// ---------------- Inicializa��o de Vari�veis ----------------

fim <- FALSO
qtdJogadas <- 0

// ---------------- Inicializa��o de Fun��es ----------------

// Procedimento � um m�todo/fun��o sem retorno
// No caso � um procedimento apenas para mostrar na tela o jogo
procedimento printaJogo
inicio

       escreval("")
       escreval(jogo[1,1], " | ", jogo[1,2],  " | ", jogo[1,3])
       escreval(jogo[2,1], " | ", jogo[2,2],  " | ", jogo[2,3])
       escreval(jogo[3,1], " | ", jogo[3,2],  " | ", jogo[3,3])
       escreval("")

fimprocedimento


// Procedimento para verificar se algu�m ganhou
procedimento verificaFim
inicio

   // Verifica se h� "X" ou "O" repetidos 3 vezes, na linha ou coluna
   para i de 1 ate 3 faca
        // No primeiro SE, � verificado uma linha a cada loop
        se ((jogo[i,1] = jogo[i,2]) e (jogo[i,1] = jogo[i,3])) entao
           // Esse SE � para verificar se os CARACTERE repetidos n�o s�o apenas espa�os " "
           se (jogo[i,1] <> " ") entao
              escreval("Jogador: '", jogo[i,1], "' ganhou, completando a linha: ", i)
              fim <- VERDADEIRO
           fimse
        fimse
        // No segundo SE, � verificado uma coluna a cada loop
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
   // Verifica diagonal secund�ria
   se (jogo[1,3] = jogo[2,2]) e (jogo[1,3] = jogo[3,1]) entao
      se (jogo[1,3] <> " ") entao
         escreval("Jogador: '", jogo[1,3], "' ganhou, completando a diagonal secund�ria")
         fim <- VERDADEIRO
      fimse
   fimse
   
   // Caso o n�mero de jogadas chegue a 9 (m�ximo poss�vel para jogo da velha)
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

// ---------------- Inicializa��o do Jogo ----------------

// Inicia matriz do jogo com espa�os (" ")
zeraJogo

// Inicia o jogo, repetindo as jogadas at� algu�m ganhar
repita

//////// ------ L�gica para registrar jogada do jogador ------

   repita
      repita
         // Tive que fazer 2 repitas com valida��es, pois em um s� quebrava a execu��o
         // Provavelmente o programa avalia a linha inteira de uma vez,
         // ent�o quando valores de coordenadas menores ou maiores que
         // a matriz eram inseridos, quebrava
         escreval("Jogada linha:")
         leia(jogada[1])
         escreval("Jogada coluna:")
         leia(jogada[2])

      // Esse AT� verifica se coordenadas inseridas s�o maiores que 1
      // e menores que 4, j� que em uma matriz 3x3 n�o existem
      // coordenadas fora desse intervalo
      ate (jogada[1] > 0) e (jogada[1] < 4) e (jogada[2] > 0) e (jogada[2] < 4)
   // Esse AT� verfica se a coordenada inserida j� n�o possui jogada ("X" ou "O")
   // Assim esses dois REPITAS garantem que o jogo n�o vai quebrar
   // impedindo que o jogador insira coordenadas inv�lidas
   ate (jogo[jogada[1],jogada[2]] <> "X") e (jogo[jogada[1],jogada[2]] <> "O")

   // Ap�s jogador ter colocado coordenadas v�lidas, � registrado o valor na matriz
   jogo[jogada[1],jogada[2]] <- "X"
   // O contador de jogadas � incrementado em +1
   qtdJogadas <- qtdJogadas + 1

   // Print do jogo no console
   printaJogo
   // Verifica��o se algu�m ganhou
   verificaFim

   //////// ------ L�gica para registrar jogada do computador ------

   se fim <> VERDADEIRO entao
      repita
         // Como limitamos os valores aleat�rios inseridos
         // N�o h� necessidade de validar se os valores
         // maiores que 3 ou menores que 1
         aleatorio 1,3
         leia(jogada[1])
         leia(jogada[2])
         aleatorio off
      // Esse AT� verifica se na coordenada inserida pelo computador
      // j� existe jogada
      ate (jogo[jogada[1],jogada[2]] <> "X") e (jogo[jogada[1],jogada[2]] <> "O")

      // Para exibir qual jogada aleat�ria foi gerada pelo computador
      escreval("")
      escreval("Jogada do computador linha:")
      escreval(jogada[1])
      escreval("Jogada do computador coluna:")
      escreval(jogada[2])

      // Inserida jogada do computador na matriz
      jogo[jogada[1],jogada[2]] <- "O"
      // O contador de jogadas � incrementado em +1
      qtdJogadas <- qtdJogadas + 1

      // Print do jogo no console
      printaJogo
      // Verifica��o se algu�m ganhou
      verificaFim
   fimse

// SE que ir� dar a op��o de jogar novamente ap�s termino do jogo
se fim = VERDADEIRO entao
   escreval("")
   escreval("Jogar novamente?")
   escreval("[1] - SIM")
   escreval("[2] - N�O")
   leia(opcao)
   escreval("")
   // Caso escolha jogar novamente � preciso resetar as vari�veis
   // de controle para fim do jogo (qtdJogadas � 0 e fim � FALSO)
   // O jogo � zerado para recome�ar (todos as jogadas viram " ")
   se opcao = 1 entao
      qtdJogadas <- 0
      fim <- FALSO
      zeraJogo
   fimse
fimse

ate (fim)

Fimalgoritmo