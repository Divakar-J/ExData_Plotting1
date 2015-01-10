#The requirement is to create histogram for a single variable global active power
#Only data for two days is used Feb 01 2007 and Feb 02 2007. That translates to 2880 rows and one column
#Read minimal amount of data that is required for the plot 
#sqldf is used to filter data selectively
#Graph is saved using dev.copy


require(sqldf)
#load data
ActivePower <- read.csv.sql("household_power_consumption.txt",sql = "select Global_active_power from file where Date in( '1/2/2007','2/2/2007' ) " , sep = ";" )
#create plot
hist(ActivePower$Global_active_power, col="red", xlab="Global Acitve Power (kilowatts)" , main="Global Active Power")
#save as png
dev.copy(png,'plot1.png',width=480, height=480)
dev.off()

