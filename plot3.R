library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")
## convert the column year and type into factor
Baltimore$year <- factor(Baltimore$year)
Baltimore$type <- factor(Baltimore$type)
##create the file
png("plot3.png")
##making the plots
ggplot(Baltimore,aes(year,Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type) + 
        labs(x="Year", y="Yearly PM2.5 Emission (tons)")+
        labs(title="PM2.5 Emissions in Baltimore City by Source Type")
dev.off()
