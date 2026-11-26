/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 双方向連結リストのノード */
class ListNode {
    prev; // 前のノードへの参照（ポインタ）
    next; // 次のノードへの参照（ポインタ）
    val; // ノードの値

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
    #front; // 先頭ノード front
    #rear; // 末尾ノード rear
    #queSize; // 両端キューの要素数

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* 末尾に追加する */
    pushLast(val) {
        const node = new ListNode(val);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // node をリストの末尾に追加する
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // 末尾ノードを更新する
        }
        this.#queSize++;
    }

    /* 先頭に追加する */
    pushFirst(val) {
        const node = new ListNode(val);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // node をリストの先頭に追加する
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // 先頭ノードを更新する
        }
        this.#queSize++;
    }

    /* 末尾から取り出す */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // 末尾ノードの値を保存する
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 末尾ノードを削除する
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // 末尾ノードを更新する
        }
        this.#queSize--;
        return value;
    }

    /* 先頭から取り出す */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // 先頭ノードの値を保存する
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 先頭ノードを削除する
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // 先頭ノードを更新する
        }
        this.#queSize--;
        return value;
    }

    /* 両端キューの末尾要素を参照する */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* 両端キューの先頭要素を参照する */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* 両端キューの要素数を取得する */
    size() {
        return this.#queSize;
    }

    /* 両端キューが空かどうかを判定する */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 両端キューを表示する */
    print() {
        const arr = [];
        let temp = this.#front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* 実行例 */
/* 両端キューを初期化する */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('両端キュー linkedListDeque = ');
linkedListDeque.print();

/* 要素を参照する */
const peekFirst = linkedListDeque.peekFirst();
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素を両端キューに追加する */
linkedListDeque.pushLast(4);
console.log('末尾に 4 を追加した後の linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('先頭に 1 を追加した後の linkedListDeque = ');
linkedListDeque.print();

/* 両端キューから要素を取り出す */
const popLast = linkedListDeque.popLast();
console.log('末尾から取り出した要素 = ' + popLast + '、末尾から取り出した後の linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('先頭から取り出した要素 = ' + popFirst + '、先頭から取り出した後の linkedListDeque = ');
linkedListDeque.print();

/* 両端キューの要素数を取得する */
const size = linkedListDeque.size();
console.log('両端キューの要素数 size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty = linkedListDeque.isEmpty();
console.log('両端キューは空か = ' + isEmpty);
