# File: vertex.py
# Created Time: 2023-02-23
# Author: krahets (krahets@163.com)


class Vertex:
    """頂点クラス"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """値のリストvalsを入力し、頂点のリストvetsを返す"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """頂点のリストvetsを入力し、値のリストvalsを返す"""
    return [vet.val for vet in vets]