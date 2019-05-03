library(data.table)
library(dplyr)


## Plot 3

## Downloading the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(getwd(), "exdata_data_household_power_consumption.zip"))
unzip(zipfile = "exdata_data_household_power_consumption.zip")

## Reading the dataset
DT3<- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")


## Creating a POSIXct dateTime column and filtering desired dates
DT3 <- mutate(DT3,dateTime = as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))%>%
        filter((dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))

## Opening the Graphical device
png("plot3.png", width=480, height=480)

## Creating, annotating and saving the plot in PNG form
plot(DT3$dateTime, DT3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DT3$dateTime,DT3$Sub_metering_2,col="red")
lines(DT3$dateTime,DT3$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.cur()
dev.off()
