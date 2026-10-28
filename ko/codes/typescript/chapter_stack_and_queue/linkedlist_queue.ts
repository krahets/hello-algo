/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    private front: ListNode | null; // 머리 노드 front
    private rear: ListNode | null; // 꼬리 노드 rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* 큐의 길이 반환 */
    get size(): number {
        return this.queSize;
    }

    /* 큐가 비어 있는지 판단 */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* 큐에 삽입 */
    push(num: number): void {
        // 꼬리 노드 뒤에 num을 추가한다
        const node = new ListNode(num);
        // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* 큐에서 꺼내기 */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('큐가 비어 있다');
        // 머리 노드를 삭제한다
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    peek(): number {
        if (this.size === 0) throw new Error('큐가 비어 있다');
        return this.front!.val;
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
    toArray(): number[] {
        let node = this.front;
        const res = new Array<number>(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node!.val;
            node = node!.next;
        }
        return res;
    }
}

/* 실행 코드 */
/* 큐 초기화 */
const queue = new LinkedListQueue();

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue = ' + queue.toArray());

/* 맨 앞 원소 접근 */
const peek = queue.peek();
console.log('맨 앞 원소 peek = ' + peek);

/* 큐에서 원소 꺼내기 */
const pop = queue.pop();
console.log('큐에서 꺼낸 원소 pop = ' + pop + ', 큐에서 꺼낸 후 queue = ' + queue.toArray());

/* 큐의 길이 반환 */
const size = queue.size;
console.log('큐 길이 size = ' + size);

/* 큐가 비어 있는지 판단 */
const isEmpty = queue.isEmpty();
console.log('큐가 비어 있는가 = ' + isEmpty);

export {};
