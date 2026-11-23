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
        """二分木の根ノードを取得する"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """ノードを探索する"""
        cur = self._root
        # 繰り返し探索し、葉ノードを越えたら終了する
        while cur is not None:
            # 目的のノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 目的のノードは cur の左部分木にある
            elif cur.val > num:
                cur = cur.left
            # 目的のノードが見つかったので、ループを終了する
            else:
                break
        return cur

    def insert(self, num: int):
        """ノードを挿入する"""
        # 木が空の場合、根ノードを初期化する
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 繰り返し探索し、葉ノードを越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 重複したノードが見つかったので、そのまま戻る
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
        # 木が空の場合、そのまま早期リターンする
        if self._root is None:
            return
        # 繰り返し探索し、葉ノードを越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 削除対象のノードが見つかったので、ループを終了する
            if cur.val == num:
                break
            pre = cur
            # 削除対象のノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 削除対象のノードは cur の左部分木にある
            else:
                cur = cur.left
        # 削除対象のノードが存在しない場合、そのまま戻る
        if cur is None:
            return

        # 子ノード数 = 0 または 1
        if cur.left is None or cur.right is None:
            # 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            child = cur.left or cur.right
            # ノード cur を削除する
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 削除するノードが根ノードの場合、根ノードを指定し直す
                self._root = child
        # 子ノード数 = 2
        else:
            # 通りがけ順で cur の次のノードを取得する
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # ノード tmp を再帰的に削除する
            self.remove(tmp.val)
            # tmp で cur を上書きする
            cur.val = tmp.val


"""実行用コード"""
if __name__ == "__main__":
    # 二分探索木を初期化する
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
    for num in nums:
        bst.insert(num)
    print("\n初期化した二分木\n")
    print_tree(bst.get_root())

    # ノードを探索する
    node = bst.search(7)
    print("\n見つかったノードオブジェクトは: {}、ノードの値 = {}".format(node, node.val))

    # ノードを挿入する
    bst.insert(16)
    print("\nノード 16 を挿入した後の二分木\n")
    print_tree(bst.get_root())

    # ノードを削除する
    bst.remove(1)
    print("\nノード 1 を削除した後の二分木\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nノード 2 を削除した後の二分木\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nノード 4 を削除した後の二分木\n")
    print_tree(bst.get_root())
