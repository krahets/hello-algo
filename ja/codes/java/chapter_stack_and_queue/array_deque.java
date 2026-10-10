/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列ベースの両端キュー */
class ArrayDeque {
    private int[] nums; // 両端キューの要素を格納する配列
    private int front; // 先頭ポインタ。先頭要素を指す
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

    /* 循環配列のインデックスを計算 */
    private int index(int i) {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + capacity()) % capacity();
    }

    /* キュー先頭にエンキュー */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("双方向キューは満杯です");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        front = index(front - 1);
        // num をキュー先頭に追加
        nums[front] = num;
        queSize++;
    }

    /* キュー末尾にエンキュー */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("双方向キューは満杯です");
            return;
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        int rear = index(front + queSize);
        // num をキュー末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* キュー先頭からデキュー */
    public int popFirst() {
        int num = peekFirst();
        // 先頭ポインタを 1 つ後ろへ進める
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* キュー末尾からデキュー */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* キュー末尾の要素にアクセス */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 末尾要素のインデックスを計算
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 出力用の配列を返す */
    public int[] toArray() {
        // 有効長の範囲内のリスト要素のみを変換
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
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("双方向キュー deque = " + Arrays.toString(deque.toArray()));

        /* 要素にアクセス */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素をエンキュー */
        deque.pushLast(4);
        System.out.println("要素 4 を末尾にエンキューした後の deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("要素 1 を先頭にエンキューした後の deque = " + Arrays.toString(deque.toArray()));

        /* 要素をデキュー */
        int popLast = deque.popLast();
        System.out.println("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後の deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後の deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューの長さを取得 */
        int size = deque.size();
        System.out.println("双方向キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双方向キューが空かどうか = " + isEmpty);
    }
}
