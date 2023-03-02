"""
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

class LinkedListStack:
    """ 基于链表实现的栈 """
    def __init__(self):
        """ 构造方法 """
        self.__peek = None
        self.__size = 0

    def size(self):
        """ 获取栈的长度 """
        return self.__size

    def is_empty(self):
        """ 判断栈是否为空 """
        return not self.__peek

    def push(self, val):
        """ 入栈 """
        node = ListNode(val)
        node.next = self.__peek
        self.__peek = node
        self.__size += 1

    def pop(self):
        """ 出栈 """
        num = self.peek()
        self.__peek = self.__peek.next
        self.__size -= 1
        return num

    def peek(self):
        """ 访问栈顶元素 """
        # 判空处理
        if not self.__peek: return None
        return self.__peek.val

    def to_list(self):
        """ 转化为列表用于打印 """
        arr = []
        node = self.__peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


""" Driver Code """
if __name__ == "__main__":
    """ 初始化栈 """
    stack = LinkedListStack()

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
