/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* リストクラス */
class MyList {
    private int[] arr; // 配列（リスト要素を格納）
    private int capacity = 10; // リスト容量
    private int size = 0; // リストの長さ（現在の要素数）
    private int extendRatio = 2; // リスト拡張時の増加倍率

    /* コンストラクタ */
    public MyList() {
        arr = new int[capacity];
    }

    /* リストの長さを取得（現在の要素数） */
    public int size() {
        return size;
    }

    /* リスト容量を取得する */
    public int capacity() {
        return capacity;
    }

    /* 要素にアクセス */
    public int get(int index) {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素を更新 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加 */
    public void add(int num) {
        // 要素数が容量を超えると、拡張機構が発動する
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 要素数を更新
        size++;
    }

    /* 中間に要素を挿入 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        // 要素数が容量を超えると、拡張機構が発動する
        if (size == capacity())
            extendCapacity();
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新
        size++;
    }

    /* 要素を削除 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        int num = arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新
        size--;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    public void extendCapacity() {
        // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // リストの容量を更新
        capacity = arr.length;
    }

    /* リストを配列に変換する */
    public int[] toArray() {
        int size = size();
        // 有効長の範囲内のリスト要素のみを変換
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* リストを初期化 */
        MyList nums = new MyList();
        /* 末尾に要素を追加 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("リスト nums = " + Arrays.toString(nums.toArray()) +
                " 、容量 = " + nums.capacity() + " 、長さ = " + nums.size());

        /* 中間に要素を挿入 */
        nums.insert(3, 6);
        System.out.println("インデックス 3 に数値 6 を挿入すると、nums = " + Arrays.toString(nums.toArray()));

        /* 要素を削除 */
        nums.remove(3);
        System.out.println("インデックス 3 の要素を削除すると、nums = " + Arrays.toString(nums.toArray()));

        /* 要素にアクセス */
        int num = nums.get(1);
        System.out.println("インデックス 1 の要素にアクセスし、num = " + num);

        /* 要素を更新 */
        nums.set(1, 0);
        System.out.println("インデックス 1 の要素を 0 に更新すると、nums = " + Arrays.toString(nums.toArray()));

        /* 拡張機構をテストする */
        for (int i = 0; i < 10; i++) {
            // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
            nums.add(i);
        }
        System.out.println("拡張後のリスト nums = " + Arrays.toString(nums.toArray()) +
                " 、容量 = " + nums.capacity() + " 、長さ = " + nums.size());
    }
}
