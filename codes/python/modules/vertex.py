# File: vertex.py
# Created Time: 2023-02-23
# Author: Krahets (krahets@163.com)


class Vertex:
    """顶点类"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """输入值列表 vals ，返回顶点列表 vets"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """输入顶点列表 vets ，返回值列表 vals"""
    return [vet.val for vet in vets]
