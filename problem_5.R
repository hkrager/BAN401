# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 5
tab3 <- read.csv('ban401_fuzzy-matching-table3.csv', sep = ';')
tab4 <- read.csv('ban401_fuzzy-matching-table4.csv', sep = ';')

tab5 <- tab3 # table 5 is going to include the whole content of table 3, plus one new column
grantedPatents <- list(); companies <- list() # initializing new column where amount of patents will be kept


for(i in 1:length(tab3$Company.name)){
  companies[i] <- (strsplit(gsub("(?<=[a-z])(?=[A-Z])", perl = TRUE, ';\\1', 
                                 as.character(droplevels(tab3$Company.name)[i])), ";"))
  
  for (j in length(companies[[i]])){
    amountGranted <- length(agrep(companies[[i]][j],
                                  droplevels(tab4$Applicant[tab4$Status=="Granted"]),
                                  ignore.case = T))
    
    if (amountGranted != 0){grantedPatents[i] <- amountGranted} else{grantedPatents[i] <- 0}
    }
  }
tab5$`Total number of patents` <- unlist(grantedPatents)
row.names(tab5) <- NULL
tab5 <- tab5[order(tab5$`Total number of patents`, decreasing = T),] # ordering data frame after number of granted patents
head(tab5, n = 5) # displaying five companies with highest amount of granted patents



