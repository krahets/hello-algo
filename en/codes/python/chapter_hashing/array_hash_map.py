"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """Key-value pair"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """Array-based hash table"""

    def __init__(self):
        """Constructor"""
        # Initialize an array with 100 buckets
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """Hash function"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """Look up a value"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """Insert or update a pair"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """Remove a key-value pair"""
        index: int = self.hash_func(key)
        # Set the slot to None to remove the entry
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """Get all key-value pairs"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """Get all keys"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """Get all values"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """Print the hash table"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the hash table
    hmap = ArrayHashMap()

    # Insert a key-value pair
    # Insert the pair (key, value) into the hash table
    hmap.put(12836, "Xiao Ha")
    hmap.put(15937, "Xiao Luo")
    hmap.put(16750, "Xiao Suan")
    hmap.put(13276, "Xiao Fa")
    hmap.put(10583, "Xiao Ya")
    print("\nHash table after insertion:\nKey -> Value")
    hmap.print()

    # Look up a value
    # Look up key in the hash table to get value
    name = hmap.get(15937)
    print("\nName for student ID 15937: " + name)

    # Remove a key-value pair
    # Remove the pair (key, value) from the hash table
    hmap.remove(10583)
    print("\nHash table after removing 10583:\nKey -> Value")
    hmap.print()

    # Iterate over the hash table
    print("\nIterate over key-value pairs (Key->Value)")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nIterate over keys only")
    for key in hmap.key_set():
        print(key)

    print("\nIterate over values only")
    for val in hmap.value_set():
        print(val)
