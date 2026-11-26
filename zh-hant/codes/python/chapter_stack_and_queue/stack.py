"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # 初始化堆疊
    # Python 沒有內建堆疊類別，可以用 list 當作堆疊
    stack: list[int] = []

    # 將元素推入堆疊
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("堆疊 stack =", stack)

    # 讀取堆疊頂端的元素
    peek: int = stack[-1]
    print("堆疊頂端元素 peek =", peek)

    # 從堆疊彈出元素
    pop: int = stack.pop()
    print("彈出的元素 pop =", pop)
    print("彈出後 stack =", stack)

    # 取得堆疊長度
    size: int = len(stack)
    print("堆疊長度 size =", size)

    # 判斷堆疊是否為空
    is_empty: bool = len(stack) == 0
    print("堆疊是否為空 =", is_empty)
