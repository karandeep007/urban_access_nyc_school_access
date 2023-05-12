#   #basics
# # array(c(seq(1,20)),dim=c(2,20))
# a <- list("Name"=c("Karan","Harsh"),"Contact"=c(120820,101010))
# a
# #str(a)
# # a[[1]]

  #data frames

info <- data.frame(col1=(c('a','b',NA,'a','f')),
                   col2=(c("harry","young","Shely","Tough guy","Chotu")),
                   col3=(c(1,1,1,NA,1)))

for(i in 1:nrow(info))
{
  for(j in 1:ncol(info))
  {
    print(info[i,j])
  }
}
