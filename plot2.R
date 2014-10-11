#Reading the relevant portion from the file
library(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE,sep=";")
#Converting the column containing date into "Date" format.
dat1<-as.Date(dat[,1],format="%d/%m/%Y",header=TRUE)
#Merging the date and time columns
z<-paste(dat[,1],dat[,2])
#Converting merged date and time columns into Date/Time foramt
dat2<-strptime(z,format="%d/%m/%Y %H:%M:%S")
#Creating an emplty plot
 plot(dat2,dat[,3],xlab="",ylab="Global Active Power(kilowatts)",type="n")
#Adding the required line chart
lines(dat2,dat[,3])
#Saving the chart in plot2.png file
dev.copy(png,"plot2.png")
#Closing the device
dev.off()
