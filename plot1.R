if (!file.exists("power_consumption")) {
        dir.create("power_consumption")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

file <- file.path("power_consumption.zip")

if (!file.exists(file)) {
        download.file(fileUrl, file)
        dateDownloaded <- Sys.time()
        unzip(file, exdir = "power_consumption")
}

power_consumption <- read.delim(
        "./power_consumption/household_power_consumption.txt", header = TRUE, 
        sep = ";", na.strings = "?")

power_consumption_sub <- power_consumption[(power_consumption$Date == 
                                                    "1/2/2007" | power_consumption$Date == "2/2/2007"),]

#format date and time
power_consumption_sub$Date <- as.Date(power_consumption_sub$Date, format="%d/%m/%Y")

datetime <- paste(power_consumption_sub$Date, power_consumption_sub$Time)

power_consumption_sub$DateTime <- as.POSIXct(datetime)

## Plot 1
par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))

hist(power_consumption_sub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col="Red")

## Export "Plot 1" png file 
dev.copy(png, file = "./power_consumption/plot1.png", height = 480, width = 480)

dev.off()