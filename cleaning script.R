#load file
x<-read.csv('psgc_geotags.csv', header=TRUE, sep="|")

#for testing
#y <-head(x)

#change column name
colnames(x)[9]<-"raw_result"

#change raw_result column to character class
x$raw_result<-as.character(x$raw_result)

#Loop multiple times:
#1. Isolate the rows in raw_result that end in commas
#2. Delete the last characters of those rows (i.e., the end comma)
#3. Save the new string on the old spot.
for (i in (1:200)){
x[grep(",$", x$raw_result),]$raw_result<-substr(x[grep(",$", x$raw_result),]$raw_result,1,nchar(x[grep(",$", x$raw_result),]$raw_result)-1)
}

write.table(x, file="clean.txt", sep="|")