/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 이중 연결 리스트의 노드 */
class ListNode {
    prev; // 이전 노드에 대한 참조(포인터)
    next; // 다음 노드에 대한 참조(포인터)
    val; // 노드의 값

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    #front; // 첫 노드 front
    #rear; // 마지막 노드 rear
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
            // 연결 리스트의 맨 뒤에 node를 추가한다
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // 마지막 노드 갱신
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
            // 연결 리스트의 맨 앞에 node를 추가한다
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // 첫 노드 갱신
        }
        this.#queSize++;
    }

    /* 맨 뒤에서 꺼내는 연산 */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // 마지막 노드의 값을 저장한다
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 마지막 노드 삭제
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // 마지막 노드 갱신
        }
        this.#queSize--;
        return value;
    }

    /* 맨 앞에서 꺼내는 연산 */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // 첫 노드의 값을 저장한다
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // 첫 노드 삭제
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // 첫 노드 갱신
        }
        this.#queSize--;
        return value;
    }

    /* 맨 뒤 원소 조회 */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* 맨 앞 원소 조회 */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* 덱의 길이 조회 */
    size() {
        return this.#queSize;
    }

    /* 덱이 비어 있는지 확인 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 덱 출력 */
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

/* 실행 예제 */
/* 덱 초기화 */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('덱 linkedListDeque = ');
linkedListDeque.print();

/* 원소 조회 */
const peekFirst = linkedListDeque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 덱에 원소 삽입 */
linkedListDeque.pushLast(4);
console.log('맨 뒤에 원소 4를 삽입한 후 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('맨 앞에 원소 1을 삽입한 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱에서 원소 꺼내기 */
const popLast = linkedListDeque.popLast();
console.log('맨 뒤에서 꺼낸 원소 = ' + popLast + ', 맨 뒤에서 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('맨 앞에서 꺼낸 원소 = ' + popFirst + ', 맨 앞에서 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱의 길이 조회 */
const size = linkedListDeque.size();
console.log('덱의 길이 size = ' + size);

/* 덱이 비어 있는지 확인 */
const isEmpty = linkedListDeque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);
