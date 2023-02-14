/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-02-12
 * Author: Krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;

public class graph_traversal {
    /* 以顶点 vet 为起点，对图 graph 执行广度优先遍历 */
    // 采用 GraphAdjList 表示图，以方便获取指定结点的所有邻接结点
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = new ArrayList<>();
        // 用于记录顶点是否已被访问
        Set<Vertex> visited = new HashSet<>() {{ add(startVet); }};
        // 队列用于实现 BFS
        Queue<Vertex> que = new LinkedList<>() {{ offer(startVet); }};
        // 循环直至访问完所有顶点
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 队首顶点出队
            res.add(vet);            // 访问该顶点
            // 遍历该顶点的所有邻接顶点
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (!visited.contains(adjVet)) {
                    que.offer(adjVet);   // 只入队未访问的顶点
                    visited.add(adjVet); // 标记该顶点已被访问
                }
            }
        }
        // 返回顶点遍历序列
        return res;
    }

    /* 输入值列表 vals ，返回顶点列表 vets */
    static Vertex[] valsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.length];
        for (int i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 输入顶点列表 vets ，返回值列表 vals */
    static List<Integer> vetsToVals(List<Vertex> vets) {
        List<Integer> vals = new ArrayList<>();
        for (Vertex vet : vets) {
            vals.add(vet.val);
        }
        return vals;
    }

    public static void main(String[] args) {
        /* 初始化无向图 */
        Vertex[] v = valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] }, 
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] }};
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初始化后，图为");
        graph.print();

        /* 广度优先遍历 BFS */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n广度优先遍历（BFS）顶点序列为");
        System.out.println(vetsToVals(res));
    }
}
