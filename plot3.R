library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- NEI[NEI$fips == 24510, ]

yearly_type_totals <- aggregate(Emissions ~ year + type, subsetNEI, sum)



png(filename='plot3.png', width = 503, height = 503, bg = 'white')

plot <- ggplot(data = yearly_type_totals
                ,mapping = aes(year, Emissions, color = type))

plot <- plot + geom_point() + geom_smooth()

plot

dev.off()