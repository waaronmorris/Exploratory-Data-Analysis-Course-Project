## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearly_totals <- aggregate(NEI$Emissions/1000 ~ NEI$year, NEI, sum)

png(filename='plot1.png', width = 503, height = 503, bg = 'white')

plot(x = yearly_totals$`NEI$year`, y = yearly_totals$`NEI$Emissions`, xlab = "Year", ylab = "PM2.5 in Kilotons", type = "l")

dev.off()
