LogLevel

Log := Object clone do(
    with := method(file,
        logger := Log clone
        logger logfile := file
        logger logfile openForUpdating
        return logger
    )

    close := method(logfile close)
    flush := method(logfile flush)

    logfile := File standardOutput

    level := LogLevel all

    log := method(prefix, msg,
        logfile write("#{Date now} #{prefix} #{msg}" interpolate, "\n") 
    )

    trace := method(msg, (level != LogLevel off)   ifTrue(log("[TRACE]", msg); true))
    debug := method(msg, (level <= LogLevel debug) ifTrue(log("[DEBUG]", msg)))
    info  := method(msg, (level <= LogLevel info)  ifTrue(log("[INFO]",  msg)))
    warn  := method(msg, (level <= LogLevel warn)  ifTrue(log("[WARN]",  msg)))
    error := method(msg, (level <= LogLevel error) ifTrue(log("[ERROR]", msg)))
    fatal := method(msg, (level <= LogLevel fatal) ifTrue(log("[FATAL]", msg)))
)

