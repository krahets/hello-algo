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
    """Hash table based on array implementation"""

    def __init__(self):
        """Constructor"""
        # Initialize an array, containing 100 buckets
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """Hash function"""
        index = key % 100
        return index

    def get(self, key: int) -> str:
        """Query operation"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """Add operation"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """Remove operation"""
        index: int = self.hash_func(key)
        # Set to None, representing removal
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
        """Print hash table"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize hash table
    hmap = ArrayHashMap()

    # Add operation
    # Add key-value pair (key, value) to the hash table
    hmap.put(12836, "Ha")
    hmap.put(15937, "Luo")
    hmap.put(16750, "Suan")
    hmap.put(13276, "Fa")
    hmap.put(10583, "Ya")
    print("\nAfter adding, the hash table is\nKey -> Value")
    hmap.print()

    # Query operation
    # Enter key to the hash table, get value
    name = hmap.get(15937)
    print("\nEnter student ID 15937, found name " + name)

    # Remove operation
    # Remove key-value pair (key, value) from the hash table
    hmap.remove(10583)
    print("\nAfter removing 10583, the hash table is\nKey -> Value")
    hmap.print()

    # Traverse hash table
    print("\nTraverse key-value pairs Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nIndividually traverse keys Key")
    for key in hmap.key_set():
        print(key)

    print("\nIndividually traverse values Value")
    for val in hmap.value_set():
        print(val)
