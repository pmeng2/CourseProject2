library(ggplot2)
## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subset the data from coal combustion-related sources
combustion <- grepl("combustion", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustion & coal)
selectedSCC <- SCC[coalCombustion,]$SCC
coalcombNEI <- NEI[NEI$SCC %in% selectedSCC,]

## convert the column year into factor
coalcombNEI$year <- factor(coalcombNEI$year)

##create the file
png("plot4.png")
##making the plots
ggplot(coalcombNEI,aes(year,Emissions)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE) + 
        labs(x="Year", y="Total PM2.5 Emissions (tons)")+
        labs(title="PM2.5 Emissions from Coal Combustion-related Source across US")
dev.off()
