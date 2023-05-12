library("plyr")
school_df <- read.csv("G:/Redrock/Stevens/Datasets/Publicschool_cleaned.csv")
summary(school_df)

school_q <- read.csv("G:/Redrock/Stevens/Datasets/2013_2014_All_Schools_SQR.csv")
summary(school_q)

final_q_school <- merge(school_df,school_q,by="LOC.CODE")
# final_q <- setdiff(school_df$LOC.CODE,school_q$LOC.CODE)
# final_q
#I have 61 school reviews missing for final merged dataset final_q_school

final_q_school$DBN.x <- NULL
final_q_school$X <- NULL
final_q_school <- rename(final_q_school,c("DBN.y"="DBN"))
# tail(subset(final_q_school,select = c("DBN.x","DBN.y")))
names(final_q_school)
write.csv(final_q_school,"finalschool_qualitymerge.csv")