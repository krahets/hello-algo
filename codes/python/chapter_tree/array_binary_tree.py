"""
File: array_binary_tree.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


class ArrayBinaryTree:
    """数组表示下的二叉树类"""

    def __init__(self, arr: list[int | None]):
        """构造方法"""
        self._tree = list(arr)

    def size(self):
        """列表容量"""
        return len(self._tree)

    def val(self, i: int) -> int | None:
        """获取索引为 i 节点的值"""
        # 若索引越界，则返回 None ，代表空位
        if i < 0 or i >= self.size():
            return None
        return self._tree[i]

    def left(self, i: int) -> int | None:
        """获取索引为 i 节点的左子节点的索引"""
        return 2 * i + 1

    def right(self, i: int) -> int | None:
        """获取索引为 i 节点的右子节点的索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int | None:
        """获取索引为 i 节点的父节点的索引"""
        return (i - 1) // 2

    def level_order(self) -> list[int]:
        """层序遍历"""
        self.res = []
        # 直接遍历数组
        for i in range(self.size()):
            if self.val(i) is not None:
                self.res.append(self.val(i))
        return self.res

    def dfs(self, i: int, order: str):
        """深度优先遍历"""
        if self.val(i) is None:
            return
        # 前序遍历
        if order == "pre":
            self.res.append(self.val(i))
        self.dfs(self.left(i), order)
        # 中序遍历
        if order == "in":
            self.res.append(self.val(i))
        self.dfs(self.right(i), order)
        # 后序遍历
        if order == "post":
            self.res.append(self.val(i))

    def pre_order(self) -> list[int]:
        """前序遍历"""
        self.res = []
        self.dfs(0, order="pre")
        return self.res

    def in_order(self) -> list[int]:
        """中序遍历"""
        self.res = []
        self.dfs(0, order="in")
        return self.res

    def post_order(self) -> list[int]:
        """后序遍历"""
        self.res = []
        self.dfs(0, order="post")
        return self.res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化二叉树
    # 这里借助了一个从数组直接生成二叉树的函数
    arr = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    root = list_to_tree(arr)
    print("\n初始化二叉树\n")
    print("二叉树的数组表示：")
    print(arr)
    print("二叉树的链表表示：")
    print_tree(root)

    # 数组表示下的二叉树类
    abt = ArrayBinaryTree(arr)

    # 访问节点
    i = 1
    l, r, p = abt.left(i), abt.right(i), abt.parent(i)
    print(f"\n当前节点的索引为 {i} ，值为 {abt.val(i)}")
    print(f"其左子节点的索引为 {l} ，值为 {abt.val(l)}")
    print(f"其右子节点的索引为 {r} ，值为 {abt.val(r)}")
    print(f"其父节点的索引为 {p} ，值为 {abt.val(p)}")

    # 遍历树
    res = abt.level_order()
    print("\n层序遍历为：", res)
    res = abt.pre_order()
    print("前序遍历为：", res)
    res = abt.in_order()
    print("中序遍历为：", res)
    res = abt.post_order()
    print("后序遍历为：", res)
