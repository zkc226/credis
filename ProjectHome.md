**Credis is a client library in plain C** for communicating with Redis servers. Redis is a high performance key-value database, refer to [Redis project page](http://redis.io) for more information.

Credis aims to be fast and minimalistic with respect to memory usage. It supports connections to multiple Redis servers. It runs on Linux, OS X, Windows, FreeBSD and should run on most POSIX like systems. It is released under the New BSD License.

# Why #
Redis seemed like what I was looking for in a social web project with high demands on scalability. Unfortunately a plain C client library was not available - until now.

# Status #
**Current status is "almost complete".** Credis implements all commands supported by Redis 1.02, almost all of 1.2.6 and most of 2.0.2. Credis is work in progress but still quite mature. The long-term commitment is to provide full support for all Redis commands. A simple credis test client is available as example and for test. Refer to credis.h for a complete list of supported commands.

For source code examples and more information see [credis project wiki](http://code.google.com/p/credis/w/list).

Feedback is highly appreciated. If a command is missing just drop me an e-mail or a patch. If you're using Credis it would be great to hear about.

# Credits #
Credis is written and maintained by [Jonas Romfelt](http://romfelt.se/jonas).

List, in no particular order, of people who has contributed to Credis:
  * [Florian octo Forster](http://verplant.org) format warnings and a new build system waiting to be merged to trunk
  * [Louis-Philippe Perron](http://www.untilnil.com) for help with debugging
  * Dean Banks for pointing out and sending me a patch to remove non-reentrant calls in credis\_connect()
  * Dmitriy Lyfar for suggesting a patch for timed connect.
  * Jeff Buck for a credis\_info() patch.
  * Fernando Pardo for a WIN32 patch and help with pub/sub implementation.
  * [Jonathan Ragan-Kelley](http://people.csail.mit.edu/jrk/) for proposing simplifications to the initial API.
  * [akitada](http://code.google.com/u/akitada/) making Credis build under Mac OS X.
  * [Matthieu Tourne](http://code.google.com/u/matthieu.tourne/) for C/C++ source mixing.
  * Daniel Korger for help with bug reporting and testing fixes.