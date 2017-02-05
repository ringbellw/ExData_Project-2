#### Q6: Which city has seen greater changes over time in motor vehicle emissions?

## Load ggplot2 library
library(ggplot2)

## Load provided datasets from working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## Subset and aggregate the data
NEI_Bal.LG_onroad <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
df1 <- aggregate(Emissions ~ year + fips, NEI_Bal.LG_onroad, sum)
df1$county <- ifelse(df1$fips == "06037", "Los Angeles", "Baltimore")

## Generate the graph
ggplot(df1, aes(x = factor(year), y = Emissions)) + geom_col(aes(fill = year)) + facet_wrap(~ county) +
  xlab("Year") + ylab("PM2.5 emission (Tons)") + 
  ggtitle("Motor Vehicle-related PM2.5 Emissions in Baltimore vs. Los Angeles") + 
  geom_text(aes(label = round(Emissions, 0), size = 0.5, hjust = 0.5, vjust = -0.4)) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none") 

dev.copy(png, file = "plot6.png")
dev.off()