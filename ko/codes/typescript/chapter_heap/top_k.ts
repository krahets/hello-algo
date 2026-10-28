/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* 힙에 원소 삽입 */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // 원소의 부호를 반전한다
    maxHeap.push(-val);
}

/* 힙에서 원소 꺼내기 */
function popMinHeap(maxHeap: MaxHeap): number {
    // 원소의 부호를 반전한다
    return -maxHeap.pop();
}

/* 힙의 루트 원소 접근 */
function peekMinHeap(maxHeap: MaxHeap): number {
    // 원소의 부호를 반전한다
    return -maxHeap.peek();
}

/* 힙의 원소를 반환한다 */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // 원소의 부호를 반전한다
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
function topKHeap(nums: number[], k: number): number[] {
    // 최소 힙 초기화
    // 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
    const maxHeap = new MaxHeap([]);
    // 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for (let i = k; i < nums.length; i++) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // 힙의 원소를 반환한다
    return getMinHeap(maxHeap);
}

/* 실행 코드 */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`가장 큰 원소 ${k}개:`, res);
