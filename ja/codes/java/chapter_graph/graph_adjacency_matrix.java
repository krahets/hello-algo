/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat {
    List<Integer> vertices; // 頂点リスト、要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
    List<List<Integer>> adjMat; // 隣接行列、行と列のインデックスは「頂点インデックス」に対応

    /* コンストラクタ */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 頂点を追加
        for (int val : vertices) {
            addVertex(val);
        }
        // 辺を追加
        // 辺の要素は頂点インデックスを表す
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 頂点数を取得 */
    public int size() {
        return vertices.size();
    }

    /* 頂点を追加 */
    public void addVertex(int val) {
        int n = size();
        // 頂点リストに新しい頂点値を追加
        vertices.add(val);
        // 隣接行列に行を追加
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 隣接行列に列を追加
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 頂点を削除 */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 頂点リストから `index` の頂点を削除
        vertices.remove(index);
        // 隣接行列から `index` の行を削除
        adjMat.remove(index);
        // 隣接行列から `index` の列を削除
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 辺を追加 */
    // パラメータ i、j は頂点要素のインデックスに対応
    public void addEdge(int i, int j) {
        // インデックスの範囲外と等価性を処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 無向グラフでは、隣接行列は主対角線について対称、すなわち (i, j) == (j, i) を満たす
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 辺を削除 */
    // パラメータ i、j は頂点要素のインデックスに対応
    public void removeEdge(int i, int j) {
        // インデックスの範囲外と等価性を処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 隣接行列を出力 */
    public void print() {
        System.out.print("頂点リスト = ");
        System.out.println(vertices);
        System.out.println("隣接行列 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 無向グラフを初期化 */
        // 辺の要素は頂点インデックスを表す
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\n初期化後、グラフは");
        graph.print();

        /* 辺を追加 */
        // 頂点 1、2 のインデックスはそれぞれ 0、2
        graph.addEdge(0, 2);
        System.out.println("\n辺 1-2 を追加後、グラフは");
        graph.print();

        /* 辺を削除 */
        // 頂点 1、3 のインデックスはそれぞれ 0、1
        graph.removeEdge(0, 1);
        System.out.println("\n辺 1-3 を削除後、グラフは");
        graph.print();

        /* 頂点を追加 */
        graph.addVertex(6);
        System.out.println("\n頂点 6 を追加後、グラフは");
        graph.print();

        /* 頂点を削除 */
        // 頂点 3 のインデックスは 1
        graph.removeVertex(1);
        System.out.println("\n頂点 3 を削除後、グラフは");
        graph.print();
    }
}