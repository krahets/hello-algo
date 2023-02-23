# File: vertex.py
# Created Time: 2023-02-23
# Author: Krahets (krahets@163.com)

from typing import List

# 顶点类
class Vertex:
    def __init__(self, val: int) -> None:
        self.val = val

# 输入值列表 vals ，返回顶点列表 vets
def vals_to_vets(vals: List[int]) -> List['Vertex']:
    return [Vertex(val) for val in vals]

# 输入顶点列表 vets ，返回值列表 vals
def vets_to_vals(vets: List['Vertex']) -> List[int]:
    return [vet.val for vet in vets]
