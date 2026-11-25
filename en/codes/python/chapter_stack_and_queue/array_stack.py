"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """Array-backed stack."""

    def __init__(self):
        """Initialize the stack."""
        self._stack: list[int] = []

    def size(self) -> int:
        """Get the stack size."""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Check whether the stack is empty."""
        return self.size() == 0

    def push(self, item: int):
        """Push an element onto the stack."""
        self._stack.append(item)

    def pop(self) -> int:
        """Remove and return the top element."""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack.pop()

    def peek(self) -> int:
        """Peek at the top element."""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Return the backing list for printing."""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the stack
    stack = ArrayStack()

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
