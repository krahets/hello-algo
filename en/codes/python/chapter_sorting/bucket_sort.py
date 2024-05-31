"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """Bucket sort"""
    # Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. Distribute array elements into various buckets
    for num in nums:
        # Input data range is [0, 1), use num * k to map to index range [0, k-1]
        i = int(num * k)
        # Add num to bucket i
        buckets[i].append(num)
    # 2. Sort each bucket
    for bucket in buckets:
        # Use built-in sorting function, can also replace with other sorting algorithms
        bucket.sort()
    # 3. Traverse buckets to merge results
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # Assume input data is floating point, range [0, 1)
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("Bucket sort completed nums =", nums)
