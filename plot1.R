## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## turn the column year into factor
NEI$year <- factor(NEI$year)
sumemission <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png")
barplot(sumemission, xlab = "Year", ylab = "Total PM2.5 emission (tons)",
        main = "Total PM2.5 Emission in United States", col = "wheat", 
        axis.lty = 1)
dev.off()
