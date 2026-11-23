# PEP 585「標準コレクションにおける型ヒント用のジェネリクス」に従う
# https://peps.python.org/pep-0585/
from __future__ import annotations

# 共通ライブラリをここで読み込み、`from module import *` によりコードを簡潔にする
from .list_node import (
    ListNode,
    list_to_linked_list,
    linked_list_to_list,
)
from .tree_node import TreeNode, list_to_tree, tree_to_list
from .vertex import Vertex, vals_to_vets, vets_to_vals
from .print_util import (
    print_matrix,
    print_linked_list,
    print_tree,
    print_dict,
    print_heap,
)
