/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
class GraphAdjList {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    Map<Vertex, List<Vertex>> adjList;

    /* 생성자 */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // 모든 정점과 간선을 추가한다
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 정점 개수 반환 */
    public int size() {
        return adjList.size();
    }

    /* 간선 추가 */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 간선 vet1 - vet2를 추가한다
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* 간선 삭제 */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 간선 vet1 - vet2를 삭제한다
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* 정점 추가 */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // 인접 리스트에 새 연결 리스트를 추가한다
        adjList.put(vet, new ArrayList<>());
    }

    /* 정점 삭제 */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        adjList.remove(vet);
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* 인접 리스트 출력 */
    public void print() {
        System.out.println("인접 리스트 =");
        for (Map.Entry<Vertex, List<Vertex>> pair : adjList.entrySet()) {
            List<Integer> tmp = new ArrayList<>();
            for (Vertex vertex : pair.getValue())
                tmp.add(vertex.val);
            System.out.println(pair.getKey().val + ": " + tmp + ",");
        }
    }
}

public class graph_adjacency_list {
    public static void main(String[] args) {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n초기화한 후의 그래프");
        graph.print();

        /* 간선 추가 */
        // 정점 1, 2는 각각 v[0], v[2]이다
        graph.addEdge(v[0], v[2]);
        System.out.println("\n간선 1-2를 추가한 후의 그래프");
        graph.print();

        /* 간선 삭제 */
        // 정점 1, 3은 각각 v[0], v[1]이다
        graph.removeEdge(v[0], v[1]);
        System.out.println("\n간선 1-3을 삭제한 후의 그래프");
        graph.print();

        /* 정점 추가 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\n정점 6을 추가한 후의 그래프");
        graph.print();

        /* 정점 삭제 */
        // 정점 3은 v[1]이다
        graph.removeVertex(v[1]);
        System.out.println("\n정점 3을 삭제한 후의 그래프");
        graph.print();
    }
}
