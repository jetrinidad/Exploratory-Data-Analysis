library(data.table)
library(dplyr)

## Plot 4

## Downloading the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(getwd(), "exdata_data_household_power_consumption.zip"))
unzip(zipfile = "exdata_data_household_power_consumption.zip")

## Reading the dataset
DT4 <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?")


## Creating a POSIXct dateTime column and filtering desired dates
DT4 <- mutate(DT4,dateTime = as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))%>%
        filter((dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))

## Creating plot 4
png("plot4.png", width=480, height=480)

## Creating a matrix graphical device to show the 4 plots
par(mfrow=c(2,2))

## Plot 4-1
plot(x = DT4$dateTime, y = as.numeric(DT4$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power")
## Plot 4-2
plot(x = DT4$dateTime, y = as.numeric(DT2$Voltage), type = "l",
     xlab = "datetime", ylab = "Voltage")

## Plot 4-3
plot(DT4$dateTime, DT4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DT4$dateTime,DT4$Sub_metering_2,col="red")
lines(DT4$dateTime,DT4$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

## Plot 4-4
plot(x = DT4$dateTime, y = as.numeric(DT4$Global_reactive_power), type = "l",
     xlab = "datetime", ylab = "Global_Reactive_Power")
dev.off()
