/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 최대 용량: 탐욕 */
function maxCapacity(ht: number[]): number {
    // i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    let i = 0,
        j = ht.length - 1;
    // 최대 용량의 초깃값은 0이다
    let res = 0;
    // 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 낮은 칸막이를 안쪽으로 이동한다
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* 실행 코드 */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// 탐욕 알고리즘
const res: number = maxCapacity(ht);
console.log(`최대 용량은 ${res}이다`);

export {};
