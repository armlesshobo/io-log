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
        return nil
    )

    trace := method(msg, (level != LogLevel off)   ifTrue(log("[TRACE]", msg)); return nil)
    debug := method(msg, (level <= LogLevel debug) ifTrue(log("[DEBUG]", msg)); return nil)
    info  := method(msg, (level <= LogLevel info)  ifTrue(log("[INFO]",  msg)); return nil)
    warn  := method(msg, (level <= LogLevel warn)  ifTrue(log("[WARN]",  msg)); return nil)
    error := method(msg, (level <= LogLevel error) ifTrue(log("[ERROR]", msg)); return nil)
    fatal := method(msg, (level <= LogLevel fatal) ifTrue(log("[FATAL]", msg)); return nil)
)

