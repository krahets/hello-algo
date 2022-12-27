"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于数组实现的栈 """
class ArrayStack:
    def __init__(self):
        self.__stack = []

    """ 获取栈的长度 """
    def size(self):
        return len(self.__stack)

    """ 判断栈是否为空 """
    def is_empty(self):
        return self.__stack == []

    """ 入栈 """
    def push(self, item):
        self.__stack.append(item)

    """ 出栈 """
    def pop(self):
        assert not self.is_empty(), "栈为空"
        return self.__stack.pop()

    """ 访问栈顶元素 """
    def peek(self):
        assert not self.is_empty(), "栈为空"
        return self.__stack[-1]
    
    """ 返回列表用于打印 """
    def to_list(self):
        return self.__stack


""" Driver Code """
if __name__ == "__main__":
    """ 初始化栈 """
    stack = ArrayStack()

    """ 元素入栈 """
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("栈 stack =", stack.to_list())

    """ 访问栈顶元素 """
    peek = stack.peek()
    print("栈顶元素 peek =", peek)

    """ 元素出栈 """
    pop = stack.pop()
    print("出栈元素 pop =", pop)
    print("出栈后 stack =", stack.to_list())

    """ 获取栈的长度 """
    size = stack.size()
    print("栈的长度 size =", size)

    """ 判断是否为空 """
    is_empty = stack.is_empty()
    print("栈是否为空 =", is_empty)
