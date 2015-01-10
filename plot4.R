#The requirement is to create 4 different plots ( in 2 by 2 format) for two days Feb 01 2007 and Feb 02 2007(Tursday and Friday)
#Read minimal amount of data that is required for the plot.Date , Time ,Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3 for both days
#sqldf is used to filter data selectively
#Colors approximately match sample
#Graph is saved using dev.copy

# use par for 4 subplot placeholder
par(mfrow=c(2,2))
# read data
ElectricPower <- read.csv.sql("household_power_consumption.txt",sql = "select Date , Time ,Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file where Date in( '1/2/2007','2/2/2007' ) " , sep = ";" )
# concatenate date and time and convert to posix
ElectricPower$date_time <- strptime(paste (ElectricPower$Date,ElectricPower$Time, sep = " "),format="%d/%m/%Y %H:%M:%S")
#plot 1 , top left
plot(ElectricPower$date_time, ElectricPower$Global_active_power, type = "l" ,ylab="Global Acitve Power",xlab="")
#plot 2 , top right
plot(ElectricPower$date_time, ElectricPower$Voltage, type = "l" ,ylab="Voltage",xlab="datetime")
#plot 3 , bottom left . add addtional data and legend
plot(ElectricPower$date_time, ElectricPower$Sub_metering_1, type = "l" ,lwd=2,ylab="Energy sub metering",xlab="", col="darkgrey")
lines(ElectricPower$date_time, ElectricPower$Sub_metering_2,lwd=2, col="red")
lines(ElectricPower$date_time, ElectricPower$Sub_metering_3,lwd=2, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2) , col=c("darkgrey","red","blue"))
#plot 4 . bottom right
plot(ElectricPower$date_time, ElectricPower$Global_reactive_power, type = "l" ,ylab="Global_reactive_power",xlab="datetime")
# save as png
dev.copy(png,'plot4.png')
dev.off()
