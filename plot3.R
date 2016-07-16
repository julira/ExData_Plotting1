##plot3
epcdata<-read.table("C:/Users/Yulia/Desktop/fernstudium/datascientist/R/assigmnets/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")
subepc<-subset(epcdata, Date=="2/2/2007" | Date=="1/2/2007")
#transforming variables
datetime <- strptime(paste(subepc$Date, subepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subepc$Sub_metering_1<-as.numeric(subepc$Sub_metering_1)
subepc$Sub_metering_2<-as.numeric(subepc$Sub_metering_2)

plot(datetime, subepc$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering", ylim=range(c(subepc$Sub_metering_1,subepc$Sub_metering_2, subepc$Sub_metering_3)))
lines(datetime,subepc$Sub_metering_2,type="l" ,col="red")
lines(datetime,subepc$Sub_metering_3,type="l",lty=2,col="blue")
legend("topright", lty=1,col=c("black","red","blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()