/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* 최대 힙 클래스 */
class MaxHeap {
    #maxHeap;

    /* 빈 힙을 만들거나 입력 리스트로 힙을 만드는 생성자 */
    constructor(nums) {
        // 리스트의 원소를 그대로 힙에 추가
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 리프를 제외한 모든 노드에서 힙 복구
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 구하기 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 나눗셈 결과를 내림
    }

    /* 원소 교환 */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* 힙 크기 구하기 */
    size() {
        return this.#maxHeap.length;
    }

    /* 힙이 비었는지 확인 */
    isEmpty() {
        return this.size() === 0;
    }

    /* 힙의 루트 원소 조회 */
    peek() {
        return this.#maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    push(val) {
        // 노드 추가
        this.#maxHeap.push(val);
        // 아래에서 위로 힙 복구
        this.#siftUp(this.size() - 1);
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    #siftUp(i) {
        while (true) {
            // 노드 i의 부모 노드 구하기
            const p = this.#parent(i);
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 두 노드 교환
            this.#swap(i, p);
            // 위로 올라가며 힙 복구 반복
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    pop() {
        // 빈 힙 처리
        if (this.isEmpty()) throw new Error('힙이 비어 있음');
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        this.#swap(0, this.size() - 1);
        // 노드 삭제
        const val = this.#maxHeap.pop();
        // 위에서 아래로 힙 복구
        this.#siftDown(0);
        // 힙의 루트 원소 반환
        return val;
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    #siftDown(i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if (ma === i) break;
            // 두 노드 교환
            this.#swap(i, ma);
            // 아래로 내려가며 힙 복구 반복
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    print() {
        printHeap(this.#maxHeap);
    }

    /* 최대 힙의 모든 원소를 담은 배열 반환 */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* 실행 예제 */
if (require.main === module) {
    /* 최대 힙 초기화 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n입력 리스트로 만든 힙:');
    maxHeap.print();

    /* 힙의 루트 원소 구하기 */
    let peek = maxHeap.peek();
    console.log(`\n힙의 루트 원소: ${peek}`);

    /* 힙에 원소 삽입 */
    let val = 7;
    maxHeap.push(val);
    console.log(`\n원소 ${val} 삽입 후`);
    maxHeap.print();

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.pop();
    console.log(`\n루트 원소 ${peek} 제거 후`);
    maxHeap.print();

    /* 힙 크기 구하기 */
    let size = maxHeap.size();
    console.log(`\n힙의 원소 수: ${size}`);

    /* 힙이 비었는지 확인 */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\n빈 힙 여부: ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
