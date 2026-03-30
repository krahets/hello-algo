/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 双方向連結リストノード */
class ListNode {
    int val; // ノード値
    ListNode next; // 後続ノードへの参照
    ListNode prev; // 前駆ノードへの参照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 双方向連結リストベースの両端キュー */
class LinkedListDeque {
    private ListNode front, rear; // 先頭ノード front、末尾ノード rear
    private int queSize = 0; // 両端キューの長さ

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 両端キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* エンキュー操作 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (isEmpty())
            front = rear = node;
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加
            front.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する
        // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加
            rear.next = node;
            node.prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* キュー末尾にエンキュー */
    public void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // キュー先頭からの取り出し
        if (isFront) {
            val = front.val; // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // 先頭ノードを更新する
        // キュー末尾からの取り出し
        } else {
            val = rear.val; // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // キューの長さを更新
        return val;
    }

    /* キュー先頭からデキュー */
    public int popFirst() {
        return pop(true);
    }

    /* キュー末尾からデキュー */
    public int popLast() {
        return pop(false);
    }

    /* キュー先頭の要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* キュー末尾の要素にアクセス */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 出力用の配列を返す */
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
        /* 両端キューを初期化 */
        LinkedListDeque deque = new LinkedListDeque();
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
