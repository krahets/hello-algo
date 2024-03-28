"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # 初始化堆疊
    # Python 沒有內建的堆疊類別，可以把 list 當作堆疊來使用
    stack: list[int] = []

    # 元素入堆疊
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("堆疊 stack =", stack)

    # 訪問堆疊頂元素
    peek: int = stack[-1]
    print("堆疊頂元素 peek =", peek)

    # 元素出堆疊
    pop: int = stack.pop()
    print("出堆疊元素 pop =", pop)
    print("出堆疊後 stack =", stack)

    # 獲取堆疊的長度
    size: int = len(stack)
    print("堆疊的長度 size =", size)

    # 判斷是否為空
    is_empty: bool = len(stack) == 0
    print("堆疊是否為空 =", is_empty)
