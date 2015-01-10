#The requirement is to plot submeter data  for two days Feb 01 2007 and Feb 02 2007(Tursday and Friday)
#Read minimal amount of data that is required for the plot. Date, Time Sub_metering_1,Sub_metering_2,Sub_metering_3 for  two days Feb 01 2007 and Feb 02 2007 is required to plot data
#sqldf is used to filter data selectively
#Create plot and add addional information for submetering_2 and submetering_3
#Colors approximately match sample
#Graph is saved using dev.copy

#load data
SubMetering <- read.csv.sql("household_power_consumption.txt",sql = "select Date , Time ,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file where Date in( '1/2/2007','2/2/2007' ) " , sep = ";" )
# add posix date by concatenating date and time
SubMetering$date_time <- strptime(paste (SubMetering$Date,SubMetering$Time, sep = " "),format="%d/%m/%Y %H:%M:%S")

# create plot and append additional data 
plot(SubMetering$date_time, SubMetering$Sub_metering_1, type = "l" ,lwd=2,ylab="Energy sub metering",xlab="", col="darkgrey")
lines(SubMetering$date_time, SubMetering$Sub_metering_2,lwd=2, col="red")
lines(SubMetering$date_time, SubMetering$Sub_metering_3,lwd=2, col="blue")
#create leged
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2) , col=c("darkgrey","red","blue"))
#save as png
dev.copy(png,'plot3.png')
dev.off()