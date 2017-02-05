#### Q1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Aggregate
emission_year <- aggregate(Emissions ~ year, NEI, sum)

## Generate the graph
barplot(height = emission_year$Emissions/10^6, names.arg = emission_year$year, ylim = c(0, 8),
        xlab = "Year", ylab = "PM2.5 emission (10^6 Tons)", main = "Total PM2.5 Emissions in US")

dev.copy(png, file = "plot1.png")
dev.off()