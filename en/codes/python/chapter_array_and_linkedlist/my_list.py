"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """List class"""

    def __init__(self):
        """Constructor"""
        self._capacity: int = 10  # List capacity
        self._arr: list[int] = [0] * self._capacity  # Array (stores list elements)
        self._size: int = 0  # List length (current number of elements)
        self._extend_ratio: int = 2  # Multiple for each list expansion

    def size(self) -> int:
        """Get list length (current number of elements)"""
        return self._size

    def capacity(self) -> int:
        """Get list capacity"""
        return self._capacity

    def get(self, index: int) -> int:
        """Access element"""
        # If the index is out of bounds, throw an exception, as below
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Update element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        self._arr[index] = num

    def add(self, num: int):
        """Add element at the end"""
        # When the number of elements exceeds capacity, trigger the expansion mechanism
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Insert element in the middle"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        # When the number of elements exceeds capacity, trigger the expansion mechanism
        if self._size == self.capacity():
            self.extend_capacity()
        # Move all elements after `index` one position backward
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Update the number of elements
        self._size += 1

    def remove(self, index: int) -> int:
        """Remove element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        num = self._arr[index]
        # Move all elements after `index` one position forward
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Update the number of elements
        self._size -= 1
        # Return the removed element
        return num

    def extend_capacity(self):
        """Extend list"""
        # Create a new array of _extend_ratio times the length of the original array and copy the original array to the new array
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Update list capacity
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Return a list of valid lengths"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # Initialize list
    nums = MyList()
    # Add element at the end
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"List nums = {nums.to_array()} ，capacity = {nums.capacity()} ，length = {nums.size()}")

    # Insert element in the middle
    nums.insert(6, index=3)
    print("Insert number 6 at index 3, resulting in nums =", nums.to_array())

    # Remove element
    nums.remove(3)
    print("Remove the element at index 3, resulting in nums =", nums.to_array())

    # Access element
    num = nums.get(1)
    print("Access the element at index 1, resulting in num =", num)

    # Update element
    nums.set(0, 1)
    print("Update the element at index 1 to 0, resulting in nums =", nums.to_array())

    # Test expansion mechanism
    for i in range(10):
        # At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
        nums.add(i)
    print(f"After expansion, the list {nums.to_array()} ，capacity = {nums.capacity()} ，length = {nums.size()}")
