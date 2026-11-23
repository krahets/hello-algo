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
    // 配列ではなくリストを使うため、容量の拡張を考慮する必要がない
    private List<Integer> maxHeap;

    /* コンストラクタ：入力リストからヒープを構築する */
    public MaxHeap(List<Integer> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new ArrayList<>(nums);
        // 葉ノード以外の全ノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 左の子のインデックスを取得 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    private int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }

    /* 要素を交換する */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* ヒープのサイズを取得する */
    public int size() {
        return maxHeap.size();
    }

    /* ヒープが空か判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* ヒープの先頭要素にアクセスする */
    public int peek() {
        return maxHeap.get(0);
    }

    /* ヒープに要素を挿入する */
    public void push(int val) {
        // ノードを追加する
        maxHeap.add(val);
        // 下から上へヒープ化する
        siftUp(size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    private void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2 つのノードを交換する
            swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }

    /* ヒープから要素を取り出す */
    public int pop() {
        // 空かどうかを確認する
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1);
        // ノードを削除する
        int val = maxHeap.remove(size() - 1);
        // 上から下へヒープ化する
        siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    private void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i)
                break;
            // 2 つのノードを交換する
            swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープ（二分木）を表示する */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 最大ヒープを初期化する */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nリストを入力してヒープを構築した後");
        maxHeap.print();

        /* ヒープの先頭要素を取得する */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの先頭要素は %d\n", peek);

        /* ヒープに要素を挿入する */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n要素 %d をヒープに挿入した後\n", val);
        maxHeap.print();

        /* ヒープの先頭要素を取り出す */
        peek = maxHeap.pop();
        System.out.format("\nヒープの先頭要素 %d を取り出した後\n", peek);
        maxHeap.print();

        /* ヒープのサイズを取得する */
        int size = maxHeap.size();
        System.out.format("\nヒープの要素数は %d\n", size);

        /* ヒープが空か判定 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空か %b\n", isEmpty);
    }
}
