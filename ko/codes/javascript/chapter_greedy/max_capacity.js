/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 탐욕 알고리즘으로 최대 용량 구하기 */
function maxCapacity(ht) {
    // i와 j를 각각 배열의 양 끝에 놓는다
    let i = 0,
        j = ht.length - 1;
    // 최대 용량의 초깃값은 0이다
    let res = 0;
    // 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* 실행 예제 */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// 탐욕 알고리즘
const res = maxCapacity(ht);
console.log(`최대 용량: ${res}`);
