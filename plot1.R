##read the data for the dates required
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##create png file
GAP<-as.numeric(subdata$Global_active_power)
png("plot1.png")
hist(GAP,col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()