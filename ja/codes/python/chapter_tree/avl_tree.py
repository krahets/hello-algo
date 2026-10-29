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
    """AVL 木"""

    def __init__(self):
        """コンストラクタ"""
        self._root = None

    def get_root(self) -> TreeNode | None:
        """二分木の根ノードを取得する"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """ノードの高さを取得する"""
        # 空ノードの高さは -1 、葉ノードの高さは 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """ノードの高さを更新する"""
        # ノードの高さは、最も高い部分木の高さ + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """平衡係数を取得する"""
        # 空ノードの平衡係数は 0
        if node is None:
            return 0
        # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右回転操作"""
        child = node.left
        grand_child = child.right
        # child を中心に node を右回転する
        child.right = node
        node.left = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左回転操作"""
        child = node.right
        grand_child = child.left
        # child を中心に node を左回転する
        child.left = node
        node.right = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """回転操作によって、この部分木の平衡を回復する"""
        # ノード node の平衡係数を取得する
        balance_factor = self.balance_factor(node)
        # 左に偏った木
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右回転
                return self.right_rotate(node)
            else:
                # 左回転してから右回転する
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右に偏った木
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左回転
                return self.left_rotate(node)
            else:
                # 右回転してから左回転する
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 平衡な木なので、回転せずにそのまま返す
        return node

    def insert(self, val):
        """ノードを挿入する"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """ノードを再帰的に挿入する（補助メソッド）"""
        if node is None:
            return TreeNode(val)
        # 1. 挿入位置を探してノードを挿入する
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複したノードは挿入せず、そのまま戻る
            return node
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作によって、この部分木の平衡を回復する
        return self.rotate(node)

    def remove(self, val: int):
        """ノードを削除する"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """ノードを再帰的に削除する（補助メソッド）"""
        if node is None:
            return None
        # 1. ノードを探して削除する
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子ノード数 = 0 の場合、node を削除して戻る
                if child is None:
                    return None
                # 子ノード数 = 1 の場合、node を削除する
                else:
                    node = child
            else:
                # 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作によって、この部分木の平衡を回復する
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """ノードを探索する"""
        cur = self._root
        # 繰り返し探索し、葉ノードを越えたら終了する
        while cur is not None:
            # 目的のノードは cur の右部分木にある
            if cur.val < val:
                cur = cur.right
            # 目的のノードは cur の左部分木にある
            elif cur.val > val:
                cur = cur.left
            # 目的のノードが見つかったので、ループを終了する
            else:
                break
        # 目的のノードを返す
        return cur


"""実行用コード"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nノード {} を挿入した後の AVL 木".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nノード {} を削除した後の AVL 木".format(val))
        print_tree(tree.get_root())

    # 空の AVL 木を初期化する
    avl_tree = AVLTree()

    # ノードを挿入する
    # ノード挿入後、AVL 木がどのように平衡を保つかに注目する
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 重複したノードを挿入する
    test_insert(avl_tree, 7)

    # ノードを削除する
    # ノード削除後、AVL 木がどのように平衡を保つかに注目する
    test_remove(avl_tree, 8)  # 次数 0 のノードを削除する
    test_remove(avl_tree, 5)  # 次数 1 のノードを削除する
    test_remove(avl_tree, 4)  # 次数 2 のノードを削除する

    result_node = avl_tree.search(7)
    print("\n見つかったノードオブジェクトは {}、ノードの値 = {}".format(result_node, result_node.val))
