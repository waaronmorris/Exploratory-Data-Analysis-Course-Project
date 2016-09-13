library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- NEI[NEI$fips == 24510, ]

SCC <- SCC$SCC[unique(c(grep("vehicle", SCC$Short.Name, ignore.case=TRUE)
                        , grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)
                        , grep("vehicle",SCC$SCC.Level.Two, ignore.case=TRUE)
                        , grep("vehicle",SCC$SCC.Level.Three, ignore.case=TRUE)
                        , grep("vehicle", SCC$SCC.Level.Four, ignore.case=TRUE)))]

vehicleData <- subsetNEI[subsetNEI$SCC %in% SCC, ]

yearly_totals <- aggregate(vehicleData$Emissions ~ vehicleData$year, vehicleData, sum)



png(filename='plot5.png', width = 503, height = 503, bg = 'white')

plot(x = yearly_totals$`vehicleData$year`, y = log10(yearly_totals$`vehicleData$Emissions`), xlab = "Year", ylab = "PM2.5", type = "l")

dev.off()