##read the data for the dates required
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##transform and concatenate date and time
datetime<-strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(subdata$Global_active_power)
png("plot2.png")
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 