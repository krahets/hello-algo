/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* 물건 */
class Item(int w, int v) {
    public int w = w; // 물건의 무게
    public int v = v; // 물건의 가치
}

public class fractional_knapsack {
    /* 탐욕 알고리즘으로 분할 가능 배낭 풀기 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 무게와 가치를 속성으로 갖는 물건의 리스트를 만든다
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
        Array.Sort(items, (x, y) => ((double)y.v / y.w).CompareTo((double)x.v / x.w));
        // 탐욕 선택을 반복한다
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 담는다
                res += item.v;
                cap -= item.w;
            } else {
                // 남은 용량이 부족하면 현재 물건의 일부만 배낭에 담는다
                res += (double)item.v / item.w * cap;
                // 남은 용량이 없으므로 반복문을 빠져나온다
                break;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] wgt = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;

        // 탐욕 알고리즘
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("배낭 용량 안에서 얻는 최대 가치: " + res);
    }
}