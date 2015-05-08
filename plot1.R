## Plot 1: Draw a histogram for Global Active Power

## Reading the full data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

## Extracting data only for dates 1/2/2007 and 2/2/2007
dates.required <- data$Date == "1/2/2007" | data$Date =="2/2/2007"
data.dates.required <- data[dates.required, ]

## Saving the output to a PNG file
png(file = "plot1.png",
    width = 480, height = 480)

## Draw a histogram
hist(data.dates.required$Global_active_power,
     col = "Red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" ,
     ylab = "Frequency" )

dev.off()       ## Close the PNG file device