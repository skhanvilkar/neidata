setwd("C:/Users/skhanvilkar/Documents/neidata/")
getwd()
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataset_url, "neidata.zip")
unzip("neidata.zip", exdir = "neidata")
NEI <- readRDS("C:/Users/skhanvilkar/Documents/neidata/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/skhanvilkar/Documents/neidata/Source_Classification_Code.rds")
emitdata <- with(NEI, aggregate(Emissions, by = list(year), sum))
library(ggplot2)
SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]
plot5 <- ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
dev.copy(png, file = "C:/Users/skhanvilkar/Documents/neidata/plot4.png") 
dev.off()


