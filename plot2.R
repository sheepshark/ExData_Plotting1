## Plot2
par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(power_consumption_sub$Global_active_power~power_consumption_sub$DateTime, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Export "Plot 2" png file
dev.copy(png, file = "./power_consumption/plot2.png", height = 480, width = 480)

dev.off()