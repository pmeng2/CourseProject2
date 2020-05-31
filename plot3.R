library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")
## turn the column year into factor
Baltimore$year <- factor(Baltimore$year)
Baltimore$type <- factor(Baltimore$type)

sum_baltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)
png("plot3.png")
ggplot(Baltimore,aes(year,Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type) + 
        labs(x="Year", y="Total PM Emission (tons)")+
        labs(title="PM2.5 Emissions in Baltimore City by Source Type")
dev.off()
