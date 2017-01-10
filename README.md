# io-log
A simple logging library for Io.

Example usage:
==============

If you want write to 'test.log'

    log := Log with(File with("test.log"))

or, if you want to log to stdout
    
    log := Log clone

Simple use as follows

    log level = LogLevel error
    
    log warn("I can't warn you enough")
    log fatal("I can't see this")
    
    log level = LogLevel fatal
    log fatal("I can see this now")
    
    log close

 


