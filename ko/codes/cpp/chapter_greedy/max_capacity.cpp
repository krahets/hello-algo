/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 탐욕 알고리즘으로 최대 용량 구하기 */
int maxCapacity(vector<int> &ht) {
    // i와 j를 각각 배열의 양 끝에 놓는다
    int i = 0, j = ht.size() - 1;
    // 최대 용량의 초깃값은 0이다
    int res = 0;
    // 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* 실행 예제 */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // 탐욕 알고리즘
    int res = maxCapacity(ht);
    cout << "최대 용량: " << res << endl;

    return 0;
}
