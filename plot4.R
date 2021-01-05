##read the data for the dates required
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##transform and concatenate date and time
datetime<-strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## turning variables to numeric
GAP<- as.numeric(subdata$Global_active_power)
GRP<- as.numeric(subdata$Global_reactive_power)
VOL<- as.numeric(subdata$Voltage)
energy1<-as.numeric(subdata$Sub_metering_1)
energy2<-as.numeric(subdata$Sub_metering_2)
energy3<-as.numeric(subdata$Sub_metering_3)

##creating the png plot
png("plot4.png")
par(mfrow = c(2, 2))
plot(datetime,GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, VOL, type="l", xlab="datetime", ylab="Voltage")
plot(datetime,energy1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,energy2,type="l", col="red")
lines(datetime,energy3,type="l",col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 