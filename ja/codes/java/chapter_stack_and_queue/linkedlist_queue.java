/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 連結リストに基づくキュークラス */
class LinkedListQueue {
    private ListNode front, rear; // 先頭ノード front、末尾ノード rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* エンキュー */
    public void push(int num) {
        // 末尾ノードの後ろに num を追加
        ListNode node = new ListNode(num);
        // キューが空の場合、先頭と末尾ノードの両方をそのノードにポイント
        if (front == null) {
            front = node;
            rear = node;
        // キューが空でない場合、そのノードを末尾ノードの後ろに追加
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    public int pop() {
        int num = peek();
        // 先頭ノードを削除
        front = front.next;
        queSize--;
        return num;
    }

    /* 先頭要素にアクセス */
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
        /* キューを初期化 */
        LinkedListQueue queue = new LinkedListQueue();

        /* 要素をエンキュー */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* 先頭要素にアクセス */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.pop();
        System.out.println("デキューした要素 = " + pop + "、デキュー後 " + Arrays.toString(queue.toArray()));

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューが空か = " + isEmpty);
    }
}