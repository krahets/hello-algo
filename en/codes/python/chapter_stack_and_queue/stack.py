"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver code"""
if __name__ == "__main__":
    # [region]{init_stack}
    # Initialize the stack
    # Python has no built-in stack class; a list can be used as a stack
    stack: list[int] = []
    # [endregion]{init_stack}

    # [region]{push}
    # Push elements onto the stack
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    # [endregion]{push}
    print("Stack stack =", stack)

    # [region]{peek}
    # Access the top element
    peek: int = stack[-1]
    # [endregion]{peek}
    print("Top element peek =", peek)

    # [region]{pop}
    # Pop an element from the stack
    pop: int = stack.pop()
    # [endregion]{pop}
    print("Popped element pop =", pop)
    print("After popping, stack =", stack)

    # [region]{size}
    # Get the stack size
    size: int = len(stack)
    # [endregion]{size}
    print("Stack size =", size)

    # [region]{is_empty}
    # Check whether it is empty
    is_empty: bool = len(stack) == 0
    # [endregion]{is_empty}
    print("Is the stack empty =", is_empty)
