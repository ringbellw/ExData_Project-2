#### Q5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Subset and aggregate the data
NEI_Baltimore_onroad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
NEI_Baltimore_onroad_year <- aggregate(Emissions ~ year, NEI_Baltimore_onroad, sum)

## Generate the graph
barplot(height = NEI_Baltimore_onroad_year$Emissions, names.arg = NEI_Baltimore_onroad_year$year, ylim = c(0, 350),
        xlab = "Year", ylab = "PM2.5 emission (Tons)", main = "Motor Vehicle-related PM2.5 Emissions in Baltimore")

dev.copy(png, file = "plot5.png")
dev.off()