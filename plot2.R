## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")
## turn the column year into factor
Baltimore$year <- factor(Baltimore$year)
sum_baltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)
png("plot2.png")
barplot(sum_baltimore, xlab = "Year", ylab = "Total PM2.5 emission (tons)",
        main = "Total PM2.5 Emission in Baltimore", col = "green", axis.lty = 1)
dev.off()
