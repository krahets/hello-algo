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
    /* Greedy fractional knapsack */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create a list of items, each with a weight and a value
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by value per unit of weight, item.v / item.w, in descending order
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // Make greedy choices in a loop
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // If the whole item fits, put it in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the whole item does not fit, take a fraction of it
                res += (double) item.v / item.w * cap;
                // The knapsack is full, so exit the loop
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
        System.out.println("The maximum total value within the weight limit is " + res);
    }
}
