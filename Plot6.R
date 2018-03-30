setwd("C:/Users/skhanvilkar/Documents/neidata/")
getwd()
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataset_url, "neidata.zip")
unzip("neidata.zip", exdir = "neidata")
NEI <- readRDS("C:/Users/skhanvilkar/Documents/neidata/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/skhanvilkar/Documents/neidata/Source_Classification_Code.rds")
emitdata <- with(NEI, aggregate(Emissions, by = list(year), sum))
library(ggplot2)
q6 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lamot.sources <- aggregate(q6[c("Emissions")], list(type = q6$type, year = q6$year, zip = q6$fips), sum)
comp.mv <- rbind(baltmot.sources, lamot.sources)
qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")                   
dev.copy(png, file = "C:/Users/skhanvilkar/Documents/neidata/plot6.png") 
dev.off()


