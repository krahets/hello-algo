/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 물건 */
class Item {
    w: number; // 물건의 무게
    v: number; // 물건의 가치

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* 분할 가능한 배낭: 탐욕 */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // 탐욕적 선택을 반복한다
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
            res += item.v;
            cap -= item.w;
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
            res += (item.v / item.w) * cap;
            // 남은 용량이 없으므로 반복문을 종료한다
            break;
        }
    }
    return res;
}

/* 실행 코드 */
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// 탐욕 알고리즘
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`배낭 용량을 초과하지 않는 물건의 최대 가치는 ${res}이다`);

export {};
