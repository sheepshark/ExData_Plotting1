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