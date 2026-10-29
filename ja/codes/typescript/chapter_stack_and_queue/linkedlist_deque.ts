/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 双方向連結リストのノード */
class ListNode {
    prev: ListNode; // 前のノードへの参照（ポインタ）
    next: ListNode; // 後続ノードへの参照（ポインタ）
    val: number; // ノードの値

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 双方向連結リストで実装した両端キュー */
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
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node を連結リストの末尾に追加する
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 末尾ノードを更新する
        }
        this.queSize++;
    }

    /* 先頭へのエンキュー操作 */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node を連結リストの先頭に追加する
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 先頭ノードを更新する
        }
        this.queSize++;
    }

    /* 末尾からのデキュー操作 */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // 末尾ノードの値を保存する
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 末尾ノードを削除する
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // 末尾ノードを更新する
        }
        this.queSize--;
        return value;
    }

    /* 先頭からのデキュー操作 */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 先頭ノードの値を保存する
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 先頭ノードを削除する
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // 先頭ノードを更新する
        }
        this.queSize--;
        return value;
    }

    /* キューの末尾要素にアクセスする */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* キューの先頭要素にアクセス */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 両端キューの長さを取得する */
    size(): number {
        return this.queSize;
    }

    /* 両端キューが空かどうかを判定する */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 両端キューを表示する */
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

/* 実行用コード */
/* 両端キューを初期化する */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('両端キュー linkedListDeque = ');
linkedListDeque.print();

/* 要素にアクセスする */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('キューの先頭要素 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('キューの末尾要素 peekLast = ' + peekLast);

/* 要素をエンキューする */
linkedListDeque.pushLast(4);
console.log('要素 4 を末尾にエンキューした後 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('要素 1 を先頭にエンキューした後 linkedListDeque = ');
linkedListDeque.print();

/* 要素をデキューする */
const popLast: number = linkedListDeque.popLast();
console.log('末尾からデキューした要素 = ' + popLast + '、末尾からデキューした後 linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('先頭からデキューした要素 = ' + popFirst + '、先頭からデキューした後 linkedListDeque = ');
linkedListDeque.print();

/* 両端キューの長さを取得する */
const size: number = linkedListDeque.size();
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('両端キューは空か = ' + isEmpty);
