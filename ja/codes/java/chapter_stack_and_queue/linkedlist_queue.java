/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 連結リストで実装したキュー */
class LinkedListQueue {
    private ListNode front, rear; // 先頭ノード front 、末尾ノード rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* キューが空か判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* エンキュー */
    public void push(int num) {
        // 末尾ノードの後ろに num を追加する
        ListNode node = new ListNode(num);
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node;
            rear = node;
        // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    public int pop() {
        int num = peek();
        // 先頭ノードを削除する
        front = front.next;
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 連結リストを Array に変換して返す */
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

        /* 要素をエンキューする */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* キューの先頭要素にアクセス */
        int peek = queue.peek();
        System.out.println("キューの先頭要素 peek = " + peek);

        /* 要素をデキューする */
        int pop = queue.pop();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後 queue = " + Arrays.toString(queue.toArray()));

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空か判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);
    }
}
