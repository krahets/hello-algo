"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Initialize stack
    # Python does not have a built-in stack class, but you can use a list as a stack
    stack: list[int] = []

    # Element push
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("Stack stack =", stack)

    # Access stack top element
    peek: int = stack[-1]
    print("Stack top element peek =", peek)

    # Element pop
    pop: int = stack.pop()
    print("Popped element pop =", pop)
    print("Stack after pop =", stack)

    # Get the length of the stack
    size: int = len(stack)
    print("Stack length size =", size)

    # Determine if it's empty
    is_empty: bool = len(stack) == 0
    print("Is the stack empty =", is_empty)
