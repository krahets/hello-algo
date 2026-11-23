/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 물건 */
class Item {
  public:
    int w; // 물건의 무게
    int v; // 물건의 가치

    Item(int w, int v) : w(w), v(v) {
    }
};

/* 분할 가능한 배낭: 탐욕 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 탐욕적 선택을 반복한다
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
            res += item.v;
            cap -= item.w;
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
            res += (double)item.v / item.w * cap;
            // 남은 용량이 없으므로 반복문을 종료한다
            break;
        }
    }
    return res;
}

/* 실행 코드 */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // 탐욕 알고리즘
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "배낭 용량을 초과하지 않는 물건의 최대 가치: " << res << endl;

    return 0;
}
