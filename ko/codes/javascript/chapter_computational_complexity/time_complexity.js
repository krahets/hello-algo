/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 상수 차수 */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 선형 차수 */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 선형 차수(배열 순회) */
function arrayTraversal(nums) {
    let count = 0;
    // 반복 횟수는 배열 길이에 비례한다
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 이차 차수 */
function quadratic(n) {
    let count = 0;
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 이차 차수(버블 정렬) */
function bubbleSort(nums) {
    let count = 0; // 카운터
    // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    for (let i = nums.length - 1; i > 0; i--) {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]의 값을 맞바꾼다
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
            }
        }
    }
    return count;
}

/* 지수 차수(반복 구현) */
function exponential(n) {
    let count = 0,
        base = 1;
    // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 지수 차수(재귀 구현) */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 로그 차수(반복 구현) */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 로그 차수(재귀 구현) */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 선형 로그 차수 */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    const half = Math.floor(n / 2);
    let count = linearLogRecur(half) + linearLogRecur(half);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 팩토리얼 차수(재귀 구현) */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // 하나가 n개로 나뉜다
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 실행 예제 */
// n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
const n = 8;
console.log('입력 크기 n = ' + n);

let count = constant(n);
console.log('상수 차수 연산 횟수 = ' + count);

count = linear(n);
console.log('선형 차수 연산 횟수 = ' + count);
count = arrayTraversal(new Array(n));
console.log('선형 차수(배열 순회) 연산 횟수 = ' + count);

count = quadratic(n);
console.log('이차 차수 연산 횟수 = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('이차 차수(버블 정렬) 연산 횟수 = ' + count);

count = exponential(n);
console.log('지수 차수(반복 구현) 연산 횟수 = ' + count);
count = expRecur(n);
console.log('지수 차수(재귀 구현) 연산 횟수 = ' + count);

count = logarithmic(n);
console.log('로그 차수(반복 구현) 연산 횟수 = ' + count);
count = logRecur(n);
console.log('로그 차수(재귀 구현) 연산 횟수 = ' + count);

count = linearLogRecur(n);
console.log('선형 로그 차수(재귀 구현) 연산 횟수 = ' + count);

count = factorialRecur(n);
console.log('팩토리얼 차수(재귀 구현) 연산 횟수 = ' + count);
