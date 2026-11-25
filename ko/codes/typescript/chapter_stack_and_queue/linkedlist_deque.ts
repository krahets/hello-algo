/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 이중 연결 리스트의 노드 */
class ListNode {
    prev: ListNode | null; // 이전 노드에 대한 참조(포인터)
    next: ListNode | null; // 다음 노드에 대한 참조(포인터)
    val: number; // 노드의 값

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private front: ListNode; // 첫 노드 front
    private rear: ListNode; // 마지막 노드 rear
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
            // 연결 리스트의 맨 뒤에 node를 추가한다
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // 마지막 노드 갱신
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
            // 연결 리스트의 맨 앞에 node를 추가한다
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // 첫 노드 갱신
        }
        this.queSize++;
    }

    /* 맨 뒤에서 꺼내는 연산 */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // 마지막 노드의 값을 저장한다
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 마지막 노드 삭제
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // 마지막 노드 갱신
        }
        this.queSize--;
        return value;
    }

    /* 맨 앞에서 꺼내는 연산 */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // 첫 노드의 값을 저장한다
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // 첫 노드 삭제
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // 첫 노드 갱신
        }
        this.queSize--;
        return value;
    }

    /* 맨 뒤 원소 조회 */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* 맨 앞 원소 조회 */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* 덱의 길이 조회 */
    size(): number {
        return this.queSize;
    }

    /* 덱이 비어 있는지 확인 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 덱 출력 */
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

/* 실행 예제 */
/* 덱 초기화 */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('덱 linkedListDeque = ');
linkedListDeque.print();

/* 원소 조회 */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 덱에 원소 삽입 */
linkedListDeque.pushLast(4);
console.log('맨 뒤에 원소 4를 삽입한 후 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('맨 앞에 원소 1을 삽입한 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱에서 원소 꺼내기 */
const popLast: number = linkedListDeque.popLast();
console.log('맨 뒤에서 꺼낸 원소 = ' + popLast + ', 맨 뒤에서 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('맨 앞에서 꺼낸 원소 = ' + popFirst + ', 맨 앞에서 꺼낸 후 linkedListDeque = ');
linkedListDeque.print();

/* 덱의 길이 조회 */
const size: number = linkedListDeque.size();
console.log('덱의 길이 size = ' + size);

/* 덱이 비어 있는지 확인 */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);
