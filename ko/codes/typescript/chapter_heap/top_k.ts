/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* 힙에 원소 삽입 */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // 원소의 부호 반전
    maxHeap.push(-val);
}

/* 힙에서 원소 꺼내기 */
function popMinHeap(maxHeap: MaxHeap): number {
    // 원소의 부호 반전
    return -maxHeap.pop();
}

/* 힙의 루트 원소 조회 */
function peekMinHeap(maxHeap: MaxHeap): number {
    // 원소의 부호 반전
    return -maxHeap.peek();
}

/* 최소 힙의 모든 원소를 배열로 반환 */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // 원소의 부호 반전
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
function topKHeap(nums: number[], k: number): number[] {
    // 최소 힙 초기화
    // 모든 원소의 부호를 바꾸면 최대 힙을 최소 힙처럼 사용할 수 있음
    const maxHeap = new MaxHeap([]);
    // 배열의 처음 k개 원소를 힙에 삽입
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1번째 원소부터 힙의 크기를 k로 유지
    for (let i = k; i < nums.length; i++) {
        // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // 힙에 있는 원소 반환
    return getMinHeap(maxHeap);
}

/* 실행 예제 */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`가장 큰 원소 ${k}개:`, res);
