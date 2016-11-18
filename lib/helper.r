#### helper functions ####
#install.packages("RTextTools")
#install.packages("topicmodels")

# Load libraries
require(RTextTools)
library(topicmodels)
library(rhdf5)

# Manually adjusted probabilities for all terms
adjust_prob <- function(lyr, label) {
        new_lyr <- lyr[-237,]
        df <- cbind(label, new_lyr)
        result <- data.frame(matrix(seq(20), nrow = max(as.numeric(label)), ncol = 5000))
        for (lb in 1:max(as.numeric(label))) {
                holder <- subset(df, df[,1] == lb)
                holder <- colSums(holder[,3:5002])
                tot <- sum(holder)
                prop <- holder / tot
                result[lb,] <- prop
        }
        result <- t(result)
        result <- cbind(colnames(new_lyr)[2:5001], result)
        result <- result[-c(2,3,6:30),]
        return(result)
}

write.csv(adjust_prob(lyr,output_label),file = paste(data_output_path, "adjust_propotion_20.csv", sep=""))



# Convert tokenized terms to single string
string_convert <- function(lyr) {
        result <- data.frame()
        for (row in 1:(nrow(lyr))) {
                words <- NULL
                for (col in 2:(ncol(lyr)-1)) {
                        if (lyr[row,col] != 0) {
                                kw <- rep(colnames(lyr)[col],lyr[row,col])
                                kw <- paste(kw, collapse=' ')
                                words <- paste(words, kw)
                        }
                }
                result[row,1] <- words
        }
        return(result)
}

# Convert strings to matrix
matrix_convert <- function(text_string, language) {
        text <- as.vector(text_string)
        matx <- create_matrix(text_string, language = language)
        rowTotals <- apply(matx , 1, sum)
        matx.new   <- matx[rowTotals> 0, ]
        return(matx.new)
}

