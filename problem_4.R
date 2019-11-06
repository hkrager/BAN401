# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 4

# Solution 1 ####
  # from https://www.geeksforgeeks.org/coin-change-dp-7/
combinations_1 <- function(deck, target) {
  tab <- matrix(0, nrow=target+1, ncol=1)
  tab[1] = 1 # Base case (If given value is 0)
  for (i in 1:length(deck)){
    for(j in deck[i]:target+1){
      tab[j] = tab[j] + tab[j-deck[i]]
    }
  }
  tail(tab,1)
}
# Using function to solve exercise
deck_values <- c(1,2,5,10,20,50,100)
targetValue <- 200
combinations_1(deck_values, targetValue)


#### Solution 2 ####
  # from https://www.hackerrank.com/rest/contests/master/challenges/coin-change/hackers/shuangbaiba/download_solution 
combinations_2 <- function(deck,target){
mat <- matrix(0,target,length(deck)) # initializes matrix where sum of combinations will be counted
mat[,1] <- 1; # with 1 coin, there is only one possible combination for all target value iterations
for (i in 2:length(deck)){ # iterates over all possible point values
  for (j in 1:target){ # iterates over all values up to target value (200)
    k <- 0 # initializes variable k which is used to only sum correct combinations
    while((j-k*deck[i])>0){ 
      mat[j,i] <- mat[j,i] + mat[j-k*deck[i], (i-1)] # number of combinations is 
      k <- k+1
      }
    if ((j-k*deck[i])==0) mat[j,i] <- mat[j,i]+1
    }
}
cat(" With possible values being:",deck, "\n",
    "Target value being:", target, "\n",
    "There are", mat[target,length(deck)], "different combinations")
}

combinations_2(deck_values, targetValue)


# Test
test_deck1 <- c(1,3,5,7)
testTarget1 <- 4
testTarget2 <- 8
testTarget3 <- 11

# Solution 1
combinations_1(test_deck1, testTarget1)
combinations_1(test_deck1, testTarget2)
combinations_1(test_deck1, testTarget3)

# Solution 2
combinations_2(test_deck1, testTarget1)
combinations_2(test_deck1, testTarget2)
combinations_2(test_deck1, testTarget3)

