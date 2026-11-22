"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver code"""
if __name__ == "__main__":
    # Initialize the stack
    # Python has no built-in stack class; a list can be used as a stack
    stack: list[int] = []

    # Push elements onto the stack
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("Stack stack =", stack)

    # Access the top element
    peek: int = stack[-1]
    print("Top element peek =", peek)

    # Pop an element from the stack
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("After popping, stack =", stack)

    # Get the stack size
    size: int = len(stack)
    print("Stack size =", size)

    # Check whether it is empty
    is_empty: bool = len(stack) == 0
    print("Is the stack empty =", is_empty)
