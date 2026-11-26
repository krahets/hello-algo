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
    """Stack backed by a linked list."""

    def __init__(self):
        """Initialize the stack."""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """Get the stack size."""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the stack is empty."""
        return self._size == 0

    def push(self, val: int):
        """Push an element onto the stack."""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """Remove and return the top element."""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Peek at the top element."""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._peek.val

    def to_list(self) -> list[int]:
        """Convert to a list for printing."""
        arr = []
        node = self._peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the stack
    stack = LinkedListStack()

    # Push elements onto the stack
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("stack =", stack.to_list())

    # Peek at the top element
    peek: int = stack.peek()
    print("Top element (peek) =", peek)

    # Pop the top element
    pop: int = stack.pop()
    print("Popped element (pop) =", pop)
    print("After the pop, stack =", stack.to_list())

    # Get the stack size
    size: int = stack.size()
    print("Stack size =", size)

    # Check whether the stack is empty
    is_empty: bool = stack.is_empty()
    print("Stack is empty =", is_empty)
