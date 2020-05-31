library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")

##subset the data from motor vehicle sources
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
selectedSCC2 <- SCC[vehicle,]$SCC
vehicleBaltimore <- Baltimore[Baltimore$SCC %in% selectedSCC2,]

## turn the column year into factor
vehicleBaltimore$year <- factor(vehicleBaltimore$year)


png("plot5.png")
ggplot(vehicleBaltimore,aes(year,Emissions)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+ 
        labs(x="Year", y="Total PM Emission (tons)")+
        labs(title="PM2.5 Emissions from Motor Vehicle Sources in Baltimore",
             col = "grey")
dev.off()
