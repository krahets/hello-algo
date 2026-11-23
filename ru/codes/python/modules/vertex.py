# File: vertex.py
# Created Time: 2023-02-23
# Author: krahets (krahets@163.com)


class Vertex:
    """Класс вершины"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """На вход подается список значений vals, на выходе возвращается список вершин vets"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """На вход подается список вершин vets, на выходе возвращается список значений vals"""
    return [vet.val for vet in vets]
