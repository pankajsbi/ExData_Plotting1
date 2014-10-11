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
plot(dat2,dat[,7],xlab="",ylab="Energy sub metering",type="n")
#Adding required data series one by one
lines(dat2,dat[,7])
lines(dat2,dat[,8],col="red")
lines(dat2,dat[,9],col="blue")
#Creating legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
#Saving plot into a plot3.png file
dev.copy(png,"plot3.png")
#Closing the device
dev.off()