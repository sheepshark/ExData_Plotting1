## Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(power_consumption_sub, {
        plot(Global_active_power~DateTime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(Voltage~DateTime, type = "l", ylab = "Voltage (volt)", xlab = "")
        plot(Sub_metering_1~DateTime, type = "l", ylab = 
                     "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2~DateTime, col = "red")
        lines(Sub_metering_3~DateTime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
               bty = "n", inset = 0.1, cex = 0.5, 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type = "l", 
             ylab = "Global Rective Power (kilowatts)", xlab = "")
})

## Export "Plot 4" png file
dev.copy(png, file = "./power_consumption/plot4.png", height = 480, width = 480)

dev.off()