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
    // 配列ではなくリストを使うことで、拡張を考慮する必要がない
    private List<Integer> maxHeap;

    /* コンストラクタ。入力リストに基づいてヒープを構築する */
    public MaxHeap(List<Integer> nums) {
        // リスト要素をそのままヒープに追加
        maxHeap = new ArrayList<>(nums);
        // 葉ノード以外のすべてのノードをヒープ化
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 左子ノードのインデックスを取得 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    private int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
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

    /* ヒープ先頭要素にアクセス */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 要素をヒープに追加 */
    public void push(int val) {
        // ノードを追加
        maxHeap.add(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    private void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2 つのノードを交換
            swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }

    /* 要素をヒープから取り出す */
    public int pop() {
        // 空判定の処理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1);
        // ノードを削除
        int val = maxHeap.remove(size() - 1);
        // 上から下へヒープ化
        siftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    private void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i)
                break;
            // 2 つのノードを交換
            swap(i, ma);
            // ループで上から下へヒープ化
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
        System.out.println("\nリストを入力してヒープを構築した後");
        maxHeap.print();

        /* ヒープ頂点の要素を取得 */
        int peek = maxHeap.peek();
        System.out.format("\nヒープトップ要素は %d\n", peek);

        /* 要素をヒープに追加 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n要素 %d をヒープに追加した後\n", val);
        maxHeap.print();

        /* ヒープ頂点の要素を取り出す */
        peek = maxHeap.pop();
        System.out.format("\nヒープトップ要素 %d を取り出した後\n", peek);
        maxHeap.print();

        /* ヒープのサイズを取得 */
        int size = maxHeap.size();
        System.out.format("\nヒープ内の要素数は %d\n", size);

        /* ヒープが空かどうかを判定 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープが空かどうかは %b\n", isEmpty);
    }
}
