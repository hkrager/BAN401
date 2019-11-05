# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 4

# Solution 1 ####
  # from https://www.geeksforgeeks.org/coin-change-dp-7/
combinations <- function(deck, target) {

  tab <- matrix(0, nrow=target+1, ncol=1)
  tab[1] = 1 # Base case (If given value is 0)
  
  # Pick all coins one by one and update the tab[]-values 
  # after the index greater than or equal to the value of the 
  # picked coin 
  for (i in 1:length(deck)){
    for(j in deck[i]:target+1){
      tab[j] = tab[j] + tab[j-deck[i]]
    }
  }
  tail(tab,1)
}
# Using function to solve exercise
deck_values <- c(1,2,5,20,50,100)
targetValue <- 200
combinations(deck_values, targetValue)


#### Solution 2 ####
  # from https://www.hackerrank.com/rest/contests/master/challenges/coin-change/hackers/shuangbaiba/download_solution 
mat <- matrix(0,targetValue,length(deck_values)) # initializes matrix where sum of combinations will be counted
dimnames(mat)[[2]] <- deck_values
mat[i,1] <- 1 # with only 1-point cards, there is only one possible solution
for (i in 2:length(deck_values)){ # iterates over all point values except 1-point which was set in previous line
  for (j in 1:targetValue){ # iterates over all values up to target value (200)
    while((j-(j-1)*deck_values[i])>0){
      mat[j,i] <- mat[j,i] + mat[j-(j-1)*deck_values[i], (i-1)] # number of combinations is 
    }
    if ((j-(j-1)*deck_values[i])==0) mat[j,i] <- mat[j,i]+1
    }
}
cat(" With possible values being:",deck_values, "\n",
    "Target value being:", targetValue, "\n",
    "There are", mat[targetValue,length(deck_values)], "different combinations")
mat[targetValue,length(deck_values)]
