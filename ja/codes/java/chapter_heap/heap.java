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
        heap.offer(val); // 要素をヒープに追加
        System.out.format("\n要素 %d をヒープに追加した後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // ヒープ頂点の要素を取り出す
        System.out.format("\nヒープトップ要素 %d を取り出した後\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* ヒープを初期化 */
        // 最小ヒープを初期化
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 最大ヒープを初期化する（lambda 式で Comparator を変更すればよい）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下のテストケースは最大ヒープ");

        /* 要素をヒープに追加 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* ヒープ頂点の要素を取得 */
        int peek = maxHeap.peek();
        System.out.format("\nヒープトップ要素は %d\n", peek);

        /* ヒープ頂点の要素を取り出す */
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
        System.out.format("\nヒープが空かどうかは %b\n", isEmpty);

        /* リストを入力してヒープを構築 */
        // 時間計算量は O(n) であり、O(nlogn) ではない
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nリストを入力して最小ヒープを構築した後");
        PrintUtil.printHeap(minHeap);
    }
}
