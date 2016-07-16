par(mfrow=c(2,2), mar=c(4,4,4,4))
epcdata<-read.table("C:/Users/Yulia/Desktop/fernstudium/datascientist/R/assigmnets/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")
head(epcdata)
subepc<-subset(epcdata, Date=="2/2/2007" | Date=="1/2/2007")
subepc$Global_active_power<-as.numeric(as.character(subepc$Global_active_power))

datetime <- strptime(paste(subepc$Date, subepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##plot1

plot(datetime, subepc$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
##plot2
Voltage<-as.numeric(as.character(subepc$Voltage))
plot(datetime,Voltage, type="l", xlab="datetime", ylab="Voltage")
##plot3
plot(datetime, subepc$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering", ylim=range(c(subepc$Sub_metering_1,subepc$Sub_metering_2, subepc$Sub_metering_3)))
lines(datetime,subepc$Sub_metering_2,type="l" ,col="red")
lines(datetime,subepc$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1,col=c("black","red","blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
##plot4
subepc$Global_reactive_power<-as.numeric(as.character(subepc$Global_reactive_power))
plot(datetime, subepc$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power")
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
