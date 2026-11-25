/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    #front; // 첫 노드 #front
    #rear; // 마지막 노드 #rear
    #queSize = 0;

    constructor() {
        this.#front = null;
        this.#rear = null;
    }

    /* 큐의 길이 조회 */
    get size() {
        return this.#queSize;
    }

    /* 큐가 비어 있는지 확인 */
    isEmpty() {
        return this.size === 0;
    }

    /* 큐에 삽입 */
    push(num) {
        // 마지막 노드 뒤에 num을 추가한다
        const node = new ListNode(num);
        // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* 큐에서 꺼내기 */
    pop() {
        const num = this.peek();
        // 첫 노드 삭제
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    peek() {
        if (this.size === 0) throw new Error('큐가 비어 있다');
        return this.#front.val;
    }

    /* 연결 리스트를 배열로 변환해 반환한다 */
    toArray() {
        let node = this.#front;
        const res = new Array(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

/* 실행 예제 */
/* 큐 초기화 */
const queue = new LinkedListQueue();

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue = ' + queue.toArray());

/* 맨 앞 원소 조회 */
const peek = queue.peek();
console.log('맨 앞 원소 peek = ' + peek);

/* 큐에서 원소 꺼내기 */
const pop = queue.pop();
console.log('꺼낸 원소 pop = ' + pop + ', 꺼낸 후 queue = ' + queue.toArray());

/* 큐의 길이 조회 */
const size = queue.size;
console.log('큐의 길이 size = ' + size);

/* 큐가 비어 있는지 확인 */
const isEmpty = queue.isEmpty();
console.log('큐가 비어 있는가 = ' + isEmpty);
