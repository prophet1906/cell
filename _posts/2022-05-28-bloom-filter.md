---
layout: post
title:  "Bloom Filter"
tags: data-structure
usemathjax: true
---

You heard about some cool website from your friends. You visit the website and try creating new account, but get a message, `Username is already taken`. You add some random numbers at end, but you still get same error message. This process is frustating, until you find a username that works.

Ever wondered, how they check availability of usernames so fast? when they have millions of registered users.

There are multiple ways to solve this problem -
1. **Linear search** - go through database and compare every username with the username you entered to find if it exists. This will probably take years before you can create a new account.

![Waiting]({{ site.baseurl }}/assets/images/bloom_filter/waiting.jpg)

2. **Binary Search** - store usernames alphabetically and try finding the entered username using binary search. This is better than previous approach, but still requires many steps when you have millions of users.

![Binary Search]({{ site.baseurl }}/assets/images/bloom_filter/binary_search.png)

3. **Trie** - store usernames in a trie and try finding the entered username. This have way better performance than previous 2 approaches, but it requires more memory to store millions of users. Also the overhead of maintaining trie is huge for so many users.

![Trie]({{ site.baseurl }}/assets/images/bloom_filter/trie.png)

**Bloom filter** can solve this problem. You need to understand hashing to learn how bloom filter works. A hash function maps some input to a fixed length unique identifier output, this output can be used for identifying input.

## What is it?
A Bloom filter is a space-efficient probabilistic data structure that is used to test if an element is a member of a set. The tradeoff for efficiency is the probabilistic nature of bloom filter, which means there might be some false positives. False positive means, bloom filter may say that a username is already used, even when it's not.

## Properties
- Bloom filter with fixed size can represent a set with very large number of elements
- Adding element never fails, but false positives increase as more elements are added
- Never generates false negatives
- Deleting elements from filter isn't possible

## How it works?
An empty bloom filter is a **bit array** of **n**  bits, all set to zero. We also need **k** hash functions to calculate hash function for a given input. For adding an element to bloom filter we set **k** indices calculated using hash function h<sub>1</sub>(x), h<sub>2</sub>(x), ..., h<sub>k</sub>(x) to 1.

Example - If we have a bloom filter with 10 bits and 3 hash functions h<sub>1</sub>, h<sub>2</sub>, h<sub>3</sub>. Initial value for all bits in bloom filter will be 0. 

![Empty Bloom Filter]({{ site.baseurl }}/assets/images/bloom_filter/empty_bloom_filter.excalidraw.png)

We then calculate hash for the word to be added and set the indices returned by hash function to 1.
```java
// word to be added - shubham
h1("shubham") % 10 = 2
h2("shubham") % 10 = 6
h3("shubham") % 10 = 9
```

![Bloom Filter 1]({{ site.baseurl }}/assets/images/bloom_filter/bf1.excalidraw.png)

```java
// word to be added - alex
h1("alex") % 10 = 1
h2("alex") % 10 = 6
h3("alex") % 10 = 10
```

![Bloom Filter 2]({{ site.baseurl }}/assets/images/bloom_filter/bf2.excalidraw.png)

To check if a element is present in bloom filter, we do the same process in reverse. You get back indexes using hash functions & check indexes. If all indexes are set to 1 the word is **probably present**, but if any of these indexes is 0, the word is **definitely not present**.

## False Positives

There is a possiblity of 2 words returning same values from hash function. This means we can get false positives where a word wasn't added to bloom filter.

Assume a word that was not added to bloom filter, but returns hash values which are already set.

```java
// word to be checked - bob
h1("bob") % 10 = 2
h2("bob") % 10 = 6
h3("bob") % 10 = 9
```

![Bloom Filter 3]({{ site.baseurl }}/assets/images/bloom_filter/bf3.excalidraw.png)

Here we never added **bob** to the bloom filter, but it is still present in filter. This means we can be **100%** sure if something isn't available in filter, but not the other way around.

We can control the probability of getting false positives by controlling the size of bloom filter. More bits means fewer false positives. We can also increase the number of hash functions to check more bits and reduce false positives. This also increases latency to add and check elements in bloom filter.

Let **n** be the size of bit array, **k** be the number of hash functions and **n** be the number of elements to be inserted in the filter, then probability of false positives **p** can be calculated as follows:

$$\mathrm{P} = \left( 1-\left[ 1-\frac{1}{n} \right]^{km} \right)^{k}$$

If **m** is max number elements expected to be handled by bloom filter and desired false positive probability is **p**, the the size of bit array **n** can be calcuated as follows:

$$\mathrm{n} = -\frac{mln{P}}{(ln{2})^{2}}$$

If **n** is size of bit array and **m** is number of elements to be inserted then optimum number if hash functions **k** can be calculated as follows:

$$\mathrm{k} = \frac{n}{m}ln{2}$$

Bloom filter are very space efficient, as data items are not stored. Using bit array allows hash collision, without hash collision, it would not be compact.

## Supported Operations
- **insert(x)** - insert an element to bloom filter
- **lookup(x)** - check whether an element is already present in bloom filter with a probability of false positive

<span style="color: red;">
Note: Elements cannot be deleted from bloom filter.
</span>

## Choosing Hash Function
All hash functions used in bloom filter should be independent from each other and uniformly distributed. These hash functions should be fast. Getting hash is most frequently used operation in bloom filters. Cryptographic hash functions provide stability but are expensive to calculate. Increasing hash functions slows bloom filter. Non-cryptographic hash functions do not provide guarantee but do provide major performance improvements.

Fast simple non cryptographic hashes which are independent of each other include [MurmurHash](https://en.wikipedia.org/wiki/MurmurHash), [Fowler–Noll–Vo hash function](https://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function), [Jenkins hash function](https://en.wikipedia.org/wiki/Jenkins_hash_function).

## Applications
Bloom filters should be used when:
- Data to be searched is large
- Memory available on the system is limited/low

Some real world usage:
- Detect weak passwords
- Google Chrome Safe Browsing(URL bloom filter)
- Antivirus(Content bloom filter)

## Conclusion
This note covers basics of bloom filter and when to use them. I recommend reading more about non-cryptographic hash functions and how to use them.