---
layout: post
title:  "Quick Sort Algorithm"
tags: algorithm
usemathjax: true
---
Quicksort is a divide and conquer algorithm, it picks an element as pivot and partitions the array around pivot. Partitioning can be done in many different ways. The implementation below cover 2 most used partitioning schemes for quick sort - **Hoare** and **Lomuto**.

```java
import java.util.*;

// quick sort is unstable
class QuickSort {
	enum PartitionType {
		Hoare,
		Lomuto
	}

	// Partition Scheme
	// should return index of pivot
	// all values on left of pivot should be smaller than pivot
	// all values on right of pivot should be greater than pivot
	
	// There are 2 major partitioning schemes
	// Hoare and Lomuto
	
	// Hoare Partition Algorithm
	// 1. First element is assumed to be the initial pivot(can also choose middle or
	// last element)
	// 2. Linear Algorithm
	// 3. Relatively Faster
	// 4. Doesn't fix pivot element in the correct position
	// This function takes last element as pivot
	static int partition_hoare(int[] arr, int low, int high) {
		int pivot = arr[low];
		int i = low - 1;
		int j = high + 1;
		
		while (true) {
			// find the left most element >= pivot
			do {
				i++;
			} while (arr[i] < pivot);
			
			// find the right most element <= pivot
			do {
				j--;
			} while (arr[j] > pivot);
			
			// if two pointers met
			if (i >= j)
				return j;
			
			// swap to correct position
			int temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
		}
	}

	// Lomuto Partition Algorithm
	// 1. Random element is located and picked and then exchanged with the first or
	// the last element to give initial pivot
	// 2. Linear Algorithm
	// 3. Slower
	// 4. Fixes pivot element in the correct position
	// This implementation takes last element as pivot
	static int partition_lomuto(int[] arr, int low, int high) {
		int pivot = arr[high];
		int i = (low - 1);
		for (int j = low; j <= high - 1; j++) {
			// if current element is <= pivot
			if (arr[j] <= pivot) {
				i++;
				// swap to correct position
				int temp = arr[i];
				arr[i] = arr[j];
				arr[j] = temp;
			}
		}
		int temp = arr[i + 1];
		arr[i + 1] = arr[high];
		arr[high] = temp;
		return (i + 1);
	}

	static void quickSortRec(int[] arr, int low, int high, PartitionType partition_scheme) {
		if (high > low) {
			// partition ensures pivot value is in correct position
			int pivotIndex = (partition_scheme == PartitionType.Hoare) 
				? partition_hoare(arr, low, high) 
				: partition_lomuto(arr, low, high);
			// sort left of pivot
			quickSortRec(arr, low, pivotIndex - 1, partition_scheme);
			// sort right of pivot
			quickSortRec(arr, pivotIndex + 1, high, partition_scheme);
		}
	}
	
	static void quickSort(int[] nums) {
		quickSortRec(nums, 0, nums.length - 1, PartitionType.Lomuto);
	}

	public static void main(String[] args) {
		int[][] numsList = {
			{ 55, 23, 26, 2, 18, 78, 23, 8, 2, 3 },
			{ 1 },
			{ 9, 8, 7, 2, 3, 1 },
			{ 10, 20, 30, -1, -2 }
		};
		
		for (int i = 0; i < numsList.length; i++) {
			System.out.println((i + 1) + ". Before Sorting");
			System.out.println("   " + Arrays.toString(numsList[i]));
			
			quickSort(numsList[i]);
			
			System.out.println("   After Sorting");
			System.out.println("   " + Arrays.toString(numsList[i]));
		}
	}
}

```
# Complexity
Runtime complexity $$O(nlogn)$$

Space complexity $$O(logn)$$
