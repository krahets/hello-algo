/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* 最大ヒープ */
class MaxHeap {
    // リサイズの必要性を避けるため、配列の代わりにリストを使用
    private List<Integer> maxHeap;

    /* コンストラクタ、入力リストに基づいてヒープを構築 */
    public MaxHeap(List<Integer> nums) {
        // すべてのリスト要素をヒープに追加
        maxHeap = new ArrayList<>(nums);
        // 葉を除くすべてのノードをヒープ化
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 左の子ノードのインデックスを取得 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子ノードのインデックスを取得 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    private int parent(int i) {
        return (i - 1) / 2; // 整数除算で切り下げ
    }

    /* 要素を交換 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* ヒープのサイズを取得 */
    public int size() {
        return maxHeap.size();
    }

    /* ヒープが空かどうかを判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* ヒープの先頭要素にアクセス */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 要素をヒープにプッシュ */
    public void push(int val) {
        // ノードを追加
        maxHeap.add(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* ノード i から上向きにヒープ化を開始 */
    private void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(i);
            // 「根ノードを越える」または「ノードが修復不要」の場合、ヒープ化を終了
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2つのノードを交換
            swap(i, p);
            // 上向きにヒープ化をループ
            i = p;
        }
    }

    /* 要素がヒープから退出 */
    public int pop() {
        // 空の処理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根ノードを最も右の葉ノードと交換（最初の要素を最後の要素と交換）
        swap(0, size() - 1);
        // ノードを削除
        int val = maxHeap.remove(size() - 1);
        // 上から下へヒープ化
        siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化を開始 */
    private void siftDown(int i) {
        while (true) {
            // i、l、r の中で最大のノードを決定し、ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大の場合、またはインデックス l、r が範囲外の場合、さらなるヒープ化は不要、終了
            if (ma == i)
                break;
            // 2つのノードを交換
            swap(i, ma);
            // 下向きにヒープ化をループ
            i = ma;
        }
    }

    /* ヒープ（二分木）を出力 */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 最大ヒープを初期化 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nリストを入力してヒープを構築");
        maxHeap.print();

        /* ヒープの先頭要素にアクセス */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの先頭要素は %d\n", peek);

        /* 要素をヒープにプッシュ */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n要素 %d をヒープに追加後\n", val);
        maxHeap.print();

        /* ヒープの先頭要素をポップ */
        peek = maxHeap.pop();
        System.out.format("\n先頭要素 %d をヒープから削除後\n", peek);
        maxHeap.print();

        /* ヒープのサイズを取得 */
        int size = maxHeap.size();
        System.out.format("\nヒープ内の要素数は %d\n", size);

        /* ヒープが空かどうかを判定 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空ですか %b\n", isEmpty);
    }
}