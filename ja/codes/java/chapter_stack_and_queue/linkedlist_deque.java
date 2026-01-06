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
    ListNode prev; // 前任ノードへの参照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 双方向連結リストに基づく両端キュークラス */
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
        // リストが空の場合、front と rear の両方を node に指す
        if (isEmpty())
            front = rear = node;
        // 先頭エンキュー操作
        else if (isFront) {
            // node をリストの先頭に追加
            front.prev = node;
            node.next = front;
            front = node; // front を更新
        // 末尾エンキュー操作
        } else {
            // node をリストの末尾に追加
            rear.next = node;
            node.prev = rear;
            rear = node; // rear を更新
        }
        queSize++; // 長さを更新
    }

    /* 先頭エンキュー */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾エンキュー */
    public void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 先頭デキュー操作
        if (isFront) {
            val = front.val; // 一時的に先頭ノード値を保存
            // 次のノードを削除
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // front を更新
        // 末尾デキュー操作
        } else {
            val = rear.val; // 一時的に末尾ノード値を保存
            // 前のノードを削除
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev; // rear を更新
        }
        queSize--; // 長さを更新
        return val;
    }

    /* 先頭デキュー */
    public int popFirst() {
        return pop(true);
    }

    /* 末尾デキュー */
    public int popLast() {
        return pop(false);
    }

    /* 先頭要素にアクセス */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 末尾要素にアクセス */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 配列を返す */
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

        /* 末尾エンキュー */
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("末尾エンキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 先頭エンキュー */
        deque.pushFirst(4);
        deque.pushFirst(1);
        System.out.println("先頭エンキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 要素へのアクセス */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素デキュー */
        int popFirst = deque.popFirst();
        System.out.println("先頭デキュー要素 = " + popFirst + "、先頭デキュー後 deque = " + Arrays.toString(deque.toArray()));
        int popLast = deque.popLast();
        System.out.println("末尾デキュー要素 = " + popLast + "、末尾デキュー後 deque = " + Arrays.toString(deque.toArray()));

        /* 両端キューの長さを取得 */
        int size = deque.size();
        System.out.println("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューが空か = " + isEmpty);
    }
}