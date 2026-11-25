/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
    private nums: number[]; // 덱의 원소를 저장하는 배열
    private front: number; // 맨 앞 원소를 가리키는 앞쪽 포인터
    private queSize: number; // 덱의 길이

    /* 생성자 */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* 덱의 용량 조회 */
    capacity(): number {
        return this.nums.length;
    }

    /* 덱의 길이 조회 */
    size(): number {
        return this.queSize;
    }

    /* 덱이 비어 있는지 확인 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 원형 배열의 인덱스 계산 */
    index(i: number): number {
        // 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘으면 처음으로 돌아간다
        // i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
        return (i + this.capacity()) % this.capacity();
    }

    /* 맨 앞에 삽입 */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('덱이 가득 찼다');
            return;
        }
        // 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
        // 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
        this.front = this.index(this.front - 1);
        // 맨 앞에 num을 추가한다
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* 맨 뒤에 삽입 */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('덱이 가득 찼다');
            return;
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        const rear: number = this.index(this.front + this.queSize);
        // 맨 뒤에 num을 추가한다
        this.nums[rear] = num;
        this.queSize++;
    }

    /* 맨 앞에서 꺼내기 */
    popFirst(): number {
        const num: number = this.peekFirst();
        // 앞쪽 포인터를 한 칸 전진시킨다
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* 맨 뒤에서 꺼내기 */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* 맨 뒤 원소 조회 */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // 맨 뒤 원소의 인덱스 계산
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* 출력할 배열 반환 */
    toArray(): number[] {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* 실행 예제 */
/* 덱 초기화 */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('덱 deque = [' + deque.toArray() + ']');

/* 원소 조회 */
const peekFirst = deque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 덱에 원소 삽입 */
deque.pushLast(4);
console.log('맨 뒤에 원소 4를 삽입한 후 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('맨 앞에 원소 1을 삽입한 후 deque = [' + deque.toArray() + ']');

/* 덱에서 원소 꺼내기 */
const popLast = deque.popLast();
console.log(
    '맨 뒤에서 꺼낸 원소 = ' +
        popLast +
        ', 맨 뒤에서 꺼낸 후 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '맨 앞에서 꺼낸 원소 = ' +
        popFirst +
        ', 맨 앞에서 꺼낸 후 deque = [' +
        deque.toArray() +
        ']'
);

/* 덱의 길이 조회 */
const size = deque.size();
console.log('덱의 길이 size = ' + size);

/* 덱이 비어 있는지 확인 */
const isEmpty = deque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);

export {};
