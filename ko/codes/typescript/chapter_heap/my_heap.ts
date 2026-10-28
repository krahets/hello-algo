/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 최대 힙 클래스 */
class MaxHeap {
    private maxHeap: number[];
    /* 생성자: 빈 힙을 만들거나 입력 리스트로 힙을 구성한다 */
    constructor(nums?: number[]) {
        // 리스트 원소를 그대로 힙에 추가한다
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
    }

    /* 원소 교환 */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* 힙 크기 반환 */
    public size(): number {
        return this.maxHeap.length;
    }

    /* 힙이 비어 있는지 판단 */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* 힙의 루트 원소 접근 */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    public push(val: number): void {
        // 노드 추가
        this.maxHeap.push(val);
        // 아래에서 위로 힙을 재정렬한다
        this.siftUp(this.size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    private siftUp(i: number): void {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            const p = this.parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 두 노드를 교환한다
            this.swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    public pop(): number {
        // 비어 있는 경우를 처리한다
        if (this.isEmpty()) throw new RangeError('힙이 비어 있다.');
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        this.swap(0, this.size() - 1);
        // 노드 삭제
        const val = this.maxHeap.pop();
        // 위에서 아래로 힙을 재정렬한다
        this.siftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    private siftDown(i: number): void {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma === i) break;
            // 두 노드를 교환한다
            this.swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* 힙의 원소를 반환한다 */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* 실행 코드 */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 최대 힙 초기화 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n리스트를 입력하여 힙을 구성한 후');
    maxHeap.print();

    /* 힙의 루트 원소 반환 */
    let peek = maxHeap.peek();
    console.log(`\n힙의 루트 원소: ${peek}`);

    /* 힙에 원소 삽입 */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n원소를 힙에 삽입한 후(원소: ${val})`);
    maxHeap.print();

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.pop();
    console.log(`\n힙의 루트 원소를 꺼낸 후(원소: ${peek})`);
    maxHeap.print();

    /* 힙 크기 반환 */
    const size = maxHeap.size();
    console.log(`\n힙의 원소 개수: ${size}`);

    /* 힙이 비어 있는지 판단 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\n힙이 비어 있는가: ${isEmpty}`);
}

export { MaxHeap };
