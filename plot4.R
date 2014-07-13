setwd("~/Dropbox/work/zz_coursera/ex_data/ass1/ExData_Plotting1")

## Read the table
hpc <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".",
                 colClasses = c("character", "character", "numeric", "character", "character", "character", "numeric", "numeric"))

## Convert columns
hpc[[1]] <- as.Date(hpc[[1]], format = "%d/%m/%Y")

## Subset
hpc_sub = subset(hpc, as.Date(Date) == '2007-02-01' | as.Date(Date) == '2007-02-02')

## Convert time
hpc_sub[[2]] <- strptime(paste(hpc_sub$Date, hpc_sub$Time), format = "%Y-%m-%d %H:%M:%S")


## Now plot
png(filename = "plot4.png", height = 480, width = 480)
par(mfcol = c(2, 2))

## Plot 1 (upper left)
plot(hpc_sub$Time, hpc_sub$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

## Plot 2 (lower left)
plot(hpc_sub$Time, hpc_sub$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(hpc_sub$Time, hpc_sub$Sub_metering_2, col="red")
lines(hpc_sub$Time, hpc_sub$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty = "n")

## Plot 3 (upper right)
plot(hpc_sub$Time, hpc_sub$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

## Plot 4 (lower right)
plot(hpc_sub$Time, hpc_sub$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()
