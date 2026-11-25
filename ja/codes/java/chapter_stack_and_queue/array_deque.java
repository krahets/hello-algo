/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列を使った両端キュー */
class ArrayDeque {
    private int[] nums; // 両端キューの要素を格納する配列
    private int front; // 両端キューの先頭要素を指すインデックス
    private int queSize; // 両端キューの要素数

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得する */
    public int capacity() {
        return nums.length;
    }

    /* 両端キューの要素数を取得する */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを求める */
    private int index(int i) {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        return (i + capacity()) % capacity();
    }

    /* 先頭に追加する */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        front = index(front - 1);
        // num を両端キューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾に追加する */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("両端キューが満杯です");
            return;
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        int rear = index(front + queSize);
        // num を両端キューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭から取り出す */
    public int popFirst() {
        int num = peekFirst();
        // 先頭のインデックスを 1 つ進める
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾から取り出す */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 両端キューの先頭要素を参照する */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 両端キューの末尾要素を参照する */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 末尾要素のインデックスを求める
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の配列を返す */
    public int[] toArray() {
        // 両端キューの要素数に当たる範囲だけを変換する
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

        /* 要素を参照する */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素を両端キューに追加する */
        deque.pushLast(4);
        System.out.println("末尾に 4 を追加した後の deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("先頭に 1 を追加した後の deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューから要素を取り出す */
        int popLast = deque.popLast();
        System.out.println("末尾から取り出した要素 = " + popLast + "、末尾から取り出した後の deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("先頭から取り出した要素 = " + popFirst + "、先頭から取り出した後の deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューの要素数を取得する */
        int size = deque.size();
        System.out.println("両端キューの要素数 size = " + size);

        /* 両端キューが空かどうかを判定する */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューは空か = " + isEmpty);
    }
}
