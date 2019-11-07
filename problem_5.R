# set correct working directory
setwd('C:/Users/Yngve/Google Drive/Skolerelatert/NHH/Master/BAN401/BAN401 - Final Assignment')

#### Problem 5
tab3 <- read.csv('ban401_fuzzy-matching-table3.csv', sep = ';')
tab4 <- read.csv('ban401_fuzzy-matching-table4.csv', sep = ';')

tab5 <- tab3 # table 5 is going to include the whole content of table 3, plus one new column
grantedPatents <- c() # initializing new column where amount of patents will be kept
companies[i] <- (strsplit(gsub("(?<=[a-z])(?=[A-Z])", perl = TRUE, ';\\1', as.character(droplevels(tab3$Company.name)[i])), ";"))
  for (j in 1:length(companies)){
    if (length(companies[[j]]) > 1) {
      for (h in 1:length(companies[[j]])){
        numberOfPatents <- length(agrep(h,
                                        droplevels(tab4$Applicant[tab4$Status=="Granted"]), 
                                        ignore.case = T))
      }
    }
    else }

glaxo <- unlist(strsplit(gsub("(?<=[a-z])(?=[A-Z])", 
                     perl = TRUE, ';\\1', 
                     as.character(droplevels(tab3$Company.name)[3])), 
                ";"))
agrep(glaxo[2],
             droplevels(tab4$Applicant[tab4$Status=="Granted"]), 
             ignore.case = T)

tab5 <- cbind(tab3, patents) # combining the new patents column with the exisiting table 5
colnames(tab5)[5] <- "Total number of patents" # changing column
tab5 <- tab5[order(tab5$`Total number of patents`, decreasing = T),] # ordering data frame after number of granted patents
head(tab5, n = 5) # displaying five companies with highest amount of granted patents

split(as.character(droplevels(tab3$Company.name), f = )[3])

as.character(droplevels(tab3$Company.name)[3])


agrep(strsplit(gsub('([[:upper:]])', ' \\1', as.character(droplevels(tab3$Company.name)[3])), " ")[[1]],
      droplevels(tab4$Applicant[tab4$Status=="Granted"]), 
      ignore.case = T)

