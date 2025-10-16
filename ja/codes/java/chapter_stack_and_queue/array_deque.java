/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列に基づく両端キュークラス */
class ArrayDeque {
    private int[] nums; // 両端キューの要素を格納する配列
    private int front; // 先頭ポインタ、先頭要素を指す
    private int queSize; // 両端キューの長さ

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得 */
    public int capacity() {
        return nums.length;
    }

    /* 両端キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 循環配列インデックスを計算 */
    private int index(int i) {
        // モジュロ演算により循環配列を実装
        // i が配列の末尾を超える場合、先頭に戻る
        // i が配列の先頭を超える場合、末尾に戻る
        return (i + capacity()) % capacity();
    }

    /* 先頭エンキュー */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 先頭ポインタを左に移動し、境界を越える場合は配列の末尾に回る
        front = index(front - 1);
        // 先頭に num を追加
        nums[front] = num;
        queSize++;
    }

    /* 末尾エンキュー */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 末尾ポインタを計算し、末尾に要素を追加
        int rear = index(front + queSize);
        nums[rear] = num;
        queSize++;
    }

    /* 先頭デキュー */
    public int popFirst() {
        int num = peekFirst();
        // 先頭ポインタを右に移動
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾デキュー */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 先頭要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 末尾要素にアクセス */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 末尾要素のインデックスを計算
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 配列を返す */
    public int[] toArray() {
        // front から開始して queSize 個の要素のみをコピー
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* 両端キューを初期化 */
        int capacity = 10;
        ArrayDeque deque = new ArrayDeque(capacity);

        /* 末尾エンキュー */
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("末尾エンキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 先頭エンキュー */
        deque.pushFirst(4);
        deque.pushFirst(1);
        System.out.println("先頭エンキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 要素へのアクセス */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素デキュー */
        int popFirst = deque.popFirst();
        System.out.println("先頭デキュー要素 = " + popFirst + "、先頭デキュー後 deque = " + Arrays.toString(deque.toArray()));
        int popLast = deque.popLast();
        System.out.println("末尾デキュー要素 = " + popLast + "、末尾デキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューの長さを取得 */
        int size = deque.size();
        System.out.println("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューが空か = " + isEmpty);
    }
}