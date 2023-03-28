PYC <- function() {
  print("This is a game, Pao Ying Chup.")
  print("If you want to exit this game type 'GG'")
  
  player_score <- 0
  com_score   <- 0
  
  while (T) {
  print("Hammer, Scissor, Paper")
  player_select <- readline("Chose one :")
    
  options <- c("Hammer", "Scissor", "Paper")
  com_select <- sample(options,1)
  
  if (player_select == "Hammer" & com_select == "Paper") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You lose")
    com_score = com_score + 1
  } else if (player_select == "Hammer" & com_select == "Scissor") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You win")
    player_score = player_score + 1
  } else if (player_select == "Paper" & com_select == "Scissor") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You lose")
    com_score = com_score + 1
  } else if (player_select == "Paper" & com_select == "Hammer") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You win")
    player_score = player_score + 1
  } else if (player_select == "Scissor" & com_select == "Hammer") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You lose")
    com_score = com_score + 1
  } else if (player_select == "Scissor" & com_select == "Paper") {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("You win")
    player_score = player_score + 1
  } else if (player_select == com_select) {
    print( paste("Player :",player_select))
    print( paste("Computer :", com_select))
    print("Tie")
  } else if (player_select == "GG") {
    print("Thank you.")
      break
  } else {
    print("type Hammer, Scissor, Paper ONLY!")
  }
  }
  print("Your Scores")
  print( paste(player_score, "Point"))
  
}

