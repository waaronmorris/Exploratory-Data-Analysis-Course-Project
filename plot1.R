## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## head(NEI)
## head(SCC)

## names(NEI)
## names(SCC)

?tapply
?sapply

yearly_totals()

yearly_totals <- aggregate(NEI$Emissions ~ NEI$year, NEI, sum)

plot(x = yearly_totals$`NEI$year`, y = yearly_totals$`NEI$Emissions`, xlab = "Year", ylab = "PM2.5", type = "l")