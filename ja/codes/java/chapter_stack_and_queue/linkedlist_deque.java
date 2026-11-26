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
    ListNode next; // 次のノードへの参照
    ListNode prev; // 前のノードへの参照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
    private ListNode front, rear; // front は先頭ノード、rear は末尾ノードを指す
    private int queSize = 0; // 両端キューの要素数

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 両端キューの要素数を取得する */
    public int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 両端キューに要素を追加する */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (isEmpty())
            front = rear = node;
        // 先頭に追加する
        else if (isFront) {
            // node をリストの先頭に追加する
            front.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する
        // 末尾に追加する
        } else {
            // node をリストの末尾に追加する
            rear.next = node;
            node.prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾に追加する */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 両端キューから要素を取り出す */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // 先頭から取り出す
        else if (isFront) {
            val = front.val; // 先頭ノードの値を一時的に保存する
            // 先頭ノードを削除する
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // 先頭ノードを更新する
        // 末尾から取り出す
        } else {
            val = rear.val; // 末尾ノードの値を一時的に保存する
            // 末尾ノードを削除する
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // 両端キューの要素数を更新する
        return val;
    }

    /* 先頭から取り出す */
    public int popFirst() {
        return pop(true);
    }

    /* 末尾から取り出す */
    public int popLast() {
        return pop(false);
    }

    /* 両端キューの先頭要素を参照する */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 両端キューの末尾要素を参照する */
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
