"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """Stack class based on array"""

    def __init__(self):
        """Constructor"""
        self._stack: list[int] = []

    def size(self) -> int:
        """Get the length of the stack"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Determine if the stack is empty"""
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
        """Access stack top element"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Return array for printing"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # Initialize stack
    stack = ArrayStack()

    # Element push
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("Stack stack =", stack.to_list())

    # Access stack top element
    peek: int = stack.peek()
    print("Stack top element peek =", peek)

    # Element pop
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("Stack after pop =", stack.to_list())

    # Get the length of the stack
    size: int = stack.size()
    print("Stack length size =", size)

    # Determine if it's empty
    is_empty: bool = stack.is_empty()
    print("Is the stack empty =", is_empty)
