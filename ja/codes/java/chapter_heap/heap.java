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
        heap.offer(val); // 要素をヒープにプッシュ
        System.out.format("\n要素 %d をヒープに追加後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // ヒープの先頭要素をポップ
        System.out.format("\n先頭要素 %d をヒープから削除後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* ヒープを初期化 */
        // 最小ヒープを初期化
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 最大ヒープを初期化（必要に応じてラムダ式を使用してComparatorを変更）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下のテストケースは最大ヒープ用です");

        /* 要素をヒープにプッシュ */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* ヒープの先頭要素にアクセス */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの先頭要素は %d\n", peek);

        /* ヒープの先頭要素をポップ */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* ヒープのサイズを取得 */
        int size = maxHeap.size();
        System.out.format("\nヒープ内の要素数は %d\n", size);

        /* ヒープが空かどうかを判定 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空ですか %b\n", isEmpty);

        /* リストを入力してヒープを構築 */
        // 時間計算量は O(n)、O(nlogn) ではない
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nリストを入力して最小ヒープを構築");
        PrintUtil.printHeap(minHeap);
    }
}