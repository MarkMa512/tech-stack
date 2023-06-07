# Python Logging 

## [Python Logging Tutorial](https://www.youtube.com/watch?v=urrfJgHwIJA) 

### Logging Levels 

- DEBUG: Detailed information, typically of interest only when diagnosing problems.
- INFO: Confirmation that things are working as expected.
- WARNING: An indication that something unexpected happened, or indicative of some problem in the near future (e.g. ‘disk space low’). The software is still working as expected.
- ERROR: Due to a more serious problem, the software has not been able to perform some function.
- CRITICAL: A serious error, indicating that the program itself may be unable to continue running.

**By default**, the logging module logs the messages with a severity level of *WARNING or above*. 

```python

import logging # import the logging module 

logging.debug('This is a debug message') # debug message
logging.info('This is an info message') # info message
logging.warning('This is a warning message') # warning message
logging.error('This is an error message') # error message
logging.critical('This is a critical message') # critical message
```

Output: 
> WARNING:root:This is a warning message  
> ERROR:root:This is an error message  
> CRITICAL:root:This is a critical message  

The `root` indicates that the message came from the root logger. Root logger is the parent logger of all the loggers. 

### Logging to a File

```python
import logging 

"""
Config once only at the beginning of the program 
"""

logging.basicConfig(level=logging.DEBUG, filename='test.log', filemode = 'w') 
# basicConfig() function to set the configuration of the logger
# filename: name of the file to which the logs are written 
# level: level of the logs, level=logging.DEBUG means all the logs will be written to the file
# filemode: mode in which the file is opened, 'w' means write mode, it will overwrite the file if it already exists 
```

### Formatting the Output

```python
import logging 

logging.basicConfig(level=logging.DEBUG, filename='test.log', filemode = 'w', format='%(asctime)s - %(levelname)s - %(message)s')
# format: format of the log message 
# %(asctime)s: time at which the message is logged
# %(levelname)s: level of the message
# %(message)s: the message that is logged 
```

### Logging Variables

```python
import logging

name = 'John'

logging.error('%s raised an error', name) # John raised an error 
logging.error(f'{name} raised an error') # John raised an error 
``` 

### Logging Exceptions and Stack Traces 

```python
import logging

a = 5

try:
    b = a / 0
except Exception as e:
    logging.error("Exception occurred", exc_info=True) # exc_info=True logs the traceback of the exception 
```

### Custom Loggers 

```python
import logging

logging.basicConfig(level=logging.DEBUG, filename='test.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s') 
# This line will configure the root logger, and all the loggers will inherit the configuration from the root logger 
# ie. all the loggers will log the messages with a severity level of WARNING or above 

logger = logging.getLogger(__name__) # create a custom logger, __name__ is the name of the current module 

logger.info('Hello from logger') # Hello from logger 

handler = logging.FileHandler('logger.log') # create a handler object, this will write the logs to the file logger.log for this logger 

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s') # create a formatter object 
handler.setFormatter(formatter) # set the formatter for the handler 

logger.addHandler(handler) # add the handler to the logger 
```


