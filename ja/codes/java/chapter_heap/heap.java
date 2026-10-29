/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        heap.offer(val); // ヒープに要素を挿入する
        System.out.format("\n要素 %d をヒープに挿入した後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // ヒープの先頭要素を取り出す
        System.out.format("\nヒープの先頭要素 %d を取り出した後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* ヒープを初期化する */
        // 最小ヒープを初期化する
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下のテストケースは最大ヒープを対象とする");

        /* ヒープに要素を挿入する */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* ヒープの先頭要素を取得する */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの先頭要素は %d\n", peek);

        /* ヒープの先頭要素を取り出す */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* ヒープのサイズを取得する */
        int size = maxHeap.size();
        System.out.format("\nヒープの要素数は %d\n", size);

        /* ヒープが空か判定 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空か %b\n", isEmpty);

        /* リストを入力してヒープを構築する */
        // 時間計算量は O(n) であり、O(nlogn) ではない
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nリストを入力して最小ヒープを構築した後");
        PrintUtil.printHeap(minHeap);
    }
}
