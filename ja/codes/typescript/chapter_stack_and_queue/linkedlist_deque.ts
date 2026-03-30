/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 双方向連結リストノード */
class ListNode {
    prev: ListNode; // 前駆ノードへの参照（ポインタ）
    next: ListNode; // 後継ノードへの参照（ポインタ）
    val: number; // ノード値

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 双方向連結リストベースの両端キュー */
class LinkedListDeque {
    private front: ListNode; // 先頭ノード front
    private rear: ListNode; // 末尾ノード rear
    private queSize: number; // 両端キューの長さ

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* 末尾へのエンキュー操作 */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node を連結リストの末尾に追加
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 末尾ノードを更新する
        }
        this.queSize++;
    }

    /* 先頭へのエンキュー操作 */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node を連結リストの先頭に追加
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 先頭ノードを更新する
        }
        this.queSize++;
    }

    /* キュー末尾からの取り出し */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear.val; // 末尾ノードの値を保存する
        // 末尾ノードを削除
        let temp: ListNode = this.rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.rear.prev = null;
        }
        this.rear = temp; // 末尾ノードを更新する
        this.queSize--;
        return value;
    }

    /* キュー先頭からの取り出し */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 末尾ノードの値を保存する
        // 先頭ノードを削除
        let temp: ListNode = this.front.next;
        if (temp !== null) {
            temp.prev = null;
            this.front.next = null;
        }
        this.front = temp; // 先頭ノードを更新する
        this.queSize--;
        return value;
    }

    /* キュー末尾の要素にアクセス */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* キュー先頭の要素にアクセス */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 両端キューの長さを取得 */
    size(): number {
        return this.queSize;
    }

    /* 両端キューが空かどうかを判定 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 両端キューを出力する */
    print(): void {
        const arr: number[] = [];
        let temp: ListNode = this.front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Driver Code */
/* 両端キューを初期化 */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('両端キュー linkedListDeque = ');
linkedListDeque.print();

/* 要素にアクセス */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素をエンキュー */
linkedListDeque.pushLast(4);
console.log('要素 4 を末尾にエンキュー後 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('要素 1 を先頭にエンキュー後 linkedListDeque = ');
linkedListDeque.print();

/* 要素をデキュー */
const popLast: number = linkedListDeque.popLast();
console.log('末尾からデキューした要素 = ' + popLast + '，末尾からデキュー後 linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('先頭から取り出した要素 = ' + popFirst + '，先頭を取り出した後の linkedListDeque = ');
linkedListDeque.print();

/* 両端キューの長さを取得 */
const size: number = linkedListDeque.size();
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定 */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('両端キューが空かどうか = ' + isEmpty);
