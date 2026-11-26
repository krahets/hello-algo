/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 連結リストを使ったキュー */
class LinkedListQueue {
    private ListNode front, rear; // front は先頭ノード、rear は末尾ノードを指す
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの要素数を取得する */
    public int size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* エンキューする */
    public void push(int num) {
        // 値が num のノードを末尾ノードの後ろに追加する
        ListNode node = new ListNode(num);
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node;
            rear = node;
        // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキューする */
    public int pop() {
        int num = peek();
        // 先頭ノードを削除する
        front = front.next;
        queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 連結リストを配列に変換して返す */
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

public class linkedlist_queue {
    public static void main(String[] args) {
        /* キューを初期化する */
        LinkedListQueue queue = new LinkedListQueue();

        /* 要素をキューに追加する */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* キューの先頭要素を参照する */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.pop();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後の queue = " + Arrays.toString(queue.toArray()));

        /* キューの要素数を取得する */
        int size = queue.size();
        System.out.println("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);
    }
}
