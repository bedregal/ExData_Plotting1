#Feb-07-15: PLOT 3: Making third plot for Assignment 1 of "Exploratory Data Analysis" Course.
#                    Energy sub-metering vs Day of the week (time).
########################################################################

png(file = "plot3.png", width=480, height=480)

data <- read.csv(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")


# Transforming date and time to Date/Time variables
date <- as.Date(data$Date, "%d/%m/%Y")
time <- strptime(data$Time, "%H:%M:%S")

##Selecting dates between 2007/02/01 and 2007/02/02
flgOK <- date == "2007-02-01" | date == "2007-02-02"
sub1 <- data$Sub_metering_1[flgOK]
sub2 <- data$Sub_metering_2[flgOK]
sub3 <- data$Sub_metering_3[flgOK]
timeOK <- time[flgOK]

#Plotting
step <- 1:length(timeOK)
plot(step, sub1, xaxt="n", xlab="", ylab ="Energy sub metering", type="l")
points(step, sub2, type="l", col="red")
points(step, sub3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))

dev.off()

