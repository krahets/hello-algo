/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* リストクラス */
class MyList {
  private:
    int *arr;             // 配列（リストの要素を格納する）
    int arrCapacity = 10; // リストの容量
    int arrSize = 0;      // リストの長さ（現在の要素数）
    int extendRatio = 2;   // リストの容量を拡張する際の倍率

  public:
    /* コンストラクタ */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* デストラクタ */
    ~MyList() {
        delete[] arr;
    }

    /* リストの長さ（現在の要素数）を取得する*/
    int size() {
        return arrSize;
    }

    /* リストの容量を取得する */
    int capacity() {
        return arrCapacity;
    }

    /* 要素にアクセスする */
    int get(int index) {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素を更新する */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加する */
    void add(int num) {
        // 要素数が容量を超える場合、容量を拡張する
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 要素数を更新する
        arrSize++;
    }

    /* 途中に要素を挿入する */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外です");
        // 要素数が容量を超える場合、容量を拡張する
        if (size() == capacity())
            extendCapacity();
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新する
        arrSize++;
    }

    /* 要素を削除する */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外です");
        int num = arr[index];
        // インデックス index より後の全要素を前に 1 つずらす
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新する
        arrSize--;
        // 削除した要素を返す
        return num;
    }

    /* リストの容量を拡張する */
    void extendCapacity() {
        // 元の配列の extendRatio 倍の長さの新しい配列を作成する
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 元の配列の全要素を新しい配列にコピーする
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // メモリを解放する
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 表示用にリストを Vector に変換する */
    vector<int> toVector() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* 実行用コード */
int main() {
    /* リストを初期化する */
    MyList *nums = new MyList();
    /* 末尾に要素を追加する */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "リスト nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " 、長さ = " << nums->size() << endl;

    /* 途中に要素を挿入する */
    nums->insert(3, 6);
    cout << "インデックス 3 に数値 6 を挿入した結果 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素を削除する */
    nums->remove(3);
    cout << "インデックス 3 の要素を削除した結果 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素にアクセスする */
    int num = nums->get(1);
    cout << "インデックス 1 の要素にアクセスした結果 num = " << num << endl;

    /* 要素を更新する */
    nums->set(1, 0);
    cout << "インデックス 1 の要素を 0 に更新した結果 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 容量の拡張をテストする */
    for (int i = 0; i < 10; i++) {
        // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        nums->add(i);
    }
    cout << "容量を拡張した後のリスト nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " 、長さ = " << nums->size() << endl;

    // メモリを解放する
    delete nums;

    return 0;
}
