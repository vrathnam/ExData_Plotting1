## Plot 3: Draw a XY plot for Energy Sub metering vs days

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
png(file = "plot3.png",
    width = 480, height = 480)

## Draw a xy plot with "lines" format for "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"

plot(datetime, data.dates.required$Sub_metering_1,
     type = "l",
     ylab = "Energy sub meeting",
     xlab = "")
lines(datetime, data.dates.required$Sub_metering_2, col = "red")
lines(datetime, data.dates.required$Sub_metering_3, col = "blue")

## Add a legend to the plot in the topright corner
legend("topright", lwd = 1,
       col =c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

dev.off()       ## Close the PNG file device