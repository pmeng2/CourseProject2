## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")
## convert the column year into factor
Baltimore$year <- factor(Baltimore$year)
##use tapplu function to get yearly pm2.5 emission in Baltimore city
sum_baltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)
##create the file
png("plot2.png")
##making the plots
barplot(sum_baltimore, xlab = "Year", ylab = "Yearly PM2.5 emission (tons)",
        main = "Yearly PM2.5 Emissions in Baltimore City", col = "wheat", 
        axis.lty = 1)
dev.off()
