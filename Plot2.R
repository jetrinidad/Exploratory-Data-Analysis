library(data.table)
library(dplyr)

## Plot 2

## Downloading the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(getwd(), "exdata_data_household_power_consumption.zip"))
unzip(zipfile = "exdata_data_household_power_consumption.zip")


## Reading Data
DT2 <- data.table::fread("household_power_consumption.txt", na.strings = "?")

## Making a POSIXct type date column and filtering desired dates
DT2 <- mutate(DT2,dateTime = as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))%>%
        filter((dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))

## Opening the graphical device
png("plot2.png", width=480, height=480)

## Creating and saving the plot
plot(x = DT2$dateTime, y = as.numeric(DT2$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power (Kilowatts)")

dev.cur()
dev.off()