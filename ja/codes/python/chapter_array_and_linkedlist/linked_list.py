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
    """連結リストでノード n0 の後ろにノード P を挿入する"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """連結リストでノード n0 の直後のノードを削除する"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """連結リスト内で index 番目のノードにアクセス"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """連結リストで値が target の最初のノードを探す"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # 連結リストを初期化する
    # 各ノードを初期化する
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # ノード間の参照を構築する
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("初期化した連結リストは")
    print_linked_list(n0)

    # ノードを挿入
    p = ListNode(0)
    insert(n0, p)
    print("ノード挿入後の連結リストは")
    print_linked_list(n0)

    # ノードを削除
    remove(n0)
    print("ノード削除後の連結リストは")
    print_linked_list(n0)

    # ノードにアクセス
    node: ListNode = access(n0, 3)
    print("連結リストのインデックス 3 のノードの値 = {}".format(node.val))

    # ノードを探索
    index: int = find(n0, 2)
    print("連結リスト内で値が 2 のノードのインデックス = {}".format(index))
