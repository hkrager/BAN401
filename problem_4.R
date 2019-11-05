# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 4 ####

# We have a deck of an unlimited number of cards, where each card has only one of the
# following values stamped on it:
#   “1 point”, “2 points”, “5 points”, “10 points”, “20 points”, “50 points”, “1 megapoint”,
# or “2 megapoints”.
# Notations:
#   1 megapoint = 100 points
# 2 megapoints = 200 points
# Based on the given specification, a possible scenario to buy one “2 megapoints”-card is to pay
# with the following set of cards:
#   - One “1 megapoint”-card
# - Two “20 points”-cards
# - One “50 points”-card
# - Three “1 point”-cards
# - One “2 points”-card
# - One “5 points”-card
# How many possible scenarios exist to buy one “2 megapoints”-card?
#   Write an R code (one .r script) to solve this problem. Your code should display a result in the
# RStudio console.
# Requirements:
#   - Solving this problem, you are not allowed to buy one “2 megapoints”-card paying with a “2
# megapoints”-card
# - Solving this problem, you are not allowed to have any packages loaded into your R script
# (no library() allowed)

deck_values <- c(1,2,5,20,50,100)
targetValue <- 200

combinations <- function(deck, target) {
  s <- deck_values
  m <- length(deck_values)
  n <- targetValue
  
  tab <- matrix(0, nrow=target+1, ncol=1)
  tab[1] = 1 # Base case (If given value is 0) 
  
  # Pick all coins one by one and update the table[] values 
  # after the index greater than or equal to the value of the 
  # picked coin 
  for (i in 1:length(deck)){
    for(j in deck[i]:target+1){
      tab[j] = tab[j] + tab[j-deck[i]]
    }
  }
  tail(tab,1)
}

deck_values_test <- c(1,2,3)
targetValue_test <- 4

combinations(deck_values_test, targetValue_test)
combinations(deck_values, targetValue)


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
