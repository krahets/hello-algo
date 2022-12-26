"""
File: binary_tree_bfs.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

from codes.python.include import *

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))

# from include import *
def levelOrder(root: [TreeNode]) -> list[list[int]]:

    res = []
    if not root:
        return res
    from collections import deque
    q = deque([root])
    while q:
        list = []
        size = len(q)
        for _ in range(size):
            cur = q.popleft()
            list.append(cur.val)
            if cur.left:
                q.append(cur.left)
            if cur.right:
                q.append(cur.right)
        res.append(list)
    return res


""" Driver Code """

if __name__ == '__main__':
    arr = [3, 9, 20, None, None, 15, 7]
    root = list_to_tree(arr)
    list = levelOrder(root)
    print(list)