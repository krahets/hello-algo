/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 방법 1. 모든 조합 확인 */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // 이중 반복문을 사용하므로 시간 복잡도는 O(n^2)이다.
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* 방법 2. 보조 해시 테이블 사용 */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // 보조 해시 테이블을 사용하므로 공간 복잡도는 O(n)이다.
    unordered_map<int, int> dic;
    // 반복문 하나만 사용하므로 시간 복잡도는 O(n)이다.
    for (int i = 0; i < size; i++) {
        if (dic.find(target - nums[i]) != dic.end()) {
            return {dic[target - nums[i]], i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* 실행 예제 */
int main() {
    // ======= 테스트 케이스 =======
    vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // ====== 실행 예제 ======
    // 방법 1
    vector<int> res = twoSumBruteForce(nums, target);
    cout << "방법 1 res = ";
    printVector(res);
    // 방법 2
    res = twoSumHashTable(nums, target);
    cout << "방법 2 res = ";
    printVector(res);

    return 0;
}
