"""
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListStack:
    """Stack based on linked list implementation"""

    def __init__(self):
        """Constructor"""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """Get the length of the stack"""
        return self._size

    def is_empty(self) -> bool:
        """Check if the stack is empty"""
        return self._size == 0

    def push(self, val: int):
        """Push"""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """Pop"""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access top of the stack element"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._peek.val

    def to_list(self) -> list[int]:
        """Convert to list for printing"""
        arr = []
        node = self._peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


"""Driver Code"""
if __name__ == "__main__":
    # Initialize stack
    stack = LinkedListStack()

    # Elements push onto stack
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("stack =", stack.to_list())

    # Access top of the stack element
    peek: int = stack.peek()
    print("Top of the stack element peek =", peek)

    # Element pop from stack
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("After pop stack =", stack.to_list())

    # Get the length of the stack
    size: int = stack.size()
    print("Length of the stack size =", size)

    # Check if it is empty
    is_empty: bool = stack.is_empty()
    print("Is the stack empty =", is_empty)
