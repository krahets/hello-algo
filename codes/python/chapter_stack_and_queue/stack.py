"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


""" Driver Code """
if __name__ == "__main__":
    """ 初始化栈 """
    # Python 没有内置的栈类，可以把 list 当作栈来使用 
    stack = []

    """ 元素入栈 """
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("栈 stack =", stack)

    """ 访问栈顶元素 """
    peek = stack[-1]
    print("栈顶元素 peek =", peek)

    """ 元素出栈 """
    pop = stack.pop()
    print("出栈元素 pop =", pop)
    print("出栈后 stack =", stack)

    """ 获取栈的长度 """
    size = len(stack)
    print("栈的长度 size =", size)

    """ 判断是否为空 """
    is_empty = len(stack) == 0
    print("栈是否为空 =", is_empty)
