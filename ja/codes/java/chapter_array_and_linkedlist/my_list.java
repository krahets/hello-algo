/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* リストクラス */
class MyList {
    private int[] arr; // 配列（リストの要素を格納する）
    private int capacity = 10; // リストの容量
    private int size = 0; // リストの長さ（現在の要素数）
    private int extendRatio = 2; // リストの容量を拡張する際の倍率

    /* コンストラクタ */
    public MyList() {
        arr = new int[capacity];
    }

    /* リストの長さ（現在の要素数）を取得する */
    public int size() {
        return size;
    }

    /* リストの容量を取得する */
    public int capacity() {
        return capacity;
    }

    /* 要素にアクセスする */
    public int get(int index) {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素を更新する */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加する */
    public void add(int num) {
        // 要素数が容量を超える場合、容量を拡張する
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 要素数を更新する
        size++;
    }

    /* 途中に要素を挿入する */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        // 要素数が容量を超える場合、容量を拡張する
        if (size == capacity())
            extendCapacity();
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新する
        size++;
    }

    /* 要素を削除する */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        int num = arr[index];
        // インデックス index より後の全要素を前に 1 つずらす
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新する
        size--;
        // 削除した要素を返す
        return num;
    }

    /* リストの容量を拡張する */
    public void extendCapacity() {
        // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // リストの容量を更新する
        capacity = arr.length;
    }

    /* リストを配列に変換する */
    public int[] toArray() {
        int size = size();
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* 実行用コード */
    public static void main(String[] args) {
        /* リストを初期化する */
        MyList nums = new MyList();
        /* 末尾に要素を追加する */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("リスト nums = " + Arrays.toString(nums.toArray()) +
                " 、容量 = " + nums.capacity() + " 、長さ = " + nums.size());

        /* 途中に要素を挿入する */
        nums.insert(3, 6);
        System.out.println("インデックス 3 に数値 6 を挿入した結果 nums = " + Arrays.toString(nums.toArray()));

        /* 要素を削除する */
        nums.remove(3);
        System.out.println("インデックス 3 の要素を削除した結果 nums = " + Arrays.toString(nums.toArray()));

        /* 要素にアクセスする */
        int num = nums.get(1);
        System.out.println("インデックス 1 の要素にアクセスした結果 num = " + num);

        /* 要素を更新する */
        nums.set(1, 0);
        System.out.println("インデックス 1 の要素を 0 に更新した結果 nums = " + Arrays.toString(nums.toArray()));

        /* 容量の拡張をテストする */
        for (int i = 0; i < 10; i++) {
            // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
            nums.add(i);
        }
        System.out.println("容量を拡張した後のリスト nums = " + Arrays.toString(nums.toArray()) +
                " 、容量 = " + nums.capacity() + " 、長さ = " + nums.size());
    }
}
