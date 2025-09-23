/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* リストクラス */
class MyList {
  private:
    int *arr;             // 配列（リスト要素を格納）
    int arrCapacity = 10; // リストの容量
    int arrSize = 0;      // リストの長さ（現在の要素数）
    int extendRatio = 2;   // リスト拡張時の倍率

  public:
    /* コンストラクタ */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* デストラクタ */
    ~MyList() {
        delete[] arr;
    }

    /* リストの長さを取得（現在の要素数）*/
    int size() {
        return arrSize;
    }

    /* リストの容量を取得 */
    int capacity() {
        return arrCapacity;
    }

    /* 要素にアクセス */
    int get(int index) {
        // インデックスが範囲外の場合、例外をスロー（以下同様）
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        return arr[index];
    }

    /* 要素を更新 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        arr[index] = num;
    }

    /* 末尾に要素を追加 */
    void add(int num) {
        // 要素数が容量を超えた場合、拡張メカニズムをトリガー
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 要素数を更新
        arrSize++;
    }

    /* 中間に要素を挿入 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // 要素数が容量を超えた場合、拡張メカニズムをトリガー
        if (size() == capacity())
            extendCapacity();
        // `index`より後のすべての要素を1つ後ろに移動
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新
        arrSize++;
    }

    /* 要素を削除 */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        int num = arr[index];
        // `index`より後のすべての要素を1つ前に移動
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新
        arrSize--;
        // 削除された要素を返却
        return num;
    }

    /* リストを拡張 */
    void extendCapacity() {
        // 元の配列のextendRatio倍の長さで新しい配列を作成
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 元の配列のすべての要素を新しい配列にコピー
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // メモリを解放
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* リストをVectorに変換して印刷用に使用 */
    vector<int> toVector() {
        // 有効な長さ範囲内の要素のみを変換
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* ドライバーコード */
int main() {
    /* リストを初期化 */
    MyList *nums = new MyList();
    /* 末尾に要素を追加 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    /* 中間に要素を挿入 */
    nums->insert(3, 6);
    cout << "Insert the number 6 at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素を削除 */
    nums->remove(3);
    cout << "Remove the element at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素にアクセス */
    int num = nums->get(1);
    cout << "Access the element at index 1, obtained num = " << num << endl;

    /* 要素を更新 */
    nums->set(1, 0);
    cout << "Update the element at index 1 to 0, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 拡張メカニズムをテスト */
    for (int i = 0; i < 10; i++) {
        // i = 5の時、リストの長さがリストの容量を超え、この時点で拡張メカニズムがトリガーされる
        nums->add(i);
    }
    cout << "After extending, list nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    // メモリを解放
    delete nums;

    return 0;
}