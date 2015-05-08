## Plot 2: Draw a XY plot for Global Active Power vs days

## Reading the full data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

## Extracting data only for dates 1/2/2007 and 2/2/2007
dates.required <- data$Date == "1/2/2007" | data$Date =="2/2/2007"
data.dates.required <- data[dates.required, ]

## changing dates and time variables to date/time classes
 dates <- data.dates.required$Date
 times <- data.dates.required$Time
 x <- paste(dates, times)
 datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")


## Saving the output to a PNG file
png(file = "plot2.png",
    width = 480, height = 480)

## Draw a xy plot with "lines" format

plot(datetime, data.dates.required$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
     
dev.off()       ## Close the PNG file device