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
        self._arr: list[int] = [0] * self._capacity  # Array that stores the list elements
        self._size: int = 0  # List length (current number of elements)
        self._extend_ratio: int = 2  # Factor by which the list capacity grows

    def size(self) -> int:
        """Get the list length (current number of elements)"""
        return self._size

    def capacity(self) -> int:
        """Get the list capacity"""
        return self._capacity

    def get(self, index: int) -> int:
        """Access an element"""
        # Throw an exception if the index is out of bounds, here and below
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Update an element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        self._arr[index] = num

    def add(self, num: int):
        """Append an element"""
        # Increase capacity when the elements would no longer fit
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Insert an element in the middle"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        # Increase capacity when the elements would no longer fit
        if self._size == self.capacity():
            self.extend_capacity()
        # Shift the elements from index onward one position to the right
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Update the element count
        self._size += 1

    def remove(self, index: int) -> int:
        """Remove an element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        num = self._arr[index]
        # Shift the elements after index one position to the left
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Update the element count
        self._size -= 1
        # Return the removed element
        return num

    def extend_capacity(self):
        """Increase the list capacity"""
        # Create an array _extend_ratio times as long and copy the original array into it
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Update the list capacity
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Return the list up to its current length"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the list
    nums = MyList()
    # Append an element
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"List nums = {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")

    # Insert an element in the middle
    nums.insert(6, index=3)
    print("After inserting 6 at index 3, nums =", nums.to_array())

    # Remove an element
    nums.remove(3)
    print("After removing the element at index 3, nums =", nums.to_array())

    # Access an element
    num = nums.get(1)
    print("Reading index 1 gives num =", num)

    # Update an element
    nums.set(0, 1)
    print("After setting the element at index 1 to 0, nums =", nums.to_array())

    # Test capacity growth
    for i in range(10):
        # At i = 5, the list length would exceed its capacity, so the list grows
        nums.add(i)
    print(f"After increasing capacity, the list is {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")
