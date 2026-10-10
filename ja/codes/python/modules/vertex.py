# File: vertex.py
# Created Time: 2023-02-23
# Author: krahets (krahets@163.com)


class Vertex:
    """頂点クラス"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """値リスト vals を入力し、頂点リスト vets を返す"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """頂点リスト vets を入力し、値リスト vals を返す"""
    return [vet.val for vet in vets]
