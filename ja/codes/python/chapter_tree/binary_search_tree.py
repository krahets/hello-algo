"""
File: binary_search_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class BinarySearchTree:
    """二分探索木"""

    def __init__(self):
        """コンストラクタ"""
        # 空の木を初期化する
        self._root = None

    def get_root(self) -> TreeNode | None:
        """二分木の根を取得する"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """ノードを探索する"""
        cur = self._root
        # ループで探索し、葉を越えたら終了する
        while cur is not None:
            # 目的のノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 目的のノードは cur の左部分木にある
            elif cur.val > num:
                cur = cur.left
            # 目的のノードが見つかったのでループを抜ける
            else:
                break
        return cur

    def insert(self, num: int):
        """ノードを挿入する"""
        # 木が空なら根を初期化する
        if self._root is None:
            self._root = TreeNode(num)
            return
        # ループで探索し、葉を越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 値が重複するノードが見つかったらそのまま戻る
            if cur.val == num:
                return
            pre = cur
            # 挿入位置は cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 挿入位置は cur の左部分木にある
            else:
                cur = cur.left
        # ノードを挿入する
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """ノードを削除する"""
        # 木が空ならすぐに戻る
        if self._root is None:
            return
        # ループで探索し、葉を越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 削除対象のノードが見つかったのでループを抜ける
            if cur.val == num:
                break
            pre = cur
            # 削除対象は cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 削除対象は cur の左部分木にある
            else:
                cur = cur.left
        # 削除対象が見つからなければそのまま戻る
        if cur is None:
            return

        # 子が 0 個または 1 個
        if cur.left is None or cur.right is None:
            # 子が 0 個なら child = null、1 個なら child はその子
            child = cur.left or cur.right
            # ノード cur を削除する
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 削除対象が根なら根を設定し直す
                self._root = child
        # 子が 2 個
        else:
            # 通りがけ順で cur の次に来るノードを取得する
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # ノード tmp を再帰的に削除する
            self.remove(tmp.val)
            # tmp の値で cur の値を上書きする
            cur.val = tmp.val


"""Driver Code"""
if __name__ == "__main__":
    # 二分探索木を初期化する
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
    for num in nums:
        bst.insert(num)
    print("\n初期化した二分木：\n")
    print_tree(bst.get_root())

    # ノードを探索する
    node = bst.search(7)
    print("\n見つかったノードのオブジェクト：{}、値 = {}".format(node, node.val))

    # ノードを挿入する
    bst.insert(16)
    print("\nノード 16 を挿入した後の二分木：\n")
    print_tree(bst.get_root())

    # ノードを削除する
    bst.remove(1)
    print("\nノード 1 を削除した後の二分木：\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nノード 2 を削除した後の二分木：\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nノード 4 を削除した後の二分木：\n")
    print_tree(bst.get_root())
