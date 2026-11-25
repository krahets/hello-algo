"""
File: hashing_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, list_to_linked_list


def hashing_search_array(hmap: dict[int, int], target: int) -> int:
    """ハッシュ探索（配列）"""
    # ハッシュテーブルのキーは目標の要素、値はインデックス
    # このキーがハッシュテーブルになければ -1 を返す
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """ハッシュ探索（連結リスト）"""
    # ハッシュテーブルのキーは目標の要素の値、値はノードオブジェクト
    # このキーがハッシュテーブルになければ None を返す
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # ハッシュ探索（配列）
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # ハッシュテーブルを初期化する
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # キーは要素、値はインデックス
    index: int = hashing_search_array(map0, target)
    print("目標値 3 のインデックス =", index)

    # ハッシュ探索（連結リスト）
    head: ListNode = list_to_linked_list(nums)
    # ハッシュテーブルを初期化する
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # キーはノードの値、値はノード
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("目標値 3 に対応するノードオブジェクトは", node)
