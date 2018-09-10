
######### THIS FILE CONTAINS ALL THE R CODE FOR CREATING PLOT 4 ################################

# Set the working directory
setwd("C:/Users/ItsJustFitz/Desktop/ExplorDataAnalysis")

# unzip the UCI household power consumption dataset zip file
unzip ("household_power_consumption.zip", exdir = "C:/Users/ItsJustFitz/Desktop/ExplorDataAnalysis")

##### NOTE: Used Notepad++ to confirm the defaults for read.table (header = FALSE and sep = "") would NOT read files in correctly
###### NEED header = TRUE and sep = ";" also know "?" is missing value so set na.strings = "?" and want Date and Time as characters so stringsAsFactors = FALSE

# Read the text file in
power_cons <- read.table("C:/Users/ItsJustFitz/Desktop/ExplorDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

str(power_cons)
dim(power_cons)  # Get dimensions 2,075,259 x 9 as expected

# Subset dataset to extract only the two dataes for the assignment (Feb 1 and 2, 2007)
fin_dat <- power_cons[(power_cons$Date == "1/2/2007") | (power_cons$Date == "2/2/2007"), ]

str(fin_dat)
dim(fin_dat)  # Get dimensions 2880 x 9 which was confirmed on discussion threads

# Check summary info for NEW variables to be used for multi-plot
summary(fin_dat$Voltage)
summary(fin_dat$Global_reactive_power)


# Remove larger dataset to free up memory
rm(power_cons)

# Convert Date and Time variables to single date-time per instruction suggestion
datetimeComb <- strptime(paste(fin_dat$Date, fin_dat$Time), "%d/%m/%Y %H:%M:%S")


# Draw the plot to match the assignment example; Draw to screen to compare

par(mfrow = c( 2, 2))  ## Set up layout of 2 rows and 2 columns where rows fill first

# Regenerate plot 2
plot(datetimeComb, fin_dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Generate new plot Voltage by datetimeComb
plot(datetimeComb, fin_dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Regenerate plot 3
plot(datetimeComb, fin_dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetimeComb, fin_dat$Sub_metering_2, type = "l", col = "red")
points(datetimeComb, fin_dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Generate new plot Global_reactive_power by datetimeComb
plot(datetimeComb, fin_dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# Draw the plot to png file per instructions
png(filename = "Plot4.png")

par(mfrow = c( 2, 2))  ## Set up layout of 2 rows and 2 columns where rows fill first

# Regenerate plot 2
plot(datetimeComb, fin_dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Generate new plot Voltage by datetimeComb
plot(datetimeComb, fin_dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Regenerate plot 3
plot(datetimeComb, fin_dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetimeComb, fin_dat$Sub_metering_2, type = "l", col = "red")
points(datetimeComb, fin_dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Generate new plot Global_reactive_power by datetimeComb
plot(datetimeComb, fin_dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

