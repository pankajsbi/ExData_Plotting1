#Reading the relevant portion fromt the file,taken hints from discussion forum 
library(sqldf)
dat<-read.csv.sql("household_power_consumption.txt",sql="SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')",header=TRUE,sep=";")
#Converting the column containing date into "Date" format
dat1<-as.Date(dat[,1],format="%d/%m/%Y",header=TRUE)
#Merging the date and time columns
z<-paste(dat[,1],dat[,2])
#Converting merged date and time columns into Date/Time format
dat2<-strptime(z,format="%d/%m/%Y %H:%M:%S")
#Partitioning the graphic device to accomodate four plots(row wise)
par(mfrow=c(2,2))
#Amplifying the top and bottom margin
par(mar=c(4,4,2,2))
##Adding the first plot
#Creating an emplty plot
plot(dat2,dat[,3],xlab="",ylab="Global Active Power(kilowatts)",type="n")
#Adding the required line chart
lines(dat2,dat[,3])
##Adding the second plot
#Creating an emplty plot
plot(dat2,dat[,5],xlab="datetime",ylab="Voltage",type="n")
#Adding the required line chart
lines(dat2,dat[,5])
##Adding the third plot
#Creating an emplty plot
plot(dat2,dat[,7],xlab="",ylab="Energy sub metering",type="n")
#Adding required data series one by one
lines(dat2,dat[,7])
lines(dat2,dat[,8],col="red")
lines(dat2,dat[,9],col="blue")
#Creating legend and reducing it in size (help from R documentation on "par"
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.5)
##Adding the fourth plot
#Creating an emplty plot 
plot(dat2,dat[,4],xlab="datetime",ylab="Global_reactive_power",type="n")
#Adding required chart
lines(dat2,dat[,4])
#Saving as png file
dev.copy(png,"plot4.png")
#Closing the device
dev.off()


