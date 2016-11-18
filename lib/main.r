#### main script####

load(file.choose())

source(file.choose()) ### find string_convert.r
source(file.choose()) ### find matrix_convert.r
md <- string_convert(lyr)

matx <- matrix_convert(md, 'english')

k <- 5

lda <- LDA(matx, 10)

output_topics <- terms(lda,100)

output_label <- topics(lda)

write.csv(output_topics, 'topics_10_top100_words.csv')
write.csv(output_label, 'label_k10.csv')
