# Feb-04-15: PLOT 1: Making first plot for Assignment 1 of "Exploratory Data Analysis" Course.
#                    Histogram.
########################################################################

png(file = "plot1.png", width=480, height=480)

data <- read.csv(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")


# Transforming date and time to Date/Time variables
date <- as.Date(data$Date, "%d/%m/%Y")


##Selecting dates between 2007/02/01 and 2007/02/02
flgOK <- date == "2007-02-01" | date == "2007-02-02"
power <- data$Global_active_power
powerOK <- power[flgOK]

#Plotting
hist(powerOK, xlab ="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")


dev.off()

