"""
File: linked_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, print_linked_list


def insert(n0: ListNode, P: ListNode):
    """連結リストのノード n0 の直後にノード P を挿入する"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """連結リストのノード n0 の直後のノードを削除する"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """連結リストのインデックス index にあるノードにアクセスする"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """連結リストから値が target である最初のノードを探索する"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""実行用コード"""
if __name__ == "__main__":
    # 連結リストを初期化する
    # 各ノードを初期化する
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # ノード間の参照を設定する
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("初期化した連結リスト")
    print_linked_list(n0)

    # ノードを挿入する
    p = ListNode(0)
    insert(n0, p)
    print("ノードを挿入した後の連結リスト")
    print_linked_list(n0)

    # ノードを削除する
    remove(n0)
    print("ノードを削除した後の連結リスト")
    print_linked_list(n0)

    # ノードにアクセスする
    node: ListNode = access(n0, 3)
    print("連結リストのインデックス 3 にあるノードの値 = {}".format(node.val))

    # ノードを探索する
    index: int = find(n0, 2)
    print("連結リスト内で値が 2 であるノードのインデックス = {}".format(index))
