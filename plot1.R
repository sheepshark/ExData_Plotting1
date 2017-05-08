## Plot 1
par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))

hist(power_consumption_sub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col="Red")

## Export "Plot 1" png file 
dev.copy(png, file = "./power_consumption/plot1.png", height = 480, width = 480)

dev.off()