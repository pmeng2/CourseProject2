library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore
Baltimore <- subset(NEI, fips == "24510")
LA <- subset(NEI, fips == "06037")

##subset the data from motor vehicle sources
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
selectedSCC2 <- SCC[vehicle,]$SCC
vehicleBaltimore <- Baltimore[Baltimore$SCC %in% selectedSCC2,]
vehicleBaltimore$city <- "Baltimore City"
vehicleLA <- LA[LA$SCC %in% selectedSCC2, ]
vehicleLA$city <- "Los Angeles County"

## turn the column year into factor
both <- rbind(vehicleBaltimore, vehicleLA)


png("plot6.png")

ggplot(both, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill = year), stat = "identity") + facet_grid(.~city)+
        guides(fill = F)+
        theme_bw() +  labs(x="County", 
                           y="Total PM Emission from Motor Vehicles Emissions (tons)")+
        labs(title="Comparison between Baltimore City and Los Angeles")
dev.off()
