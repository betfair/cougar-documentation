---
---
What is Cougar?
===============

Cougar is an open source framework for implementing well defined service interfaces with true transport independence, freeing you up to write your core logic. Originally written by Betfair, and powering their core services, it is a high performance framework, easily supporting high concurrency requirements.

Oh, you wanted more detail than the front page? Well, in that case read on, after all, it's always a little more complex than that..

Core Cougar
===========

At it's core, Cougar provides an execution venue within which executables can be run. Executables are asynchronous in nature, proving results (be those responses or faults) via a callback mechanism. In it's simplist form, an execution venue consists of a queue of outstanding execution requests, and a pool of threads which pull work from that queue.

Executables are often simple wrapper classes which map to method calls on a service interface, which is generated from an interface definition, written in Cougar's very own IDL (it looks rather like Thrift but in XML), the implementation of which is written by you (or your developers if you have some at your beck and call).

Execution requests are accompanied by the arguments passed in and some contextual information about the call which provides access to (amongst other things):
* Caller identity
* Remote address(es) and geolocation

Cougar supports 3 core paradigms of interaction:
* RPC - your bog standard call an operation and get a response back.
* Events - emission/consumption of events (typically to a JMS system - although not restricted to such).
* Connected Objects - replicant objects that can be mutated on a server and the state of which will be replicated to one or more clients.

Transports
==========

Layered over the top of this core, Cougar provides a set of transports for interacting with the outside world. You can extend this set of transports with your own as required, and we expect to expand this set over time:
* HTTP transport - runs on an embedded Jetty server. Supports RPC in a number of styles:
** JSON-RPC
** XML/JSON over HTTP (affectionally called Rescript)
** SOAP (yes, we hate it too, but some people can't escape it)
* Socket transport - a custom binary transport which multiplexes requests over a TCP connection. This supports both RPC and connected objects.
* JMS transport - an abstract base transport for supporting JMS implementations. Supports events.
* ActiveMQ transport - a concrete event transport.

All these transports support varying security levels, all the way from none to 2-way SSL for non-repudiated client identification.

Cougar Client
=============

*TODO*

Extras
======

e.g. JMX console, codegen plugin
