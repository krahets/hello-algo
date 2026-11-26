/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 雙向鏈結串列的節點 */
class ListNode {
    prev: ListNode | null; // 指向上一個節點的參照
    next: ListNode | null; // 指向下一個節點的參照
    val: number; // 節點值

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
    private front: ListNode; // front 指向首節點
    private rear: ListNode; // rear 指向尾節點
    private queSize: number; // 雙端佇列長度

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* 從隊尾加入元素 */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // 將 node 加到鏈結串列的末端
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 更新尾節點
        }
        this.queSize++;
    }

    /* 從隊首加入元素 */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // 將 node 加到鏈結串列的開頭
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 更新首節點
        }
        this.queSize++;
    }

    /* 從隊尾取出元素 */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // 暫存尾節點的值
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 移除尾節點
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // 更新尾節點
        }
        this.queSize--;
        return value;
    }

    /* 從隊首取出元素 */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 暫存首節點的值
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 移除首節點
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // 更新首節點
        }
        this.queSize--;
        return value;
    }

    /* 讀取隊尾元素 */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* 讀取隊首元素 */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 取得雙端佇列長度 */
    size(): number {
        return this.queSize;
    }

    /* 判斷雙端佇列是否為空 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 輸出雙端佇列內容 */
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

/* 範例程式 */
/* 初始化雙端佇列 */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('雙端佇列 linkedListDeque = ');
linkedListDeque.print();

/* 讀取隊首與隊尾元素 */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('隊首元素 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('隊尾元素 peekLast = ' + peekLast);

/* 將元素加入雙端佇列 */
linkedListDeque.pushLast(4);
console.log('將元素 4 加到隊尾後 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('將元素 1 加到隊首後 linkedListDeque = ');
linkedListDeque.print();

/* 從雙端佇列取出元素 */
const popLast: number = linkedListDeque.popLast();
console.log('從隊尾取出的元素 = ' + popLast + '，從隊尾取出後 linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('從隊首取出的元素 = ' + popFirst + '，從隊首取出後 linkedListDeque = ');
linkedListDeque.print();

/* 取得雙端佇列長度 */
const size: number = linkedListDeque.size();
console.log('雙端佇列長度 size = ' + size);

/* 判斷雙端佇列是否為空 */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('雙端佇列是否為空 = ' + isEmpty);
