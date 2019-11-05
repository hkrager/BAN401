# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 4 ####

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
# Using function on values from task
deck_values <- c(1,2,5,20,50,100)
targetValue <- 200
combinations(deck_values, targetValue)


#### Solution from geeksforgeeks ####

# n = targetValue, S//arr = deck_values, m = len(s)
# def count(S, m, n): 
#   
#   # table[i] will be storing the number of solutions for 
#   # value i. We need n+1 rows as the table is constructed 
#   # in bottom up manner using the base case (n = 0) 
#   # Initialize all table values as 0 
#   table = [0 for k in range(n+1)] 
# 
# # Base case (If given value is 0) 
# table[0] = 1
# 
# # Pick all coins one by one and update the table[] values 
# # after the index greater than or equal to the value of the 
# # picked coin 
# for i in range(0,m): 
#   for j in range(S[i],n+1): 
#   table[j] += table[j-S[i]] 
# 
# return table[n] 
# 
# # Driver program to test above function 
# arr = [1, 2, 3] 
# m = len(arr) 
# n = 4
# x = count(arr, m, n) 
# print (x) 




#### Solution 2 ####
  # from https://www.hackerrank.com/rest/contests/master/challenges/coin-change/hackers/shuangbaiba/download_solution 


mat <- matrix(0,targetValue,length(deck_values))
for (i in 2:length(deck_values)){
  for (j in 1:targetValue){
    k <- 0
    while((j-k*deck_values[i])>0){
      mat[j,i] <- mat[j,i] + mat[j-k*deck_values[i], (i-1)]
      k <- k+1
    }
    if ((j - k*deck_values[i])==0){
      mat[j,i]+1
    }
  }
}
write.table(ans[targetValue,length(deck_values)],row.names = F, col.names = F)
