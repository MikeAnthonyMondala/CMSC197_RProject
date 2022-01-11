#Second Mini Project

getwd()
setwd("C://Users//Asus//Desktop//1")

## Plot 1 ##

library("data.table")

DT <- fread(input = "household_power_consumption.txt", na.strings="?")

DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

DT <- DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)


hist(DT[, Global_active_power],
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="Red")

dev.off()


## Plot 2 ##

DT <- fread(input = "household_power_consumption.txt", na.strings="?")

DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = DT[, dateTime], 
     y = DT[, Global_active_power], 
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

## Plot 3 ##

DT <- fread(input = "household_power_consumption.txt", na.strings="?")

DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)


plot(DT[, dateTime], DT[, Sub_metering_1],
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2],
      col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],
      col="blue")
legend("topright", 
       col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))

dev.off()

## Plot 4 ##

DT <- fread(input = "household_power_consumption.txt", na.strings="?")

DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(DT[, dateTime], DT[, Global_active_power], 
     type="l", xlab="", 
     ylab="Global Active Power")

plot(DT[, dateTime],DT[, Voltage], 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(DT[, dateTime], DT[, Sub_metering_1], 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2], 
      col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],
      col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1),
       bty="n",
       cex=.5) 

plot(DT[, dateTime], DT[,Global_reactive_power], 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()