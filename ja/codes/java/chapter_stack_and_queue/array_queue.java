/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 配列に基づくキュークラス */
class ArrayQueue {
    private int[] nums; // 要素を格納する配列
    private int front; // キューヘッドポインタ、最初の要素を指す
    private int queSize; // キューの長さ

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得 */
    public int capacity() {
        return nums.length;
    }

    /* キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("キューが満杯です");
            return;
        }
        // リアポインタを計算：front + queSize
        // モジュロ操作により rear が配列の長さを超えることを回避
        int rear = (front + queSize) % capacity();
        // 要素をキューリアに追加
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    public int pop() {
        int num = peek();
        // キューヘッドポインタを後ろに1つ移動、モジュロ操作により範囲を超えることを回避
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* キューヘッド要素にアクセス */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 配列を返す */
    public int[] toArray() {
        // front から開始して queSize 個の要素のみをコピー
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* キューを初期化 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 要素をエンキュー */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* キューヘッド要素にアクセス */
        int peek = queue.peek();
        System.out.println("キューヘッド要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.pop();
        System.out.println("デキューした要素 = " + pop + "、デキュー後 " + Arrays.toString(queue.toArray()));

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* 空かどうかを判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューが空か = " + isEmpty);

        /* 連続エンキューのテスト */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
        }
        System.out.println("連続エンキュー後 queue = " + Arrays.toString(queue.toArray()));
    }
}