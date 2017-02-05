#### Q2: Have total emission PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008?

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Subset and aggregate data
NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_year <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

## Generate the graph
barplot(height = NEI_Baltimore_year$Emissions/10^3, names.arg = NEI_Baltimore_year$year, ylim = c(0, 4),
        xlab = "Year", ylab = "PM2.5 emission (10^3 Tons)", main = "Total PM2.5 Emission in Baltimore")

dev.copy(png, file = "plot2.png")
dev.off()