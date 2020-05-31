## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## convert the column year into factor
NEI$year <- factor(NEI$year)
##use tapply function to get the yearly PM2.5 emission
sumemission <- tapply(NEI$Emissions, NEI$year, sum)
##create the file
png("plot1.png")
##making the plot
barplot(sumemission, xlab = "Year", ylab = "Total PM2.5 Emission (tons)",
        main = "Yearly PM2.5 Emissions in United States", col = "wheat", 
        axis.lty = 1)
dev.off()
