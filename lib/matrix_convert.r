matrix_convert <- function(text_string, language) {
        text <- as.vector(text_string)
        matx <- create_matrix(text_string, language = language)
        rowTotals <- apply(matx , 1, sum)
        matx.new   <- matx[rowTotals> 0, ]
        return(matx.new)
}