# File: vertex.py
# Created Time: 2023-02-23
# Author: krahets (krahets@163.com)


class Vertex:
    """정점 클래스"""

    def __init__(self, val: int):
        self.val = val


def vals_to_vets(vals: list[int]) -> list["Vertex"]:
    """값의 리스트 vals를 입력받아 정점 리스트 vets 반환"""
    return [Vertex(val) for val in vals]


def vets_to_vals(vets: list["Vertex"]) -> list[int]:
    """정점 리스트 vets를 입력받아 값의 리스트 vals 반환"""
    return [vet.val for vet in vets]
