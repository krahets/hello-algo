"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_stack}
    # 初始化栈
    # Python 没有内置的栈类，可以把 list 当作栈来使用
    stack: list[int] = []
    # [endregion]{init_stack}

    # [region]{push}
    # 元素入栈
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    # [endregion]{push}
    print("栈 stack =", stack)

    # [region]{peek}
    # 访问栈顶元素
    peek: int = stack[-1]
    # [endregion]{peek}
    print("栈顶元素 peek =", peek)

    # [region]{pop}
    # 元素出栈
    pop: int = stack.pop()
    # [endregion]{pop}
    print("出栈元素 pop =", pop)
    print("出栈后 stack =", stack)

    # [region]{size}
    # 获取栈的长度
    size: int = len(stack)
    # [endregion]{size}
    print("栈的长度 size =", size)

    # [region]{is_empty}
    # 判断是否为空
    is_empty: bool = len(stack) == 0
    # [endregion]{is_empty}
    print("栈是否为空 =", is_empty)
