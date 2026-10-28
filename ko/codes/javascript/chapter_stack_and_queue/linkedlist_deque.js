/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 이중 연결 리스트 노드 */
class ListNode {
    prev; // 이전 노드 참조(포인터)
    next; // 다음 노드 참조(포인터)
    val; // 노드 값

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    #front; // 머리 노드 front
    #rear; // 꼬리 노드 rear
    #queSize; // 덱의 길이

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* 맨 뒤에 삽입하는 연산 */
    pushLast(val) {
        const node = new ListNode(val);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // 꼬리 노드를 갱신한다
        }
        this.#queSize++;
    }

    /* 맨 앞에 삽입하는 연산 */
    pushFirst(val) {
        const node = new ListNode(val);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // node를 연결 리스트의 맨 앞에 추가한다
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // 머리 노드를 갱신한다
        }
        this.#queSize++;
    }

    /* 맨 뒤에서 꺼내는 연산 */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // 꼬리 노드의 값을 저장한다
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 꼬리 노드를 삭제한다
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // 꼬리 노드를 갱신한다
        }
        this.#queSize--;
        return value;
    }

    /* 맨 앞에서 꺼내는 연산 */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // 머리 노드의 값을 저장한다
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 머리 노드를 삭제한다
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // 머리 노드를 갱신한다
        }
        this.#queSize--;
        return value;
    }

    /* 맨 뒤 원소 접근 */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* 맨 앞 원소 접근 */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* 덱의 길이 반환 */
    size() {
        return this.#queSize;
    }

    /* 덱이 비어 있는지 판단 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 덱을 출력한다 */
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

/* 실행 코드 */
/* 덱 초기화 */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('덱 linkedListDeque = ');
linkedListDeque.print();

/* 원소 접근 */
const peekFirst = linkedListDeque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 큐에 원소 삽입 */
linkedListDeque.pushLast(4);
console.log('뒤쪽에 원소 4를 삽입한 후 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('앞쪽에 원소 1을 삽입한 후 linkedListDeque = ');
linkedListDeque.print();

/* 큐에서 원소 꺼내기 */
const popLast = linkedListDeque.popLast();
console.log('맨 뒤에서 꺼낸 원소 = ' + popLast + ', 뒤쪽 원소를 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('맨 앞에서 꺼낸 원소 = ' + popFirst + ', 앞쪽 원소를 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱의 길이 반환 */
const size = linkedListDeque.size();
console.log('덱 길이 size = ' + size);

/* 덱이 비어 있는지 판단 */
const isEmpty = linkedListDeque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);
