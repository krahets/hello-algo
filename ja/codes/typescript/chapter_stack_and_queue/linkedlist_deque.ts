/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 双方向連結リストのノード */
class ListNode {
    prev: ListNode | null; // 前のノードへの参照（ポインタ）
    next: ListNode | null; // 次のノードへの参照（ポインタ）
    val: number; // ノードの値

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
    private front: ListNode; // 先頭ノード front
    private rear: ListNode; // 末尾ノード rear
    private queSize: number; // 両端キューの要素数

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* 末尾に追加する */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node をリストの末尾に追加する
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 末尾ノードを更新する
        }
        this.queSize++;
    }

    /* 先頭に追加する */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node をリストの先頭に追加する
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 先頭ノードを更新する
        }
        this.queSize++;
    }

    /* 末尾から取り出す */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // 末尾ノードの値を保存する
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
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

    /* 先頭から取り出す */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 先頭ノードの値を保存する
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
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

    /* 両端キューの末尾要素を参照する */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* 両端キューの先頭要素を参照する */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 両端キューの要素数を取得する */
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

/* 実行例 */
/* 両端キューを初期化する */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('両端キュー linkedListDeque = ');
linkedListDeque.print();

/* 要素を参照する */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素を両端キューに追加する */
linkedListDeque.pushLast(4);
console.log('末尾に 4 を追加した後の linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('先頭に 1 を追加した後の linkedListDeque = ');
linkedListDeque.print();

/* 両端キューから要素を取り出す */
const popLast: number = linkedListDeque.popLast();
console.log('末尾から取り出した要素 = ' + popLast + '、末尾から取り出した後の linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('先頭から取り出した要素 = ' + popFirst + '、先頭から取り出した後の linkedListDeque = ');
linkedListDeque.print();

/* 両端キューの要素数を取得する */
const size: number = linkedListDeque.size();
console.log('両端キューの要素数 size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('両端キューは空か = ' + isEmpty);
