"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """Bucket sort"""
    # Initialize k = n/2 buckets, expecting 2 elements per bucket
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. Distribute the array elements among the buckets
    for num in nums:
        # The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
        i = int(num * k)
        # Add num to bucket i
        buckets[i].append(num)
    # 2. Sort each bucket
    for bucket in buckets:
        # Use the built-in sorting function, or replace it with another sorting algorithm
        bucket.sort()
    # 3. Traverse the buckets to combine the results
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # Assume the input consists of floating-point numbers in [0, 1)
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("After bucket sort, nums =", nums)
