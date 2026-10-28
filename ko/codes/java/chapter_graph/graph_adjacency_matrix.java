/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
    List<Integer> vertices; // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    List<List<Integer>> adjMat; // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

    /* 생성자 */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 정점 추가
        for (int val : vertices) {
            addVertex(val);
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 정점 개수 반환 */
    public int size() {
        return vertices.size();
    }

    /* 정점 추가 */
    public void addVertex(int val) {
        int n = size();
        // 정점 리스트에 새 정점의 값을 추가한다
        vertices.add(val);
        // 인접 행렬에 행 하나를 추가한다
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 인접 행렬에 열 하나를 추가한다
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 정점 삭제 */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        vertices.remove(index);
        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        adjMat.remove(index);
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    public void addEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    public void removeEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 인접 행렬 출력 */
    public void print() {
        System.out.print("정점 리스트 = ");
        System.out.println(vertices);
        System.out.println("인접 행렬 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 무방향 그래프 초기화 */
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\n초기화한 후의 그래프");
        graph.print();

        /* 간선 추가 */
        // 정점 1, 2의 인덱스는 각각 0, 2이다
        graph.addEdge(0, 2);
        System.out.println("\n간선 1-2를 추가한 후의 그래프");
        graph.print();

        /* 간선 삭제 */
        // 정점 1, 3의 인덱스는 각각 0, 1이다
        graph.removeEdge(0, 1);
        System.out.println("\n간선 1-3을 삭제한 후의 그래프");
        graph.print();

        /* 정점 추가 */
        graph.addVertex(6);
        System.out.println("\n정점 6을 추가한 후의 그래프");
        graph.print();

        /* 정점 삭제 */
        // 정점 3의 인덱스는 1이다
        graph.removeVertex(1);
        System.out.println("\n정점 3을 삭제한 후의 그래프");
        graph.print();
    }
}
