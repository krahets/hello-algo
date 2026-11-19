"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_stack}
    # 初始化堆疊
    # Python 沒有內建的堆疊類別，可以把 list 當作堆疊來使用
    stack: list[int] = []
    # [endregion]{init_stack}

    # [region]{push}
    # 元素入堆疊
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    # [endregion]{push}
    print("堆疊 stack =", stack)

    # [region]{peek}
    # 訪問堆疊頂元素
    peek: int = stack[-1]
    # [endregion]{peek}
    print("堆疊頂元素 peek =", peek)

    # [region]{pop}
    # 元素出堆疊
    pop: int = stack.pop()
    # [endregion]{pop}
    print("出堆疊元素 pop =", pop)
    print("出堆疊後 stack =", stack)

    # [region]{size}
    # 獲取堆疊的長度
    size: int = len(stack)
    # [endregion]{size}
    print("堆疊的長度 size =", size)

    # [region]{is_empty}
    # 判斷是否為空
    is_empty: bool = len(stack) == 0
    # [endregion]{is_empty}
    print("堆疊是否為空 =", is_empty)
