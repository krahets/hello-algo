/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    private nums: number[]; // 큐의 원소를 저장하는 배열
    private front: number; // 맨 앞 원소를 가리키는 맨 앞 포인터
    private queSize: number; // 큐 길이

    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = this.queSize = 0;
    }

    /* 큐의 용량 반환 */
    get capacity(): number {
        return this.nums.length;
    }

    /* 큐의 길이 반환 */
    get size(): number {
        return this.queSize;
    }

    /* 큐가 비어 있는지 판단 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 큐에 삽입 */
    push(num: number): void {
        if (this.size === this.capacity) {
            console.log('큐가 가득 찼다');
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        const rear = (this.front + this.queSize) % this.capacity;
        // num을 맨 뒤에 추가한다
        this.nums[rear] = num;
        this.queSize++;
    }

    /* 큐에서 꺼내기 */
    pop(): number {
        const num = this.peek();
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        this.front = (this.front + 1) % this.capacity;
        this.queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    peek(): number {
        if (this.isEmpty()) throw new Error('큐가 비어 있다');
        return this.nums[this.front];
    }

    /* Array를 반환한다 */
    toArray(): number[] {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        const arr = new Array(this.size);
        for (let i = 0, j = this.front; i < this.size; i++, j++) {
            arr[i] = this.nums[j % this.capacity];
        }
        return arr;
    }
}

/* 실행 코드 */
/* 큐 초기화 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue =', queue.toArray());

/* 맨 앞 원소 접근 */
const peek = queue.peek();
console.log('맨 앞 원소 peek = ' + peek);

/* 큐에서 원소 꺼내기 */
const pop = queue.pop();
console.log('큐에서 꺼낸 원소 pop = ' + pop + ', 큐에서 꺼낸 후 queue =', queue.toArray());

/* 큐의 길이 반환 */
const size = queue.size;
console.log('큐 길이 size = ' + size);

/* 큐가 비어 있는지 판단 */
const isEmpty = queue.isEmpty();
console.log('큐가 비어 있는가 = ' + isEmpty);

/* 원형 배열 테스트 */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('반복 ' + i + ' 회에서 삽입 + 꺼내기를 수행한 후 queue =', queue.toArray());
}

export {};
