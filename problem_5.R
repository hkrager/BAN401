# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 5
tab3 <- read.csv('ban401_fuzzy-matching-table3.csv', sep = ';')
tab4 <- read.csv('ban401_fuzzy-matching-table4.csv', sep = ';')

tab5 <- tab3
patents <- NA*10
tab5 <- cbind(tab5, patents)
for (i in 1:length(tab3$Company.name)){
patents[i] <- length(agrep(droplevels(tab3$Company.name)[i],
                                droplevels(tab4$Applicant[tab4$Status=="Granted"]), 
                                ignore.case = T)) # number of patents
}
tab5 <- cbind(tab3, patents)
colnames(tab5)[5] <- "Total number of patents"
head(tab5, n = 5)
