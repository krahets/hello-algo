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
        heap.offer(val); // 要素をヒープに挿入する
        System.out.format("\n要素 %d の挿入後：\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // 根の要素を取り出す
        System.out.format("\n根の要素 %d を取り出した後：\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* ヒープを初期化する */
        // 最小ヒープを初期化する
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n以下は最大ヒープのテスト例");

        /* 要素をヒープに挿入する */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* ヒープの根の要素を取得する */
        int peek = maxHeap.peek();
        System.out.format("\nヒープの根の要素：%d\n", peek);

        /* 根の要素を取り出す */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* ヒープのサイズを取得する */
        int size = maxHeap.size();
        System.out.format("\nヒープの要素数：%d\n", size);

        /* ヒープが空か判定する */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nヒープは空か：%b\n", isEmpty);

        /* 入力リストからヒープを構築する */
        // 時間計算量は O(nlogn) ではなく O(n)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n入力リストから構築した最小ヒープ：");
        PrintUtil.printHeap(minHeap);
    }
}
