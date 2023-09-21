import sys

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = [[0 for _ in range(vertices)] for _ in range(vertices)]

    def min_distance(self, dist, spt_set):
        min_dist = sys.maxsize
        min_index = -1
        for v in range(self.V):
            if not spt_set[v] and dist[v] < min_dist:
                min_dist = dist[v]
                min_index = v
        return min_index

    def dijkstra(self, src):
        dist = [sys.maxsize] * self.V
        spt_set = [False] * self.V
        dist[src] = 0

        for _ in range(self.V - 1):
            u = self.min_distance(dist, spt_set)
            spt_set[u] = True

            for v in range(self.V):
                if not spt_set[v] and self.graph[u][v] != 0 and dist[u] + self.graph[u][v] < dist[v]:
                    dist[v] = dist[u] + self.graph[u][v]

        self.print_solution(dist)

    def print_solution(self, dist):
        print("顶点   距离")
        for v in range(self.V):
            print(v, "     ", dist[v])

# 创建一个图示例
graph = Graph(6)
graph.graph = [[0, 2, 0, 6, 0, 0],
               [2, 0, 3, 8, 5, 0],
               [0, 3, 0, 0, 7, 0],
               [6, 8, 0, 0, 9, 10],
               [0, 5, 7, 9, 0, 1],
               [0, 0, 0, 10, 1, 0]]

# 从顶点0开始运行Dijkstra算法
graph.dijkstra(0)
