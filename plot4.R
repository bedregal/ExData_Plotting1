#Feb-07-15: PLOT 4: Making fourth plot for Assignment 1 of "Exploratory Data Analysis" Course.
#                    $ panels.
########################################################################

png(file = "plot4.png", width=480, height=480)

data <- read.csv(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")


# Transforming date and time to Date/Time variables
date <- as.Date(data$Date, "%d/%m/%Y")
time <- strptime(data$Time, "%H:%M:%S")

##Selecting dates between 2007/02/01 and 2007/02/02
##... and the data we need
flgOK <- date == "2007-02-01" | date == "2007-02-02"
timeOK <- time[flgOK]
powerOK <- data$Global_active_power[flgOK]
sub1 <- data$Sub_metering_1[flgOK]
sub2 <- data$Sub_metering_2[flgOK]
sub3 <- data$Sub_metering_3[flgOK]
volOK <- data$Voltage[flgOK]
powReactOK <- data$Global_reactive_power[flgOK]


### Plotting
step <- 1:length(timeOK)
par(mfcol=c(2,2))

#Panel 1
plot(step, powerOK, xaxt="n", xlab="", ylab ="Global Active Power", type="l")
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))

#Panel 2
plot(step, sub1, xaxt="n", xlab="", ylab ="Energy sub metering", type="l")
points(step, sub2, type="l", col="red")
points(step, sub3, type="l", col="blue")
legend("topright", bty="n", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))

#Panel 3
plot(step, volOK, xaxt="n", xlab="datetime", ylab ="Voltage", type="l")
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))

#Panel 4
plot(step, powReactOK, xaxt="n", xlab="datetime", ylab ="Global_reactive_power", type="l")
axis(1, at=c(1, 0.5*(length(step)), length(step)), labels=c("Thu", "Fri", "Sat"))


dev.off()

