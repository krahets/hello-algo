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
        # 空の木を初期化
        self._root = None

    def get_root(self) -> TreeNode | None:
        """二分木のルートノードを取得"""
        return self._root

    def search(self, num: int) -> TreeNode | None:
        """ノードを探索"""
        cur = self._root
        # ループで探索、葉ノードを通過した後にブレーク
        while cur is not None:
            # ターゲットノードはcurの右部分木にある
            if cur.val < num:
                cur = cur.right
            # ターゲットノードはcurの左部分木にある
            elif cur.val > num:
                cur = cur.left
            # ターゲットノードを発見、ループをブレーク
            else:
                break
        return cur

    def insert(self, num: int):
        """ノードを挿入"""
        # 木が空の場合、ルートノードを初期化
        if self._root is None:
            self._root = TreeNode(num)
            return
        # ループで探索、葉ノードを通過した後にブレーク
        cur, pre = self._root, None
        while cur is not None:
            # 重複ノードを発見したため、戻る
            if cur.val == num:
                return
            pre = cur
            # 挿入位置はcurの右部分木にある
            if cur.val < num:
                cur = cur.right
            # 挿入位置はcurの左部分木にある
            else:
                cur = cur.left
        # ノードを挿入
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node

    def remove(self, num: int):
        """ノードを削除"""
        # 木が空の場合、戻る
        if self._root is None:
            return
        # ループで探索、葉ノードを通過した後にブレーク
        cur, pre = self._root, None
        while cur is not None:
            # 削除するノードを発見、ループをブレーク
            if cur.val == num:
                break
            pre = cur
            # 削除するノードはcurの右部分木にある
            if cur.val < num:
                cur = cur.right
            # 削除するノードはcurの左部分木にある
            else:
                cur = cur.left
        # 削除するノードが存在しない場合、戻る
        if cur is None:
            return

        # 子ノード数 = 0 または 1
        if cur.left is None or cur.right is None:
            # 子ノード数 = 0/1の場合、child = null/その子ノード
            child = cur.left or cur.right
            # ノードcurを削除
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 削除されるノードがルートの場合、ルートを再割り当て
                self._root = child
        # 子ノード数 = 2
        else:
            # curの中順走査の次のノードを取得
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 再帰的にノードtmpを削除
            self.remove(tmp.val)
            # curをtmpで置き換え
            cur.val = tmp.val


"""ドライバコード"""
if __name__ == "__main__":
    # 二分探索木を初期化
    bst = BinarySearchTree()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    # 注意：異なる挿入順序により、様々な木構造が生成される可能性がある。この特定のシーケンスは完全二分木を作成する
    for num in nums:
        bst.insert(num)
    print("\n初期化された二分木は\n")
    print_tree(bst.get_root())

    # ノードを探索
    node = bst.search(7)
    print("\n発見されたノードオブジェクト: {}, ノードの値 = {}".format(node, node.val))

    # ノードを挿入
    bst.insert(16)
    print("\nノード16を挿入後の二分木は\n")
    print_tree(bst.get_root())

    # ノードを削除
    bst.remove(1)
    print("\nノード1を削除後の二分木は\n")
    print_tree(bst.get_root())

    bst.remove(2)
    print("\nノード2を削除後の二分木は\n")
    print_tree(bst.get_root())

    bst.remove(4)
    print("\nノード4を削除後の二分木は\n")
    print_tree(bst.get_root())