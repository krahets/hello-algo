/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 시스템 시간으로 난수 시드를 생성한다
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 배열 원소를 무작위로 섞는다
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 실행 코드 */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\n배열 [ 1, 2, ..., n ]을 섞은 결과 = ";
        printVector(nums);
        cout << "숫자 1의 인덱스 " << index << endl;
    }
    return 0;
}
