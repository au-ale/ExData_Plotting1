#Plot2
#Read in text file for desired dates(01-02-2007,02-02-2007), it needs to be separated by ";" 
#Change 'Date' to date format
#Create new column concatenate Date and Time columns
#Plot graph
#Save to png

power <- read.table("household_power_consumption.txt",sep = ";", header = FALSE,na.strings = "?",skip = 66637,nrows = 2880)
names(power) <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Date_Time <- paste(power$Date,power$Time)
power$Date_Time <- as.POSIXct(power$Date_Time)
class(power$Date_Time)
plot(power$Global_active_power~power$Date_Time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
