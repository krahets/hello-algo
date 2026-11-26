# Следуем PEP 585 об обобщённых типах в аннотациях стандартных коллекций
# https://peps.python.org/pep-0585/
from __future__ import annotations

# Импортируем здесь общие библиотеки, чтобы упростить код с помощью `from module import *`
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
