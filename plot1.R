#Reading the relevant portion fromt the file,taken hints from discussion forum 
library(sqldf)
dat<-read.csv.sql("household_power_consumption.txt",sql="SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')",header=TRUE,sep=";")
#Converting the column containing date into "Date" format
dat1<-as.Date(dat[,1],format="%d/%m/%Y",header=TRUE)
#Merging the date and time columns
z<-paste(dat[,1],dat[,2])
#Converting merged date and time columns into Date/Time format
dat2<-strptime(z,format="%d/%m/%Y %H:%M:%S")
#Creating the first plot on screen device
hist(dat[,3],xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red")
#Saving the first plot to png file.
dev.copy(png,file="plot1.png")
dev.off()