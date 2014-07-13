setwd("~/Dropbox/work/zz_coursera/ex_data/ass1/ExData_Plotting1")

## Read the table
hpc <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".",
                 colClasses = c("character", "character", "numeric", "character", "character", "character", "numeric", "numeric"))

## Convert columns
hpc[[1]] <- as.Date(hpc[[1]], format = "%d/%m/%Y")

## Subset
hpc_sub = subset(hpc, as.Date(Date) == '2007-02-01' | as.Date(Date) == '2007-02-02')


## Plot the histogram
png(filename = "plot1.png", height = 480, width = 480)
hist(hpc_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
