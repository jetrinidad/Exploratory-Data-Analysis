library(data.table)
library(dplyr)


## Plot 1

## Downloading the dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(getwd(), "exdata_data_household_power_consumption.zip"))
unzip(zipfile = "exdata_data_household_power_consumption.zip")

## Reading the dataset
DT <- data.table::fread("household_power_consumption.txt",na.strings = "?")

## Change Date column to date type and filtering dates

DT <- mutate(DT,dateTime = as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))%>%
        filter((dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))

## Opening the graphical device
png("plot1.png", width=480, height=480)

## Creating the histogram and saving the plot in PNG form
hist(DT$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")

dev.cur()
dev.off()