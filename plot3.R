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

## Plot 3
par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(power_consumption_sub, {
        plot(Sub_metering_1~DateTime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2~DateTime, col = "red")
        lines(Sub_metering_3~DateTime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
               bty = "n", inset = 0.1, 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Export "Plot 3" png file
dev.copy(png, file = "./power_consumption/plot3.png", height = 480, width = 480)

dev.off()