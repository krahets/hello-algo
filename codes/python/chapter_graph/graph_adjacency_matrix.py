"""
File: graph_adjacency_matrix.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

class ImprovedGraphAdjMat:
    def __init__(self, vertices: list[int], edges: list[list[int]]):
        self.vertex_map = {}  # 用于存储顶点值到索引的映射
        self.vertices = []
        self.adj_mat = []
        
        for val in vertices:
            self.add_vertex(val)
        
        for e in edges:
            self.add_edge(e[0], e[1])

    def add_vertex(self, val: int):
        if val in self.vertex_map:
            return  # 如果顶点已存在，直接返回
        
        index = len(self.vertices)
        self.vertex_map[val] = index
        self.vertices.append(val)
        
        # 更新邻接矩阵
        if self.adj_mat:
            for row in self.adj_mat:
                row.append(0)
        self.adj_mat.append([0] * (index + 1))

    def remove_vertex(self, val: int):
        if val not in self.vertex_map:
            return  # 如果顶点不存在，直接返回
        
        index = self.vertex_map[val]
        
        # 更新顶点列表和映射
        self.vertices.pop(index)
        del self.vertex_map[val]
        for v in self.vertices[index:]:
            self.vertex_map[v] -= 1
        
        # 更新邻接矩阵
        self.adj_mat.pop(index)
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, v1: int, v2: int):
        if v1 not in self.vertex_map or v2 not in self.vertex_map:
            raise ValueError("Vertex not found")
        
        i, j = self.vertex_map[v1], self.vertex_map[v2]
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, v1: int, v2: int):
        if v1 not in self.vertex_map or v2 not in self.vertex_map:
            raise ValueError("Vertex not found")
        
        i, j = self.vertex_map[v1], self.vertex_map[v2]
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        print("顶点列表 =", self.vertices)
        print("邻接矩阵 =")
        for row in self.adj_mat:
            print(row)

# 使用示例
graph = ImprovedGraphAdjMat([1, 3, 2, 5, 4], [[1, 3], [1, 5], [3, 2], [2, 5], [2, 4], [5, 4]])
print("\n初始化后，图为")
graph.print()

graph.add_edge(1, 2)
print("\n添加边 1-2 后，图为")
graph.print()

graph.remove_edge(1, 3)
print("\n删除边 1-3 后，图为")
graph.print()

graph.add_vertex(6)
print("\n添加顶点 6 后，图为")
graph.print()

graph.remove_vertex(3)
print("\n删除顶点 3 后，图为")
graph.print()
