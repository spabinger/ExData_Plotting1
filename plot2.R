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

## Plot
png(filename = "plot2.png", height = 480, width = 480)
plot(hpc_sub$Time, hpc_sub$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()