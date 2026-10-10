"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """Stack based on array implementation"""

    def __init__(self):
        """Constructor"""
        self._stack: list[int] = []

    def size(self) -> int:
        """Get the length of the stack"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Check if the stack is empty"""
        return self.size() == 0

    def push(self, item: int):
        """Push"""
        self._stack.append(item)

    def pop(self) -> int:
        """Pop"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack.pop()

    def peek(self) -> int:
        """Access top of the stack element"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Return list for printing"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # Initialize stack
    stack = ArrayStack()

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
