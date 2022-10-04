---
layout: post
title:  "Concurrency vs Parallelism"
tags: concurrency parallelism
---

## Serial Execution
When programs are serially executed, they are scheduled one at a time on the CPU. Once a task gets completed, the next one gets a chance to run.

## Concurrency
A concurrent program is one that can be decomposed into constituent parts and each part can be executed out of order or in partial order without affecting the final outcome.

A system capable of running several distinct programs or more than one independent unit of the same program in overlapping time intervals is called a concurrent system.

A concurrent system can have 2 programs in progress at the same time where progress doesn't imply execution. One program can be suspended while the other executes. Both programs are able to make progress as their execution is interleaved.

In concurrent systems, the goal is to maximize throughput and minimize latency.

## Parallelism
A parallel system is one which necessarily has the ability to execute multiple programs at the same time. Usually, this capability is aided by hardware in the form of multicore processors on individual machines or as computing clusters where several machines are hooked up to solve independent pieces of a problem simultaneously.

An individual program has to be concurrent in nature, that is portions of it can be worked on independently without affecting the final outcome before it can be executed in parallel.

In parallel systems the emphasis is on increasing throughput and optimizing usage of hardware resources. The goal is to extract out as much computation speedup as possible.

## Concurrency vs Parallelism
A concurrent system need not be parallel, whereas a parallel system is indeed concurrent.
A system can be both concurrent and parallel e.g. a multitasking operating system running on a multicore machine.

Concurrency is about dealing with lots of things at once.
Parallelism is about doing lots of things at once.

Concurrency is a property of a program or a system.
Parallelism is a runtime behaviour of executing multiple tasks.

![Concurrency vs Parallelism]({{ site.baseurl }}/assets/images/concurrency%20vs%20parallelism.png)