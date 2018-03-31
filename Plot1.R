q1 <- subset(NEI, fips == "24510")
balt <- tapply(q1$Emissions, q1$year, sum)
plot(balt, type = "o", main = "Total PM2.5 Emissions in Baltimore County", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "blue", lty = 5)
