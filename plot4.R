## Plot 4: Draw a XY plot for Energy Sub metering vs days

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
png(file = "plot4.png",
    width = 480, height = 480)

## Draw a 2 X 2 xy plot

par(mfrow = c(2,2))     # Draw 2 X 2 plot

## Plot for Global Active Power (TopLeft)
plot(datetime, data.dates.required$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")


## Plot for Voltage (TopRight)
plot(datetime, data.dates.required$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")



## Plot for Energy sub metering (BottomLeft)
plot(datetime, data.dates.required$Sub_metering_1,
     type = "l",
     ylab = "Energy sub meeting",
     xlab = "")
lines(datetime, data.dates.required$Sub_metering_2, col = "red")
lines(datetime, data.dates.required$Sub_metering_3, col = "blue")

## Add a legend to the plot in the topright corner
legend("topright", lwd = 1,
       col =c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

## Plot for Global reactive power (BottomRight)
plot(datetime, data.dates.required$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()       ## Close the PNG file device