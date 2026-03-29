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
        """二分木の根ノードを取得"""
        return self._root

    def height(self, node: TreeNode | None) -> int:
        """ノードの高さを取得"""
        # 空ノードの高さは -1、葉ノードの高さは 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """ノードの高さを更新する"""
        # ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height = max([self.height(node.left), self.height(node.right)]) + 1

    def balance_factor(self, node: TreeNode | None) -> int:
        """平衡係数を取得"""
        # 空ノードの平衡係数は 0
        if node is None:
            return 0
        # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return self.height(node.left) - self.height(node.right)

    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右回転"""
        child = node.left
        grand_child = child.right
        # child を支点として node を右回転させる
        child.right = node
        node.left = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child

    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左回転"""
        child = node.right
        grand_child = child.left
        # child を支点として node を左回転させる
        child.left = node
        node.right = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child

    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """回転操作を行い、この部分木の平衡を回復する"""
        # ノード node の平衡係数を取得
        balance_factor = self.balance_factor(node)
        # 左に偏った木
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右回転
                return self.right_rotate(node)
            else:
                # 左回転してから右回転
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右に偏った木
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左回転
                return self.left_rotate(node)
            else:
                # 右回転してから左回転
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 平衡木なので回転不要、そのまま返す
        return node

    def insert(self, val):
        """ノードを挿入"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """ノードを再帰的に挿入する（補助メソッド）"""
        if node is None:
            return TreeNode(val)
        # 1. 挿入位置を探索してノードを挿入
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複ノードは挿入せず、そのまま返す
            return node
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作を行い、部分木の平衡を回復する
        return self.rotate(node)

    def remove(self, val: int):
        """ノードを削除"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """ノードを再帰的に削除する（補助メソッド）"""
        if node is None:
            return None
        # 1. ノードを探索して削除
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子ノード数 = 0 の場合、node をそのまま削除して返す
                if child is None:
                    return None
                # 子ノード数 = 1 の場合、node をそのまま削除する
                else:
                    node = child
            else:
                # 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作を行い、部分木の平衡を回復する
        return self.rotate(node)

    def search(self, val: int) -> TreeNode | None:
        """ノードを探索"""
        cur = self._root
        # ループで探索し、葉ノードを越えたら抜ける
        while cur is not None:
            # 目標ノードは cur の右部分木にある
            if cur.val < val:
                cur = cur.right
            # 目標ノードは cur の左部分木にある
            elif cur.val > val:
                cur = cur.left
            # 目標ノードが見つかったらループを抜ける
            else:
                break
        # 目標ノードを返す
        return cur


"""Driver Code"""
if __name__ == "__main__":

    def test_insert(tree: AVLTree, val: int):
        tree.insert(val)
        print("\nノード {} を挿入した後、AVL 木は".format(val))
        print_tree(tree.get_root())

    def test_remove(tree: AVLTree, val: int):
        tree.remove(val)
        print("\nノード {} を削除した後、AVL 木は".format(val))
        print_tree(tree.get_root())

    # 空の AVL 木を初期化する
    avl_tree = AVLTree()

    # ノードを挿入する
    # ノード挿入後に AVL 木がどのように平衡を保つかに注目
    for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]:
        test_insert(avl_tree, val)

    # 重複ノードを挿入する
    test_insert(avl_tree, 7)

    # ノードを削除する
    # ノード削除後に AVL 木がどのように平衡を保つかに注目
    test_remove(avl_tree, 8)  # 次数 0 のノードを削除する
    test_remove(avl_tree, 5)  # 次数 1 のノードを削除する
    test_remove(avl_tree, 4)  # 次数 2 のノードを削除する

    result_node = avl_tree.search(7)
    print("\n見つかったノードオブジェクトは {}、ノードの値 = {}".format(result_node, result_node.val))
