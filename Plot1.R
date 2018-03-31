setwd("C:/Users/skhanvilkar/Documents/neidata/")
getwd()
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataset_url, "neidata.zip")
unzip("neidata.zip", exdir = "neidata")
NEI <- readRDS("C:/Users/skhanvilkar/Documents/neidata/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/skhanvilkar/Documents/neidata/Source_Classification_Code.rds")
emitdata <- with(NEI, aggregate(Emissions, by = list(year), sum))
q1 <- subset(NEI, fips == "24510")
balt <- tapply(q1$Emissions, q1$year, sum)
plot(balt, type = "o", main = "Total PM2.5 Emissions in Baltimore County", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "blue", lty = 5)
dev.copy(png, file = "C:/Users/skhanvilkar/Documents/neidata/plot1.png") 
dev.off()


