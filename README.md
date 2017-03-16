# Simple Stats API Service

## Overview

The Simple Stats API service is a RESTful service that will provide information
about the system it is running on, namely: cpuinfo, meminfo and uptime.  It
is implemented as a collection of REST endpoints that use JSON messages as
their data format for both requests and responses.  Its implementation will
emphasize simplicity and straightforwardness.


## Simple Stats API Specification

### Version
1.0

### Endpoints

#### `/ping`
##### Summary
Test if the service is reachable
##### Method
`GET`
##### Parameters
None
##### Responses
Code | Response
-----|---------
`200` | `PONG`

#### `/version`
##### Summary
Get the version of the API that we're talking
##### Method
`GET`
##### Parameters
None
##### Responses
Code | Response
-----|---------
`200` | `1`

#### `/cpuinfo`
##### Summary
Display information about the CPU on the system
##### Method
`GET`
##### Parameters
None
##### Responses
Code | Description | Schema
-----|-------------|-------
`200` | A summary of the /proc/cpuinfo entry | 
`500` | Unexpected Error | 

#### `/meminfo`
##### Summary
Display information about the memory on the system
##### Method
`GET`
##### Parameters
None
##### Responses
Code | Description | Schema
-----|-------------|-------
`200` | A summary of the /proc/meminfo entry | 
`500` | Unexpected Error |

#### `/uptime`
##### Summary
Display information about the uptime of the system
##### Method
`GET`
##### Parameters
None
##### Responses
Code | Description | Schema
-----|-------------|-------
`200` | A summary of the /proc/uptime entry | 
`500` | Unexpected Error |

## Design and Implementation

* All data exchanged with the API will be in JSON form
* The API will be implemented in Ruby
	- We will use Sinatra to handle request routing
	- We will use RSpec to write some tests
