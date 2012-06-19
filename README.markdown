WARNING: Project is DISCONTINUED. As is simple_metrics server. There are other which serve a similar purpose as for example graphite, statsd, batsd, etc.

SimpleMetrics Ruby Client
=========================

SimpleMetrics makes it easy to collect and aggregate data (specifically counters, timers and events).

This is the Ruby client library gem.

Usage
======

Initialize client:

    client = SimpleMetrics::Client.new("localhost")

sends "com.example.test1:1|c" via UDP:

    client.increment("com.example.test1")

sends "com.example.test1:5|c" (a counter with a relative value of 5):

    client.count("com.example.test1", 5)

sends "com.example.test1:5|c|@0.1" with a sample rate of 10%:

    client.count("com.example.test1", 5, 0.1)

sends "com.example.test1:5|g" (meaning gauge, an absolute value of 5):

    client.gauge("com.example.test1", 5)