---
layout: post
title:  "Complexity Analysis"
tags: algorithm
usemathjax: true
---
It is very important to find complexity of algorithms used during software development. A well-written algorithm is not only time-efficient but also space-efficient.

The complexity of algorithms is measured using asymptotic notations. We can determine if an algorithm performs better than another using these notations.

A good software developer should have the ability to calculate the complexity of any algorithm.

## Introduction to Asymptotic Analysis and Big O
The time complexity of an algorithm can be expressed as a polynomial. We can compare 2 algorithms by comparing the respective polynomials.

## Asymptotic analysis
The asymptotic notation compares 2 functions say, _f(n)_ and _g(n)_ for very large values of _n_. This fits in nicely with our need for comparing algorithms for very large input sizes.

## Big O notation
One of the asymptotic notations is the Big O notation. A function $$f(n)$$ is considered $$O(g(n))$$ if there exists some positive real constant **_c_** and an integer $$n_0 \gt 0$$, such that the following inequality holds for all $$n \geq n_0$$:
$$f(n) \leq cg(n)$$

The following graph shows a plot of a function $$f(n)$$ and $$cg(n)$$ that demonstrates this inequality.

![Big O Graph]({{ site.baseurl }}/assets/images/complexity-analysis/big-o-graph.png)

Note that the above inequality does not have to hold true for all values of n. For $$n \lt n_0$$, $$f(n)$$ is allowed to exceed $$cg(n)$$, but for all values of n beyond some values $$n_0$$, $$f(n)$$ is not allowed to exceed $$cg(n)$$.

It tells us that for very large values of $$n$$, $$f(n)$$ will be at most within a constant factor of $$g(n)$$. In other words, $$f(n)$$ will grow no faster than a constant multiple of $$g(n)$$. The rate of growth of $$f(n)$$ is within constant factors of that of $$g(n)$$.

>People tend to write $$f(n) = O(g(n))$$, which isn't technically accurate. A whole lot of functions can satisfy the $$O(g(n))$$ conditions. Therefore, $$O(g(n))$$ is a set of functions, and it is okay to say that $$f(n)$$ belongs to $$O(g(n))$$.

## Example
Let's consider an algorithm whose running time is given by $$f(n) = 3n^3 + 4n + 2$$. Let us try to verify that this algorithm's time complexity is in $$O(n^3)$$. To do this, we need to find a positive constant $$c$$ and an integer $$n_0 \ge 0$$, such that for all $$n \ge n_0$$:

$$3n^3 + 4n + 2 \le cn^3$$

The above inequality would still be true if we re-wrote it while replacing $$cn^3$$ with $$3n^3 + 4n^3 + 2n^3$$. We have replaced the variable part in all terms with $$n^3$$, the variable-part of the highest order term. This gives us:

$$3n^3 + 4n + 2 \le 3n^3 + 4n^3 + 2n^3 = 9n^3$$

This does not violate the inequality because each term on the right-hand side is greater than the corresponding term on the left-hand side. Now, comparing it with the definition of Big O, we can pick c = 9.

That leaves $$n_0$$. For what values of n is the inequality $$9n^3 \le cn^3$$ satisfied? All of them, actually!
So, we can pick $$n_0 = 1$$.

The above solution($$c = 9, n_0 = 1$$) is not unique. We could have picked any value for $$c$$ that exceeds the coefficient of the higher power of $$n$$ in $$f(n)$$. 

It is not possible to find a constant $$c$$ and $$n_0$$ to show that $$f(n) = 3n^3 + 4n + 2$$ is $$O(n^2)$$ or $$O(n)$$. It is possible to show that $$f(n)$$ is $$O(n^4)$$ or $$O(n^5)$$ or any higher power of $$n$$.

It is not really useful to pick higher power.

We are generally interested in the tightest possible bound when it comes to the asymptotic notation.

## Simplified asymptotic analysis
We can arrive at the Big O notation for the algorithm simply by:
- Dropping the multiplicative constants with all terms
- Dropping all but the highest order term

Therefore, $$n^2 + 2n + 1$$ is $$O(n^2)$$ while $$n^5 + 4n^3 + 2n + 43$$ is $$O(n^5)$$.

## Comparison of some common functions
![Asymptotic Notation Comparison]({{ site.baseurl }}/assets/images/complexity-analysis/asymptotic-notation-comparison.png)

$$c \lt log(n) \lt log^2n \lt \sqrt{n} \lt n \lt nlog(n) \lt n^2 \lt n^3 \lt n^4 \lt 2^n \lt e^n \lt n!$$

## Useful Formulae
$$\sum_{i=1}^n c = c + c + c + ... + c = cn$$
$$\sum_{i=1}^ni = 1 + 2 + 3 + ... + n = \frac{n(n+1)}{2}$$
$$\sum_{i=1}^ni^2 = 1 + 4 + 9 + ... + n^2 = \frac{n(n+1)(2n+1)}{6}$$
$$\sum_{i=0}^nr^i = r^0 + r^1 + r^2 + ... + r^n = \frac{r^{n+1}-1}{r-1}$$

## General Tips
1. Every time a list or array gets iterated over $$c$$ x $$length$$ times, it is most likely in $$O(n)$$ time.
2. When you see a problem where the number of elements in the problem space gets halved each time, it will most probably be in $$O(log(n))$$ runtime.
3. Whenever you have a single nested loop, the problem is most likely in quadratic time.

## Common Complexity Scenarios

### Simple for-loop with an increment of size 1
```c
for(int x = 0; x < n; x++) {
	// statement(s) that take constant time
}
```

**Running time complexity** = $$T(n)$$ = $$(2n + 2) + cn$$ = $$(2 + c)n + 2 \in O(n)$$
Dropping the leading constants => $$(n+2)$$
Dropping lower order terms => $$O(n)$$

**Explanation**
Loop runs for $$0$$ till $$n-1$$
`x++` runs $$n$$ times
`x < n` runs $$n + 1$$ times
Initialization `x = 0` runs once
 Running complexity = $$n + n + 1 + 1 = 2n + 2$$
 Constant time statement run $$n$$ times inside loop => `cn`
 Total running time complexity = $$(2n+2) + cn \in O(n)$$.

### For-loop with increments of size k
```c
for(int x = 0; x < n; x+=k) {
	// statement (s) that take constant time
}
```

**Running time complexity** = $$2 + n\frac{2 + c}{k} \in O(n)$$

**Explanation**
`x = 0` runs once
`x` gets incremented by `k` untile it reaches `n`
=> [0, k, 2k, ..., (mk) < n]  => $$floor(\frac{n}{k})$$ times
Comparision also takes same time +1 iteration

Total loop = $$1 + 1 + \frac{n}{k} + \frac{n}{k} = 2 + \frac{2n}{k}$$ times
Constant time statement takes $$c \times \frac{n}{k}$$ time
Total running time complexity = $$2 + \frac{2n}{k} + \frac{cn}{k} = 2 + n(\frac{2+c}{k}) \in O(n)$$

### Simple nested for-loop

```c
for(int i = 0; i < n; i++) {
	for(int j = 0; j < m; j++) {
		// statement(s) that take(s) constant time
	}
}
```

**Running Time Complexity** =  $$nm(2 + c) + 2 + 4n \in O(nm)$$

**Explanation**
Inner loop is a simple for loop that takes $$(2m + 2) + cm$$ time and the outer loop runs it $$n$$ times.
So, it takes $$n((2m + 2) + cm)$$ time. Additionally, the initialization, increment and test for the outer loop take $$2n + 2$$ time so in total, the running time is
$$n((2m + 2) + cm) + 2n + 2 = 2nm + 4n + cnm + 2 = nm(2 + c) + 4n + 2$$, which is $$O(nm)$$.

### Nested for-loop with dependent variables
```c
for(int i = 0; i < n; i++) {
	for(int j = 0; j < i; j++) {
		// statement(s) that take(s) constant time
	}
}
```

**Running Time Complexity** = $$O(n^2)$$

**Explanation**
Outer loop runs $$n$$ times.
For each outer loop run, inner loop runs $$i$$ times.
Inner loop will run for $$i = 0,1,2...(n-1)$$ times for constant time statement $$c$$.
$$c + 2c + 3c + ... + (n-1)c$$ times = $$c(\sum_{i=1}^{n-1}i)$$ = $$c\frac{(n - 1)((n - 1) + 1)}{2}$$ = $$\frac{cn(n - 1)}{2}$$.
The initialization of `j` in the inner loop runs once in each iteration of the outer loop.
So, it incurs total running time of $$1 + 2 + ... + n = \frac{n(n + 1)}{2}$$.
In each iteration the `j++` statement runs one less than the `j < i` statement, this account to $$1 + 2 + ... + (n - 1) = \frac{n(n - 1)}{2}$$.

So in total, the inner loop has a running time of $$\frac{cn(n - 1)}{2} + \frac{n(n + 1)}{2} + \frac{n(n - 1)}{2} + n$$.

The outer loop initialization, test and increment operations account for a running time of $$2n + 2$$. That means the entire script has a running time of $$2n + 2 + \frac{cn(n - 1)}{2} + n + \frac{n(n + 1)}{2} + \frac{n(n - 1)}{2}$$ which is $$O(n^2)$$

### Nested for-loop with index modification
```c
for(int i = 0; i < n; i++) {
	i *= 2;
	for(int j = 0; j < i; j++) {
		// statement(s) that take(s) constant time
	}
}
```

**Running Time Complexity** = $$O(n)$$

**Explanation**

| Outer Loop  |         Inner Loop         |
|:-----------:|:--------------------------:|
|    i = 0    |       i = 0 * 2 = 0        |
|    i = 1    |       i = 1 * 2 = 2        |
|    i = 3    |       i = 3 * 2 = 6        |
|     ...     |            ...             |
| i = (n - 1) | i = (n - 1) * 2 = 2(n - 1) | 

If `i` keeps doubling, it will get from 1 to $$n-1$$ in roughly $$log_2(n-1)$$ steps.
With this simplification, the outer loop index goes approximately 1,2,4,..., $$2^{log_2(n -1 )}$$.
Total number of iterations for inner loop is:
$$2^0 + 2^1 + 2^2 + ... + 2^{log_2(n - 1)} = 2^{log_2(n - 1) + 1} - 1 = 2^{log_2(n - 1)}2 - 1 = 2(n - 1) - 1 = 2n - 3$$.
Total running time of the inner for loop is $$2(2n - 3) + 2 + c(2n - 3)$$ where $$c$$ is the running time of the statements in the body of the inner loop. This simplifies to $$2n(2 + c) - 3c - 4$$. The contribution from the initialization, test and increment operations of the outer for loop is $$2log_2(n - 1) + 2$$. So, the total runtime is $$2n(2 + c) - 3c - 4 + 2log_2(n - 1) + 2$$. The term linear in $$n$$ dominates the others, and the time complexity is $$O(n)$$.

### Loops with log(n) time complexity
```c
i = // constant
n = // constant
k = // constant
while (i < n) {
	i *= k;
	// statement(s) that take(s) constant time
}
```

**Running Time Complexity** = $$\log_k(n) = O(log_k(n))$$.

**Explanation**
A loop statement that multiplies/divides the loop variable by a constant such as the above takes $$log_k(n)$$ time because the loop runs that many times. Let's consider an example where n = 16, and k = 2:

|  i  | Count |
|:---:|:-----:|
|  1  |   1   |
|  2  |   2   |
|  4  |   3   |
|  8  |   4   |
| 16  |   5   | 

$$log_k(n) = log_2(16) = 4$$