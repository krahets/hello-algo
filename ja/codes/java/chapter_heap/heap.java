/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void main(String[] args) {
        // [region]{init}
        /* ヒープを初期化する */
        // 最小ヒープを初期化する
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\n以下のテストケースは最大ヒープを対象とする");

        // [region]{push}
        /* ヒープに要素を挿入する */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* ヒープの先頭要素を取得する */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\nヒープの先頭要素は %d\n", peek);

        // [region]{pop_1}
        /* ヒープの先頭要素を取り出す */
        // 取り出した要素は降順の列を形成する
        peek = maxHeap.poll(); // 5
        // [endregion]{pop_1}
        System.out.format("ヒープから取り出した要素は %d\n", peek);
        // [region]{pop_2}
        peek = maxHeap.poll(); // 4
        // [endregion]{pop_2}
        System.out.format("ヒープから取り出した要素は %d\n", peek);
        // [region]{pop_3}
        peek = maxHeap.poll(); // 3
        // [endregion]{pop_3}
        System.out.format("ヒープから取り出した要素は %d\n", peek);
        // [region]{pop_4}
        peek = maxHeap.poll(); // 2
        // [endregion]{pop_4}
        System.out.format("ヒープから取り出した要素は %d\n", peek);
        // [region]{pop_5}
        peek = maxHeap.poll(); // 1
        // [endregion]{pop_5}
        System.out.format("ヒープから取り出した要素は %d\n", peek);

        // [region]{size}
        /* ヒープのサイズを取得する */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\nヒープの要素数は %d\n", size);

        // [region]{is_empty}
        /* ヒープが空か判定 */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\nヒープは空か %b\n", isEmpty);

        // [region]{heapify}
        /* リストを入力してヒープを構築する */
        // 時間計算量は O(n) であり、O(nlogn) ではない
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\nリストを入力して最小ヒープを構築した後");
        PrintUtil.printHeap(minHeap);
    }
}
