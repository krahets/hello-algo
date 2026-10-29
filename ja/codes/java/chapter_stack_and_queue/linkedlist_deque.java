/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 双方向連結リストのノード */
class ListNode {
    int val; // ノードの値
    ListNode next; // 後続ノードへの参照
    ListNode prev; // 前のノードへの参照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 双方向連結リストで実装した両端キュー */
class LinkedListDeque {
    private ListNode front, rear; // 先頭ノード front 、末尾ノード rear
    private int queSize = 0; // 両端キューの長さ

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 両端キューの長さを取得する */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* エンキュー操作 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (isEmpty())
            front = rear = node;
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加する
            front.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する
        // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加する
            rear.next = node;
            node.prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾にエンキューする */
    public void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // 先頭からのデキュー操作
        else if (isFront) {
            val = front.val; // 先頭ノードの値を一時保存する
            // 先頭ノードを削除する
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // 先頭ノードを更新する
        // 末尾からのデキュー操作
        } else {
            val = rear.val; // 末尾ノードの値を一時保存する
            // 末尾ノードを削除する
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // キューの長さを更新する
        return val;
    }

    /* 先頭からデキューする */
    public int popFirst() {
        return pop(true);
    }

    /* 末尾からデキューする */
    public int popLast() {
        return pop(false);
    }

    /* キューの先頭要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* キューの末尾要素にアクセスする */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 表示用の配列を返す */
    public int[] toArray() {
        ListNode node = front;
        int[] res = new int[size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_deque {
    public static void main(String[] args) {
        /* 両端キューを初期化する */
        LinkedListDeque deque = new LinkedListDeque();
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
