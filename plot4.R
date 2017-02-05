#### Q4: Accross the United States, how have emissons from coal combustion-related
## sources changed form 1999-2008?

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Coal combustion-related sources
iscoal_idex <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coal_SCC <- SCC[iscoal_idex, ]

## Subset and aggregate data
coal_NEI <- subset(NEI, NEI$SCC %in% coal_SCC$SCC)
coal_NEI_year <- aggregate(Emissions ~ year, coal_NEI, sum)

## Generate the graph
barplot(height = coal_NEI_year$Emissions/10^5, names.arg = coal_NEI_year$year, ylim = c(0, 7),
        xlab = "Year", ylab = "PM2.5 emission (10^5 Tons)", main = "Coal Combustion-related PM2.5 Emissions in US")

dev.copy(png, file = "plot4.png")
dev.off()