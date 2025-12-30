# File: vertex.py
# Created Time: 2023-02-23
# Author: krahets (krahets@163.com)


class Vertex:
    """Vertex class"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """Input value list vals, return vertex list vets"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """Input vertex list vets, return value list vals"""
    return [vet.val for vet in vets]
