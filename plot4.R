## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC <- SCC$SCC[unique(c(grep("Coal", SCC$Short.Name), grep("Coal", SCC$EI.Sector), 
                           grep("Coal",SCC$SCC.Level.Three),grep("Coal", SCC$SCC.Level.Four)))]

coalData <- NEI[NEI$SCC %in% SCC, ]

yearly_totals <- aggregate(coalData$Emissions ~ coalData$year, coalData, sum)

png(filename='plot4.png', width = 503, height = 503, bg = 'white')

plot(x = yearly_totals$`coalData$year`, y = yearly_totals$`coalData$Emissions`, xlab = "Year", ylab = "PM2.5", type = "l")

dev.off()
