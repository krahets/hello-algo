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
        self._arr: list[int] = [0] * self._capacity  # Array (stores the list elements)
        self._size: int = 0  # List length (current number of elements)
        self._extend_ratio: int = 2  # Factor by which the list capacity grows each time

    def size(self) -> int:
        """Get the list length (current number of elements)"""
        return self._size

    def capacity(self) -> int:
        """Get the list capacity"""
        return self._capacity

    def get(self, index: int) -> int:
        """Access an element"""
        # Raise an exception if the index is out of bounds; the same applies below
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Update an element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        self._arr[index] = num

    def add(self, num: int):
        """Append an element at the end"""
        # Grow the capacity when adding an element would exceed it
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Insert an element in the middle"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        # Grow the capacity when adding an element would exceed it
        if self._size == self.capacity():
            self.extend_capacity()
        # Shift all elements at and after index `index` one position to the right
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Update the number of elements
        self._size += 1

    def remove(self, index: int) -> int:
        """Remove an element"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        num = self._arr[index]
        # Shift all elements after index `index` one position to the left
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Update the number of elements
        self._size -= 1
        # Return the removed element
        return num

    def extend_capacity(self):
        """Grow the list capacity"""
        # Create a new array with _extend_ratio times the original length and copy the original array into it
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Update the list capacity
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Return the portion of the list that contains elements"""
        return self._arr[: self._size]


"""Driver code"""
if __name__ == "__main__":
    # Initialize the list
    nums = MyList()
    # Append an element at the end
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"List nums = {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")

    # Insert an element in the middle
    nums.insert(6, index=3)
    print("Insert the number 6 at index 3, giving nums =", nums.to_array())

    # Remove an element
    nums.remove(3)
    print("Remove the element at index 3, giving nums =", nums.to_array())

    # Access an element
    num = nums.get(1)
    print("Access the element at index 1, giving num =", num)

    # Update an element
    nums.set(0, 1)
    print("Update the element at index 1 to 0, giving nums =", nums.to_array())

    # Test capacity growth
    for i in range(10):
        # When i = 5, the list length would exceed its capacity, triggering capacity growth
        nums.add(i)
    print(f"List after growing its capacity: {nums.to_array()}, capacity = {nums.capacity()}, length = {nums.size()}")
