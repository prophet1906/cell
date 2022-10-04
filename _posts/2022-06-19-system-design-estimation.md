---
layout: post
title:  "Back of the Envelope Estimation"
tags: system-design
usemathjax: true
---

Creating design for a system isn't helpful unless you can justify why your design is better than others. After creating a design, there will be questions on weather the design fulfills the specified requirements. 

According to **Jeff Dean**, Google Senior Fellow, **"back-of-the-envelope calculations are estimates you create using a combination of thought experiments and common performance numbers to get a good feel for which design will meet your requirements."**

A good sense of scalability basics are required to do back-of-the-envelope estimation.

## Power of two
An **ASCII** character uses one byte of memory (8 bits). Given below is data volume unit using power of 2.

| Power | Approximate Value | Full name  | Short name |
|:-----:|:-----------------:|:----------:|:----------:|
|  10   |    1 Thousand     | 1 Kilobyte |    1 KB    |
|  20   |     1 Million     | 1 Megabyte |    1 MB    |
|  30   |     1 Billion     | 1 Gigabyte |    1 GB    |
|  40   |    1 Trillion     | 1 Terabyte |    1 TB    |
|  50   |   1 Quadrillion   | 1 Petabyte |    1 PB    |

## Latency numbers
Latency numbers as revealed by **Dr. Dean** from Google in 2010 may be outdated because of faster and more powerful computers. But, these numbers should still help you to get general idea of fastness and slowness of different computer operations.

|               Operation name                |          Time           |
|:-------------------------------------------:|:-----------------------:|
|             L1 cache reference              |         0.5 ns          |
|              Branch mispredict              |          5 ns           |
|             L2 cache reference              |          7 ns           |
|              Mutex lock/unlock              |         100 ns          |
|            Main memory reference            |         100 ns          |
|        Compress 1K bytes with Zippy         |    10,000 ns = 10 μs    | 
|      Send 2K bytes over 1 Gbps network      |    20,000 ns = 20 μs    |
|     Read 1 MB sequentially from memory      |   250,000 ns = 250 μs   |
|    Round trip within the same datacenter    |   500,000 ns = 500 μs   |
|                  Disk seek                  |  10,000,000 ns = 10 ms  |
|   Read 1 MB sequentially from the network   |  10,000,000 ns = 10 ms  |
|      Read 1 MB sequentially from disk       |  30,000,000 ns = 30 ms  |
| Send packet CA(California)->Netherlands->CA | 150,000,000 ns = 150 ms |

**ns = nanosecond**

**μs = microsecond**

**ms = millisecond**

**1 ns =** $$10^{-9}$$ **seconds**

**1 μs =** $$10^{-6}$$ **seconds = 1,000 ns**

**1 ms =** $$10^{-3}$$ **seconds = 1,000 μs = 1,000,000 ns**

Some conclusions from above numbers-
- Memory is fast but disk is slow
- Avoid disk seeks if possible
- Simple compression algorithms are fast
- Compress data before sending it over the internet if possible
- Data centers are usually in different regions, and it takes time to send data between them

## Availability numbers
A **service level agreement(SLA)** is commonly used as an agreement between the service provider and their customer. This agreement formally defines the level of uptime your service will deliver. The uptime is measured as percentage and it falls between **99%** and **100%** for most services. Uptime is typically measured in nines, more nines is better. Number of nines correlate to the expected system downtime.

| Availability % |  Downtime per day   | Downtime per year |
|:--------------:|:-------------------:|:-----------------:|
|      99%       |    14.40 minutes    |     3.65 days     |
|     99.9%      |    1.44 minutes     |    8.77 hours     |
|     99.99%     |    8.64 seconds     |   52.60 minutes   |
|    99.999%     | 864.00 milliseconds |   5.26 minutes    |
|    99.9999%    | 86.40 milliseconds  |   31.56 seconds   |

Anything above 5 nines is considered highly available.

## Example: Estimate Twitter QPS and storage requirements
Following numbers are just to showcase how back-of-the-envelope-estimation works, these are not real numbers from twitter.

### Assumptions
- 300 million monthly active users
- 50% of users use twitter daily
- Users post 2 tweets per day on average
- 10% of tweets contain media
- Data is stored for 5 years

### Estimations
**Query per second(QPS)** estimate:
- Daily active users(DAU) = 300 million \* 50% = 150 million
- Tweets QPS = 150 million \* 2 tweets / 24 hour / 3600 seconds = ~3500
- Peek QPS = 2 \* QPS = ~7000

We will only estimate media storage here.
- Average tweet size:
	- tweet_id $$\to$$ 64 bytes
	- text $$\to$$ 140 bytes
	- media $$\to$$ 1 MB
- Media storage: 150 million \* 2 \* 10% \* 1 MB = 30 TB per day
- 5-year media storage: 3 TB \* 365 \* 5 = ~55 PB


## Tips
Back-of-the-envelope estiimations don't need to be extremely accurate, they are just meant to give approximate idea of scale. Few tips are as follows-
- Rounding and Approximation wherever necessary for speed calculation, precision isn't expected at design stage
- Write down assumptions to be referenced later
- Label units to remove ambiguity from numbers and not confuse yourself

## Conclusion
This note gives basic idea of how back-of-the-envelope calculations work. You should practice these calculations on all designs you visit. More practice will help you get rough numbers in mind and select or discard ideas when brainstorming new system design.