'use strict'

###

/source/configuration/logger
Logger module!

Wrapper of the "koa-logger" module.
Creates `run` function that executes server and log on the server creation.
Uses "koa-logger" to log the requests and the resposes.
Exports the function that updates the application logging.
 
###

logger = require 'koa-logger'
chalk = require 'chalk'

# Function that gets the app and defines the logger.
set = (app) ->
        
    # Uses the "koa-logger".
    app.use logger()
    
    # Logs on the error.
    app.on 'error', (err) ->
        msg = chalk.red 'ERROR'
        console.log msg + err
        
start = (ip, port) ->
    msg =
        "Working @ #{
            chalk.green.underline(ip)
        }:#{
            chalk.green.underline(port)
        }!\n"
    console.log chalk.green msg

module.exports =
    set: set
    start: start