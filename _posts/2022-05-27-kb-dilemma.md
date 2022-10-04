---
layout: post
title:  "Kb(1024) or Kb(1000) Dilemma"
tags: storage network units
usemathjax: true
---

Every engineer with computer science major stumbles on this question atleast once, weather to use **1000 bytes** or **1024 bytes** as **1 kilobyte** equivalent.

The value of **1 kilobyte** depends on the context as follows -
- **Disk Storage** always refers to base 2 numbers, where **k = 1024** or $$2^{10}$$.
- **Transmission Speeds** always refers to SI units or base 10 numbers, where **k = 1000** or $$10^{3}$$.

**Note: 1 byte = 8 bits**

## Capitalization
Capital letters have **nothing** to do with the definition. Kb, kB, kb or KB have same meaning, depending on context. There is no shortcut rule to reveal the meaning of kilo by capitalisation or not.

## File size, memory size, and hard disc size
A kilobyte file is 1024 bytes in size. It is not 1000 bytes in size.
A kilogram of apples is 1000 grams heavy. It is not 1024 grams heavy.
The meaning of prefix is clear from the context.

When we talk about disk storage, file size and memory size, kilobyte means 1024 bytes.

## Transmission Speeds
Transmission speeds are described in kilobits per second (kbps). Now, that is not disk storage, file size, or memory size.

When we talk about transmission speeds, kilobits means 1000 bits.

## Questions
**Q1:** Calculate how many bytes there are in three kilobytes of disc storage?

**Answer:** The question clearly defines the context as disc storage. Therefore, kilobyte should be considered 1024 bytes. Correct response should be 3 \* 1024.

**Q2:** Calculate how many bits are being transmitted per second for a network described as three Mbps.

**Answer:** The question clearly defines the context as network transmission. Therefore, meaning of 3 Mbps(megabits per second) should be clear. It is 1,000,000 bits per second. Correct response should be 3 \* 1,000,000.

**Q3:** How long would it take to transmit a 2 KB(kilobyte) file at 3 Mbps(megabits per second)?

**Answer:** The question would involve both of the values 1000 and 1024. Correct response is $$\frac{2 * 1024 * 8}{3 * 1000 * 1000}$$.
