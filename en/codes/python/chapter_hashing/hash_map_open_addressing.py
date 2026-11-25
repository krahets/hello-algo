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
        self.load_thres = 2.0 / 3.0  # Load factor threshold for resizing
        self.extend_ratio = 2  # Growth factor
        self.buckets: list[Pair | None] = [None] * self.capacity  # Bucket array
        self.TOMBSTONE = Pair(-1, "-1")  # Deletion marker

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
        for _ in range(self.capacity):
            bucket = self.buckets[index]
            if bucket is None:
                break
            # Record the first deletion marker encountered
            if bucket is self.TOMBSTONE:
                if first_tombstone == -1:
                    first_tombstone = index
            # If key is found, return its bucket index
            elif bucket.key == key:
                # If a deletion marker was found earlier, move the pair to that index
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = bucket
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # Return the new bucket index
                return index  # Return the bucket index
            # Compute the next bucket index, wrapping to the start at the end
            index = (index + 1) % self.capacity
        # If key is absent, return the index for insertion
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """Look up a value"""
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the pair is found, return its val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # Return None if the pair is absent
        return None

    def put(self, key: int, val: str):
        """Insert a key-value pair"""
        # Expand the table when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres:
            self.extend()
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the pair is found, overwrite val and return
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # If the pair is absent, insert it
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """Remove a key-value pair"""
        # Find the bucket index for key
        index = self.find_bucket(key)
        # If the pair is found, replace it with a deletion marker
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """Expand the hash table"""
        # Save the original hash table
        buckets_tmp = self.buckets
        # Initialize the larger hash table
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # Move the key-value pairs from the old table into the new one
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


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the hash table
    hashmap = HashMapOpenAddressing()

    # Insert a key-value pair
    # Insert the pair (key, val) into the hash table
    hashmap.put(12836, "Xiao Ha")
    hashmap.put(15937, "Xiao Luo")
    hashmap.put(16750, "Xiao Suan")
    hashmap.put(13276, "Xiao Fa")
    hashmap.put(10583, "Xiao Ya")
    print("\nHash table after insertion:\nKey -> Value")
    hashmap.print()

    # Look up a value
    # Look up key in the hash table to get val
    name = hashmap.get(13276)
    print("\nName for student ID 13276: " + name)

    # Remove a key-value pair
    # Remove the pair (key, val) from the hash table
    hashmap.remove(16750)
    print("\nHash table after removing 16750:\nKey -> Value")
    hashmap.print()
