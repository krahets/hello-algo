'''
File: linkedlist_stack.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于链表实现的栈 """


class LinkedListStack:
    def __init__(self):
        self.head = None

    """ 获取栈的长度 """

    def size(self):
        cnt = 0
        temp = self.head
        while temp is not None:
            temp = temp.next
            cnt += 1
        return cnt

    """ 判断栈是否为空 """

    def is_empty(self):
        if not self.head.val and not self.head.next:
            return True
        return False

    """ 入栈 """

    def push(self, val):
        temp = ListNode(val)
        temp.next = self.head
        self.head = temp

    """ 出栈 """

    def pop(self):
        pop = self.head.val
        self.head = self.head.next
        return pop

    """ 访问栈顶元素 """

    def peek(self):
        return self.head.val

    def to_array(self):
        stack = []
        temp = self.head
        while temp:
            stack.insert(0, temp.val)
            temp = temp.next
        return stack


if __name__ == "__main__":
    """ 初始化栈 """
    stack = LinkedListStack()

    """ 元素入栈 """
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("栈 stack = ", stack.to_array())

    """ 访问栈顶元素 """
    peek = stack.peek()
    print("栈顶元素 peek = ", peek)

    """ 元素出栈 """
    pop = stack.pop()
    print("出栈元素 pop = ", pop)
    print("出栈后 stack = ", stack.to_array())

    """ 获取栈的长度 """
    size = stack.size()
    print("栈的长度 size = ", size)

    """ 判断是否为空 """
    isEmpty = (stack == [])
