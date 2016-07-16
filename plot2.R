##plot2
epcdata<-read.table("C:/Users/Yulia/Desktop/fernstudium/datascientist/R/assigmnets/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")
subepc<-subset(epcdata, Date=="2/2/2007" | Date=="1/2/2007")
##transforming variables
subepc$Global_active_power<-as.numeric(as.character(subepc$Global_active_power))
datetime <- strptime(paste(subepc$Date, subepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime, subepc$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()
