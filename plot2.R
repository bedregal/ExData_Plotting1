# Feb-07-15: PLOT 2: Making second plot for Assignment 2 of "Exploratory Data Analysis" Course.
#                    Global Active Power vs Day of the week (time).
########################################################################

png(file = "plot2.png", width=480, height=480)

data <- read.csv(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")


# Transforming date and time to Date/Time variables
date <- as.Date(data$Date, "%d/%m/%Y")
time <- strptime(data$Time, "%H:%M:%S")

##Selecting dates between 2007/02/01 and 2007/02/02
flgOK <- date == "2007-02-01" | date == "2007-02-02"
power <- data$Global_active_power
powerOK <- power[flgOK]
timeOK <- time[flgOK]

#Plotting
step <- 1:length(timeOK)
plot(step, powerOK, xaxt="n", xlab="", ylab ="Global Active Power (kilowatts)", type="l")
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))

dev.off()

