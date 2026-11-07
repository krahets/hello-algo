"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """Hash table with open addressing"""

    def __init__(self):
        """Constructor"""
        self.size = 0  # Number of key-value pairs
        self.capacity = 4  # Hash table capacity
        self.load_thres = 2.0 / 3.0  # Load factor threshold that triggers capacity growth
        self.extend_ratio = 2  # Capacity growth factor
        self.buckets: list[Pair | None] = [None] * self.capacity  # Bucket array
        self.TOMBSTONE = Pair(-1, "-1")  # Tombstone marker

    def hash_func(self, key: int) -> int:
        """Hash function"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Load factor"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """Find the bucket index for key"""
        index = self.hash_func(key)
        first_tombstone = -1
        # Probe linearly until an empty bucket is reached
        for _ in range(self.capacity):
            if self.buckets[index] is None:
                break
            # If key is found, return its bucket index
            if self.buckets[index].key == key:
                # If a tombstone was encountered earlier, move the key-value pair to that index
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # Return the bucket index after the move
                return index  # Return the bucket index
            # Record the first tombstone encountered
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % self.capacity
        # If key is absent, return the index for insertion
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """Lookup operation"""
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the key-value pair is found, return its val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # Return None if the key-value pair is absent
        return None

    def put(self, key: int, val: str):
        """Insert operation"""
        # Grow the capacity when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres:
            self.extend()
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the key-value pair is found, overwrite val and return
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # If the key-value pair is absent, insert it
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """Remove operation"""
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the key-value pair is found, replace it with a tombstone
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """Grow the hash table capacity"""
        # Keep a reference to the original hash table
        buckets_tmp = self.buckets
        # Initialize a new hash table with the expanded capacity
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # Move the key-value pairs from the original hash table to the new one
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """Print the hash table"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver code"""
if __name__ == "__main__":
    # Initialize the hash table
    hashmap = HashMapOpenAddressing()

    # Insert operation
    # Insert the key-value pair (key, val) into the hash table
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\nHash table after insertion:\nKey -> Value")
    hashmap.print()

    # Lookup operation
    # Look up key in the hash table to obtain val
    name = hashmap.get(13276)
    print("\nLook up student ID 13276 to obtain the name " + name)

    # Remove operation
    # Remove the key-value pair (key, val) from the hash table
    hashmap.remove(16750)
    print("\nHash table after removing 16750:\nKey -> Value")
    hashmap.print()
