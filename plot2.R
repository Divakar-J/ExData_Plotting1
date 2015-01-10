#The requirement is to power global active power for two days Feb 01 2007 and Feb 02 2007(Tursday and Friday)
#Read minimal amount of data that is required for the plot. Date, Time and Global_active_power for  two days Feb 01 2007 and Feb 02 2007 is required to plot data
#sqldf is used to filter data selectively
#Graph is saved using dev.copy


require(sqldf)
#load data
ActivePower <- read.csv.sql("household_power_consumption.txt",sql = "select Date , Time ,Global_active_power from file where Date in( '1/2/2007','2/2/2007' ) " , sep = ";" )
# concatenate date and time . convert to posix type
ActivePower$date_time <- strptime(paste (ActivePower$Date,ActivePower$Time, sep = " "),format="%d/%m/%Y %H:%M:%S")
#plot data
plot(ActivePower$date_time, ActivePower$Global_active_power, type = "l" ,ylab="Global Acitve Power (kilowatts)",xlab="")
# save as png
dev.copy(png,'plot2.png',width=480, height=480)
dev.off()
