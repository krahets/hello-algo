'''
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
'''

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于数组实现的栈 """
class ArrayStack:
    def __init__(self):
        self._stack = []
        self._size = 0

    """ 获取栈的长度 """
    def size(self):
        return self._size

    """ 判断栈是否为空 """
    def is_empty(self):
        return self._stack == []

    """ 入栈 """
    def push(self, item):
        self._stack.append(item)
        self._size += 1

    """ 出栈 """
    def pop(self):
        pop = self._stack.pop()
        self._size -= 1
        return pop

    """ 访问栈顶元素 """
    def peek(self):
        return self._stack[-1]

    """ 访问索引 index 处元素 """
    def get(self, index):
        return self._stack[index]


if __name__ == "__main__":
    """ 初始化栈 """
    stack = ArrayStack()

    """ 元素入栈 """
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("栈 stack = ", stack._stack)

    """ 访问栈顶元素 """
    peek = stack.peek()
    print("栈顶元素 peek = ", peek)

    """ 元素出栈 """
    pop = stack.pop()
    print("出栈元素 pop = ", pop)
    print("出栈后 stack = ", stack._stack)

    """ 获取栈的长度 """
    size = stack.size()
    print("栈的长度 size = ", size)

    """ 判断是否为空 """
    isEmpty = stack.is_empty()
