#### Q3: Which of the four soureces have seen decreases or increases in emssions from 1999-2008 for Baltimore City?

## Load ggplot2 library
library(ggplot2)

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Subset, transform, aggregate data
NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_yeartype <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)

## Generate the graph
ggplot(NEI_Baltimore_yeartype, aes(x = factor(year), y = Emissions, fill = type)) + 
  geom_col() + facet_grid(~ type, scales = "free", space = "free") + 
  xlab("Year") + ylab("PM2.5 emission (Tons)") +
  ggtitle("Total PM2.5 Emissions in Baltimore by Source Type") +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

dev.copy(png, file = "plot3.png")
dev.off()