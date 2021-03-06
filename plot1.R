epcdata<-read.table("C:/Users/Yulia/Desktop/fernstudium/datascientist/R/assigmnets/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")
head(epcdata)
subepc<-subset(epcdata, Date=="2/2/2007" | Date=="1/2/2007")
subepc$Global_active_power<-as.numeric(as.character(subepc$Global_active_power))
head(subepc)
hist(subepc$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()
