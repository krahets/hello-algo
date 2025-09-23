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
    private int size = 0; // リスト長（現在の要素数）
    private int extendRatio = 2; // リストの各拡張倍率

    /* コンストラクタ */
    public MyList() {
        arr = new int[capacity];
    }

    /* リスト長を取得（現在の要素数） */
    public int size() {
        return size;
    }

    /* リスト容量を取得 */
    public int capacity() {
        return capacity;
    }

    /* 要素へのアクセス */
    public int get(int index) {
        // インデックスが範囲外の場合、以下のように例外をスロー
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素の更新 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加 */
    public void add(int num) {
        // 要素数が容量を超える場合、拡張メカニズムを実行
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
        // 要素数が容量を超える場合、拡張メカニズムを実行
        if (size == capacity())
            extendCapacity();
        // `index` より後のすべての要素を1つ後ろに移動
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新
        size++;
    }

    /* 要素の削除 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("インデックスが範囲外です");
        int num = arr[index];
        // `index` より後のすべての要素を1つ前に移動
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新
        size--;
        // 削除された要素を返す
        return num;
    }

    /* リストを拡張 */
    public void extendCapacity() {
        // 元の配列の長さを extendRatio 倍した新しい配列を作成し、元の配列を新しい配列にコピー
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // リスト容量を更新
        capacity = arr.length;
    }

    /* リストを配列に変換 */
    public int[] toArray() {
        int size = size();
        // 有効な長さ範囲内の要素のみを変換
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* ドライバーコード */
    public static void main(String[] args) {
        /* リストの初期化 */
        MyList nums = new MyList();
        /* 末尾に要素を追加 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("リスト nums = " + Arrays.toString(nums.toArray()) +
                ", 容量 = " + nums.capacity() + ", 長さ = " + nums.size());

        /* 中間に要素を挿入 */
        nums.insert(3, 6);
        System.out.println("インデックス3に数値6を挿入し、nums = " + Arrays.toString(nums.toArray()));

        /* 要素の削除 */
        nums.remove(3);
        System.out.println("インデックス3の要素を削除し、nums = " + Arrays.toString(nums.toArray()));

        /* 要素へのアクセス */
        int num = nums.get(1);
        System.out.println("インデックス1の要素にアクセス、取得した num = " + num);

        /* 要素の更新 */
        nums.set(1, 0);
        System.out.println("インデックス1の要素を0に更新し、nums = " + Arrays.toString(nums.toArray()));

        /* 拡張メカニズムのテスト */
        for (int i = 0; i < 10; i++) {
            // i = 5 の時、リスト長がリスト容量を超え、この時点で拡張メカニズムが実行される
            nums.add(i);
        }
        System.out.println("拡張後、リスト nums = " + Arrays.toString(nums.toArray()) +
                ", 容量 = " + nums.capacity() + ", 長さ = " + nums.size());
    }
}