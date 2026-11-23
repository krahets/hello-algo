/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列で実装した両端キュー */
class ArrayDeque {
    private int[] nums; // 両端キューの要素を格納する配列
    private int front; // キューの先頭要素を指す先頭ポインタ
    private int queSize; // 両端キューの長さ

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得する */
    public int capacity() {
        return nums.length;
    }

    /* 両端キューの長さを取得する */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを計算する */
    private int index(int i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + capacity()) % capacity();
    }

    /* 先頭にエンキューする */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        front = index(front - 1);
        // num をキューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾にエンキューする */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        int rear = index(front + queSize);
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭からデキューする */
    public int popFirst() {
        int num = peekFirst();
        // 先頭ポインタを後ろに 1 つ移動する
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾からデキューする */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* キューの末尾要素にアクセスする */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 末尾要素のインデックスを計算する
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の配列を返す */
    public int[] toArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* 両端キューを初期化する */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("両端キュー deque = " + Arrays.toString(deque.toArray()));

        /* 要素にアクセスする */
        int peekFirst = deque.peekFirst();
        System.out.println("キューの先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("キューの末尾要素 peekLast = " + peekLast);

        /* 要素をエンキューする */
        deque.pushLast(4);
        System.out.println("要素 4 を末尾にエンキューした後 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("要素 1 を先頭にエンキューした後 deque = " + Arrays.toString(deque.toArray()));

        /* 要素をデキューする */
        int popLast = deque.popLast();
        System.out.println("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューの長さを取得する */
        int size = deque.size();
        System.out.println("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定する */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューは空か = " + isEmpty);
    }
}
