# データの読み込みと前処理
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")

# プロット4の作成
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# 左上のプロット
plot(datetime, subset_data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

# 右上のプロット
plot(datetime, subset_data$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

# 左下のプロット
plot(datetime, subset_data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# 右下のプロット
plot(datetime, subset_data$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.off()