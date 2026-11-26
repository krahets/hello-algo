/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* 물건 */
class Item {
    int w; // 물건의 무게
    int v; // 물건의 가치

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* 탐욕 알고리즘으로 분할 가능 배낭 풀기 */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 무게와 가치를 속성으로 갖는 물건의 리스트를 만든다
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 탐욕 선택을 반복한다
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 담는다
                res += item.v;
                cap -= item.w;
            } else {
                // 남은 용량이 부족하면 현재 물건의 일부만 배낭에 담는다
                res += (double) item.v / item.w * cap;
                // 남은 용량이 없으므로 반복문을 빠져나온다
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // 탐욕 알고리즘
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("배낭 용량 안에서 얻는 최대 가치: " + res);
    }
}
