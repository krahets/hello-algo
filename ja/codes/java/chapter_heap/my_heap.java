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
    // 配列の代わりにリストを使えば、容量の拡張を自分で扱う必要がない
    private List<Integer> maxHeap;

    /* 入力リストからヒープを構築するコンストラクタ */
    public MaxHeap(List<Integer> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new ArrayList<>(nums);
        // 葉以外のすべてのノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 左の子のインデックスを取得する */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得する */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得する */
    private int parent(int i) {
        return (i - 1) / 2; // 商を 0 方向に丸める
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

    /* ヒープが空か判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* ヒープの根の要素を参照する */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 要素をヒープに挿入する */
    public void push(int val) {
        // ノードを追加する
        maxHeap.add(val);
        // 上に向かってヒープ化する
        siftUp(size() - 1);
    }

    /* ノード i から上に向かってヒープ化する */
    private void siftUp(int i) {
        while (true) {
            // ノード i の親を取得する
            int p = parent(i);
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2 つのノードを交換する
            swap(i, p);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* 根の要素をヒープから取り出す */
    public int pop() {
        // 空の場合の処理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        swap(0, size() - 1);
        // ノードを削除する
        int val = maxHeap.remove(size() - 1);
        // 下に向かってヒープ化する
        siftDown(0);
        // 根の要素を返す
        return val;
    }

    /* ノード i から下に向かってヒープ化する */
    private void siftDown(int i) {
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if (ma == i)
                break;
            // 2 つのノードを交換する
            swap(i, ma);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープを二分木として表示する */
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
        System.out.println("\n入力リストから構築したヒープ：");
        maxHeap.print();

        /* ヒープの根の要素を取得する */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの根の要素：%d\n", peek);

        /* 要素をヒープに挿入する */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n要素 %d の挿入後：\n", val);
        maxHeap.print();

        /* 根の要素を取り出す */
        peek = maxHeap.pop();
        System.out.format("\n根の要素 %d を取り出した後：\n", peek);
        maxHeap.print();

        /* ヒープのサイズを取得する */
        int size = maxHeap.size();
        System.out.format("\nヒープの要素数：%d\n", size);

        /* ヒープが空か判定する */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空か：%b\n", isEmpty);
    }
}
