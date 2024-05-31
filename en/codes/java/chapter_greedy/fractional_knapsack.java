/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* Item */
class Item {
    int w; // Item weight
    int v; // Item value

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* Fractional knapsack: Greedy */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create an item list, containing two properties: weight, value
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by unit value item.v / item.w from high to low
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // Loop for greedy selection
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // If the remaining capacity is sufficient, put the entire item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the item into the knapsack
                res += (double) item.v / item.w * cap;
                // No remaining capacity left, thus break the loop
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // Greedy algorithm
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("The maximum value within the bag capacity is " + res);
    }
}
