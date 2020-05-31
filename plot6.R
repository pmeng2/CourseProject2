library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset the data of Baltimore and LA
Baltimore <- subset(NEI, fips == "24510")
LA <- subset(NEI, fips == "06037")
##subset the data from motor vehicle sources
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
selectedSCC2 <- SCC[vehicle,]$SCC
vehicleBaltimore <- Baltimore[Baltimore$SCC %in% selectedSCC2,]
vehicleLA <- LA[LA$SCC %in% selectedSCC2, ]
##add one more column, city
vehicleBaltimore$city <- "Baltimore City"
vehicleLA$city <- "Los Angeles County"

## row bind the Baltimore city and LA data frame
both <- rbind(vehicleBaltimore, vehicleLA)
##create the file
png("plot6.png")
##making the plots
ggplot(both, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill = year), stat = "identity") + facet_grid(.~city)+
        guides(fill = F)+ theme_bw() +
        labs(x="County",y="Total PM Emission from Motor Vehicles Emissions (tons)")+
        labs(title="PM2.5 Emissions from Motor Vehicles Sources in Baltimore City and LA")
dev.off()
