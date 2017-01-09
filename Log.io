LogLevel

Log := Object clone
Log withFile := method(file,
	logger := Log clone
	logger logfile := file
	logger logfile openForUpdating
	logger close := method(self logfile close)
	logger flush := method(self logfile flush)
	return logger
)

// Log levels:  ALL < DEBUG < INFO < WARN < ERROR < FATAL < OFF
// default to ALL
Log level := LogLevel ALL

Log log := method(prefix, msg,
	if (self ?logfile, self logfile, File standardOutput) write("#{Date now} #{prefix} #{msg}" interpolate, "\n") flush
)

Log trace := method(msg, log("[TRACE]", msg); true)
Log debug := method(msg, (level <= LogLevel DEBUG) ifTrue(log("[DEBUG]", msg)))
Log info  := method(msg, (level <= LogLevel INFO)  ifTrue(log("[INFO]",  msg)))
Log warn  := method(msg, (level <= LogLevel WARN)  ifTrue(log("[WARN]",  msg)))
Log error := method(msg, (level <= LogLevel ERROR) ifTrue(log("[ERROR]", msg)))
Log fatal := method(msg, (level <= LogLevel FATAL) ifTrue(log("[FATAL]", msg)))

