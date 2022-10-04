---
layout: post
title:  "Java 11 Fundamentals: Collections"
tags: java collections
usemathjax: true
---

Every application requires wide variety of data structures based on your use case. Implementing every basic data structures yourself is error prone, it's hard to get everything right. This is one of the reasons why java provides [collection](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Collection.html) with jdk. 

## The Array Problem
Some may argue why not use array everywhere? 
Yes, you can but is it worth it? 

Given below are some problems associated with array: 
- Increasing size - Adding new elements in already filled array requires creating new array and copying values from old one. Old array is left for garbage collection, resulting in memory wastage.
- Homogeneous object storage - You can only store objects of same type in an array.
- Deletion & Insertion - You cannot easily insert or delete elements at middle of the array.

Apart from the issues above, the complexity is also very bad for frequently used operations in array.

|        Array Operation         | Real Time Complexity | Assumed Time Complexity |
|:------------------------------:|:--------------------:|:-----------------------:|
|      Access i-th element       |    O($$\sqrt{N}$$)     |          O(1)           |
|     Traverse all elements      |  O(N + $$\sqrt{N}$$)   |          O(N)           |
| Override element at i-th index |    O($$\sqrt{N}$$)     |          O(1)           |
|        Insert element E        |  O(N + $$\sqrt{N}$$)   |          O(N)           |
|        Delete element E        |  O(N + $$\sqrt{N}$$)   |          O(N)           |

## Collection Design
![Collections]({{ site.baseurl }}/assets/images/java-11-collections/collections.excalidraw.png)

## Choosing Collection
![Which Collection]({{ site.baseurl }}/assets/images/java-11-collections/which_collection.excalidraw.png)

## Collection Behaviors
Collection interface extends iterable interface which allows creating iterator object. Iterator objects can be used to loop over collections. 

![Iterable]({{ site.baseurl }}/assets/images/java-11-collections/iterable.excalidraw.png)

Sample code snippet showing iterator usage provided below:

```java
// Make a collection
List<String> movies = new ArrayList<String>();
movies.add("Matrix");
movies.add("Spiderman");
movies.add("Batman");

// Get iterator
Iterator<String> it = movies.iterator();

// Looping through collection
while(it.hasNext()) {
	// process collection elements
	System.out.println(it.next());
}

```

## Lists
Lists are collection of elements having defined iteration order where each element has an index.

### ArrayList

Arraylist uses dynamic array for storing objects. It is good for general purpose implementation and can be used as default implementation in most cases. Arraylist is also CPU cache sympathetic because of the way it is stored in-memory. Initial ArrayList starts with default capacity and creates a new array with double the current capacity once it is full while copies elements from old array. ArrayList grows using doubling strategy as shown in figure below.

![ArrayList Doubling]({{ site.baseurl }}/assets/images/java-11-collections/arraylist_doubling.excalidraw.png)

### LinkedList

LinkedList has same implementation as doubly linked list and uses pointers to traverse across the data structure. Use linkedlist when there are very frequent addition/removal of elements at start. For most cases linkedlists will have worse performance than arraylist.

![Doubly Linked List]({{ site.baseurl }}/assets/images/java-11-collections/doubly-linked-list.excalidraw.png)

### Performance Comparison

|            | get  |    add     | contains | next | remove |
|:----------:|:----:|:----------:|:--------:|:----:|:------:|
| ArrayList  | O(1) | O(N), Ω(1) |   O(N)   | O(1) |  O(N)  |
| LinkedList | O(N) |    O(1)    |   O(N)   | O(1) |  O(N)  |

## Maps
Maps are collections of pairs, they have keys and values. Dictionary is a good example of map, where you find meaning of word by using word as key. In java maps, keys are unique, and the uniqueness is defined by keys equals/hashcode method. Use maps over other data structures when doing frequent lookups.

### HashMap

HashMap is a good general purpose implementation for most usecases. Hashmap uses a `.hashcode()` function to generate hash values for a key. The generated hashcodes are stored in an array of buckets. Buckets are linked lists to accomodate for hash collisions. Elements are stored in `hash % bucket_count` bucket.  Buckets can also be trees in some cases. Number of buckets can increase with more elements and a rehash of all keys happens during this expansion of hashmaps.

![Hashmap]({{ site.baseurl }}/assets/images/java-11-collections/hashmap.excalidraw.png)

### TreeMap

TreeMap defines sort order and adds functionality. You can look at subsections of map based on sort order. This can perform better for some specific usecases. Underlying implementation of TreeMap is a red/black tree(a balanced binary tree). Elements with lower value are stored on left branch of these trees & higher values are stored in right branch. The tree gets re-balanced, so it never goes longer than **$$\log_{2}N$$** in terms of depth, where N is the number of elements. In general treemaps are slower than hashmaps, because of too many pointer operations, but treemap provides the navigation and sorting functionality which is missing in hashmaps.

Following example shows world population stored in treemap, it is easy to find cities with population in specific range, max population city, min population city, etc.

![Treemap]({{ site.baseurl }}/assets/images/java-11-collections/treemap.excalidraw.png)

JDK also has other implementations of Map as well like EnumMap, LinkedHashMap & IdentityHashMap. Read official docs to know more in-depth.

### Performance Comparison
|         |    put     |    get     | containsKey |     next      |
|:-------:|:----------:|:----------:|:-----------:|:-------------:|
| HashMap | O(N), Ω(1) | O(N), Ω(1) | O(N), Ω(1)  | O(Capacity/N) |
| TreeMap | O(log(N))  | O(log(N))  |  O(log(N))  |   O(log(N))   |

## Sets

Sets are collections with uniqueness as fundamental property. When `equals` method on two objects return same value, they are considered equal. Sets have no two objects within them with same equals value. Implementation of `equals` may require implementing `hashcode` or `comparator`.

### HashCode / Equals Contract

Many APIs within JDK have contracts between them.  Contracts are assumptions being made by any class within JDK and there are obligations on your code that you need to meet in order for that class functionality to work.

Since HashMap/HashSet depend on `hashCode` to find slots in bucket and `equals` to compare if two values is equal. If a developer doesn't properly define this functions there is a possibility of you getting in a situation with duplicate objects within set or same object present in different buckets in hashmap. If there are 2 objects `object1` and `object2`, the hashcode/equals contract is as follows:

`object1.equals(object2)` $$\implies$$ `object1.hashCode() == object2.hashCode()`

This is one way implication, 2 different object can have same hashCode, but same objects should always have same hashCode. Violating this contract will break the functionality of your class.

This contract is important because java has 2 types of equality - reference based and value based. Reference based just needs to inherit equals from Object. Value based requires a custom equals method. For value based equality proper equals & hashcode implementation should be defined.

Java 8+ have `hashCode()` for almost all primitives. Modern IDEs can auto-generate hashCode imeplementation for you. Java 7+ also has `Objects.hash()` that generates hashcode by combining individuals fields inside an object, but this function has high performance overhead, so, avoid using it.

```java
// Arrays
Arrays.hashCode();

// Primitives (Java 8+)
Long.hashCode(longValue);

// Old Primitives (< Java 8)
(int) (l ^ (l >>> 32)) // long l
Float.floatToIntBits(f); // float f
```

### HashSet

HashSet is based upon HashMap and uses the HashMap implementation. HashSet is a HashMap with bucket size of 1. HashSet is good for general purpose and should be used by default.

### TreeSet

TreeSet is based upon TreeMap and uses the TreeMap implementation(red/black binary tree), it provides features for searching and navigation within set. TreeSet is TreeMap without any duplicate nodes in tree.

## Streams

[Streams](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/stream/package-summary.html) are powerful new abstractions introduced in Java 8. Stream class provides functional-style operations on stream of elements, such as map-reduce transformations on collections. I would recommend using streams to do any kind of transformation in collections instead of traditional loops. Using stream improves readability and reduces boilerplate code.

Example code snippet to show stream usage:

```java
// find sum of weights of red widgets
int sum = widgets.stream()
	.filter(b -> b.getColor() == RED)
	.mapToInt(b -> b.getWeight())
	.sum();
```

Streams are usually used with collectors. I would recommend reading [Collectors](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/stream/Collectors.html) documentation for examples.

Example code snippet to show collector usage:

```java
// Accumulate names into a List
List<String> list = people.stream()
	.map(Person::getName)
	.collect(Collectors.toList());
```

## Factory Methods
[Collections](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Collections.html) class provides many utility methods which can help prevent redundant implementation of commonly used functionality like, find min & max from list, create empty set, etc. Most factory methods are optimized for performance, as they have generic implementation details.

Having empty collections can be useful when you want to pass an empty collection as argument, or you want to return an empty collection from a function.

```java
// Empty Collections
List<String> list = Collections.emptyList();
Map<Integer, String> map = Collections.emptyMap();
Set<Integer> set = Collections.emptySet();
```

Singletons are helpful when you want to create collections with single value.

```java
// Singletons
List<String> list = Collections.singletonList("one");
Mao<Integer, String> map = Collections.singletonMap(1, "one");
Set<Integer> set = Collections.singleton(1);
```

Collection factories allow creating collections without a lot of boilerplate code.

```java
List<String> list = List.of("India", "USA");
Map<String, Integer> map = Map.of("Shubham", 1000, "Alex", 5000);
Map<String, Integer> entries = Map.ofEntries(
	Map.entry("Shubham", 1000),
	Map.entry("Alex", 5000)
);
```

Java 10 introduced immutable copies approach as an alternative to immutable factory methods.

```java
// Modifying names does not modify immutableNames
Collection<String> names = new ArrayList();
names.add("Shubham");
names.add("Alex");

// add/remove/updated prohibited
List<String> immutableNames = List.copyOf(names);

Map<String, Integer> budget = new HashMap<>();
budget.put("Shubham", 1000);
budget.put("Alex", 5000);

// add/remove/updated prohibited
Map<String, Integer> immutableBudget = Map.copyOf(budget);
```

Java 9 introduced unmodifiable views.

```java
// Modifying names is the only way to modify namesView
List<String> names = new ArrayList<>();
names.add("Shubham");
names.add("Alex");

// add/remove/updated prohibited directly, still possible through names
List<String> namesView = Collections.unmodifiableList(names);

Map<String, Integer> budget = new HashMap<>();
budget.put("Shubham", 1000);
budget.put("Alex", 5000);

// add/remove/updated prohibited, still possible through budget
Map<String, Integer> budgetView = Collections.unmodifiableMap(budget);
```

## Conclusion
This article should help you choose correct collection for your usecase and identify tradeoff between different collections. Don't forget to go through official docs for [Collection](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Collection.html), [List](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/List.html), [Map](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Map.html), [Set](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Set.html) and [Queue](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Queue.html).