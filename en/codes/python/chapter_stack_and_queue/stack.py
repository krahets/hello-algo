"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Initialize stack
    # Python does not have a built-in stack class, we can use list as a stack
    stack: list[int] = []

    # Elements push onto stack
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("stack =", stack)

    # Access top of the stack element
    peek: int = stack[-1]
    print("Top of the stack element peek =", peek)

    # Element pop from stack
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("After pop stack =", stack)

    # Get the length of the stack
    size: int = len(stack)
    print("Length of the stack size =", size)

    # Check if it is empty
    is_empty: bool = len(stack) == 0
    print("Is the stack empty =", is_empty)
