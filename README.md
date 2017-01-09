# io-log
A simple logging library for Io.

Example usage:
==============

    log := Log withFile(File with("test.log"))
    log level = LogLevel ERROR
    
    log warn("I can't warn you enough")
    log fatal("I can't see this")
    
    log level = LogLevel FATAL
    log fatal("I can see this now")
