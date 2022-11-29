'''
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于链表实现的栈 """
class LinkedListStack:
    def __init__(self):
        self.__head = None
        self.__size = 0

    """ 获取栈的长度 """
    def size(self):
        return self.__size

    """ 判断栈是否为空 """
    def is_empty(self):
        return not self.__head

    """ 入栈 """
    def push(self, val):
        node = ListNode(val)
        node.next = self.__head
        self.__head = node
        self.__size += 1

    """ 出栈 """
    def pop(self):
        # 判空处理
        if not self.__head: return None
        pop = self.__head.val
        self.__head = self.__head.next
        self.__size -= 1
        return pop

    """ 访问栈顶元素 """
    def peek(self):
        # 判空处理
        if not self.__head: return None
        return self.__head.val

    """ 转化为列表用于打印 """
    def to_list(self):
        arr = []
        node = self.__head
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
    isEmpty = stack.is_empty()
