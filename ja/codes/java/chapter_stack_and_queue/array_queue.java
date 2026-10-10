/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列ベースのキュー */
class ArrayQueue {
    private int[] nums; // キュー要素を格納する配列
    private int front; // 先頭ポインタ。先頭要素を指す
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
            System.out.println("キューは満杯です");
            return;
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        int rear = (front + queSize) % capacity();
        // num をキュー末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    public int pop() {
        int num = peek();
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 配列を返す */
    public int[] toArray() {
        // 有効長の範囲内のリスト要素のみを変換
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

        /* キュー先頭の要素にアクセス */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.pop();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後の queue = " + Arrays.toString(queue.toArray()));

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューが空かどうか = " + isEmpty);

        /* 循環配列をテストする */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " ラウンドのエンキュー + デキュー後の queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
