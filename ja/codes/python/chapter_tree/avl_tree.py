"""
File: avl_tree.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree


class AVLTree:
    """AVL木"""

    def __init__(self):
        """コンストラクタ"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """二分木のルートノードを取得"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """ノードの高さを取得"""
        # 空ノードの高さは-1、葉ノードの高さは0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """ノードの高さを更新"""
        # ノードの高さ = 最も高い部分木の高さ + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """バランス因子を取得"""
        # 空ノードのバランス因子は0
        if node is None:
            return 0
        # ノードのバランス因子 = 左部分木の高さ - 右部分木の高さ
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右回転操作"""
        child = node.left
        grand_child = child.right
        # childを中心にnodeを右に回転
        child.right = node
        node.left = grand_child
        # ノードの高さを更新
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木のルートを返す
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左回転操作"""
        child = node.right
        grand_child = child.left
        # childを中心にnodeを左に回転
        child.left = node
        node.right = grand_child
        # ノードの高さを更新
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木のルートを返す
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """回転操作を実行して部分木のバランスを復元"""
        # nodeのバランス因子を取得
        balance_factor = self.balance_factor(node)
        # 左偏り木
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右回転
                return self.right_rotate(node)
            else:
                # 左回転してから右回転
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右偏り木
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左回転
                return self.left_rotate(node)
            else:
                # 右回転してから左回転
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # バランスの取れた木、回転不要、戻る
        return node

    def insert(self, val):
        """ノードを挿入"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """再帰的にノードを挿入（ヘルパーメソッド）"""
        if node is None:
            return TreeNode(val)
        # 1. 挿入位置を見つけてノードを挿入
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複ノードは挿入しない、戻る
            return node
        # ノードの高さを更新
        self.update_height(node)
        # 2. 回転操作を実行して部分木のバランスを復元
        return self.rotate(node)

    def remove(self, val: int):
        """ノードを削除"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """再帰的にノードを削除（ヘルパーメソッド）"""
        if node is None:
            return None
        # 1. ノードを見つけて削除
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子ノード数 = 0、ノードを削除して戻る
                if child is None:
                    return None
                # 子ノード数 = 1、ノードを削除
                else:
                    node = child
            else:
                # 子ノード数 = 2、中順走査の次のノードを削除し、それで現在のノードを置き換え
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # ノードの高さを更新
        self.update_height(node)
        # 2. 回転操作を実行して部分木のバランスを復元
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """ノードを探索"""
        cur = self._root
        # ループで探索、葉ノードを通過した後にブレーク
        while cur is not None:
            # ターゲットノードはcurの右部分木にある
            if cur.val < val:
                cur = cur.right
            # ターゲットノードはcurの左部分木にある
            elif cur.val > val:
                cur = cur.left
            # ターゲットノードを発見、ループをブレーク
            else:
                break
        # ターゲットノードを返す
        return cur


"""ドライバコード"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nノード {} を挿入後、AVL木は".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nノード {} を削除後、AVL木は".format(val))
        print_tree(tree.get_root())

    # 空のAVL木を初期化
    avl_tree = AVLTree()

    # ノードを挿入
    # AVL木がノード挿入後にバランスを維持する様子に注目
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 重複ノードを挿入
    test_insert(avl_tree, 7)

    # ノードを削除
    # AVL木がノード削除後にバランスを維持する様子に注目
    test_remove(avl_tree, 8)  # 次数0のノードを削除
    test_remove(avl_tree, 5)  # 次数1のノードを削除
    test_remove(avl_tree, 4)  # 次数2のノードを削除

    result_node = avl_tree.search(7)
    print("\n発見されたノードオブジェクト: {}、ノードの値 = {}".format(result_node, result_node.val))