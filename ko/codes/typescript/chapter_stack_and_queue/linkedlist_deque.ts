/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 이중 연결 리스트 노드 */
class ListNode {
    prev: ListNode; // 이전 노드 참조(포인터)
    next: ListNode; // 다음 노드 참조(포인터)
    val: number; // 노드 값

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private front: ListNode; // 머리 노드 front
    private rear: ListNode; // 꼬리 노드 rear
    private queSize: number; // 덱의 길이

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* 맨 뒤에 삽입하는 연산 */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 꼬리 노드를 갱신한다
        }
        this.queSize++;
    }

    /* 맨 앞에 삽입하는 연산 */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // node를 연결 리스트의 맨 앞에 추가한다
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 머리 노드를 갱신한다
        }
        this.queSize++;
    }

    /* 맨 뒤에서 꺼내는 연산 */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // 꼬리 노드의 값을 저장한다
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 꼬리 노드를 삭제한다
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // 꼬리 노드를 갱신한다
        }
        this.queSize--;
        return value;
    }

    /* 맨 앞에서 꺼내는 연산 */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 머리 노드의 값을 저장한다
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 머리 노드를 삭제한다
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // 머리 노드를 갱신한다
        }
        this.queSize--;
        return value;
    }

    /* 맨 뒤 원소 접근 */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* 맨 앞 원소 접근 */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 덱의 길이 반환 */
    size(): number {
        return this.queSize;
    }

    /* 덱이 비어 있는지 판단 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 덱을 출력한다 */
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

/* 실행 코드 */
/* 덱 초기화 */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('덱 linkedListDeque = ');
linkedListDeque.print();

/* 원소 접근 */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 큐에 원소 삽입 */
linkedListDeque.pushLast(4);
console.log('뒤쪽에 원소 4를 삽입한 후 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('앞쪽에 원소 1을 삽입한 후 linkedListDeque = ');
linkedListDeque.print();

/* 큐에서 원소 꺼내기 */
const popLast: number = linkedListDeque.popLast();
console.log('맨 뒤에서 꺼낸 원소 = ' + popLast + ', 뒤쪽 원소를 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('맨 앞에서 꺼낸 원소 = ' + popFirst + ', 앞쪽 원소를 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱의 길이 반환 */
const size: number = linkedListDeque.size();
console.log('덱 길이 size = ' + size);

/* 덱이 비어 있는지 판단 */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);
