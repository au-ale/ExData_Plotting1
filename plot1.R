
#Plot1
#Read in text file for desired dates(01-02-2007,02-02-2007), it needs to be separated by ";" 
#Change to date format
#Create a historgram with all correct labels
#save to png file

power <- read.table("household_power_consumption.txt",sep = ";", header = FALSE,na.strings = "?",skip = 66637,nrows = 2880)
names(power) <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
as.Date(power$Date,format="%d/%m/%Y")
with(power,hist(Global_active_power,main = "Global Active Power",col = "red",ylab = "Frequency",xlab = "Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

