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
    int arrCapacity = 10; // リスト容量
    int arrSize = 0;      // リストの長さ（現在の要素数）
    int extendRatio = 2;   // リスト拡張時の増加倍率

  public:
    /* コンストラクタ */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* デストラクタメソッド */
    ~MyList() {
        delete[] arr;
    }

    /* リストの長さを取得（現在の要素数） */
    int size() {
        return arrSize;
    }

    /* リスト容量を取得する */
    int capacity() {
        return arrCapacity;
    }

    /* 要素にアクセス */
    int get(int index) {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外");
        return arr[index];
    }

    /* 要素を更新 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外");
        arr[index] = num;
    }

    /* 末尾に要素を追加 */
    void add(int num) {
        // 要素数が容量を超えると、拡張機構が発動する
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 要素数を更新
        arrSize++;
    }

    /* 中間に要素を挿入 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("インデックスが範囲外");
        // 要素数が容量を超えると、拡張機構が発動する
        if (size() == capacity())
            extendCapacity();
        // index 以降の要素をすべて 1 つ後ろへずらす
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
            throw out_of_range("インデックスが範囲外");
        int num = arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新
        arrSize--;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    void extendCapacity() {
        // 元の配列の `extendRatio` 倍の長さを持つ新しい配列を作成する
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 元の配列の全要素を新しい配列にコピー
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // メモリを解放する
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 出力用にリストを Vector に変換 */
    vector<int> toVector() {
        // 有効長の範囲内のリスト要素のみを変換
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* リストを初期化 */
    MyList *nums = new MyList();
    /* 末尾に要素を追加 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "リスト nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長さ = " << nums->size() << endl;

    /* 中間に要素を挿入 */
    nums->insert(3, 6);
    cout << "インデックス 3 に数値 6 を挿入し、nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素を削除 */
    nums->remove(3);
    cout << "インデックス 3 の要素を削除すると、nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 要素にアクセス */
    int num = nums->get(1);
    cout << "インデックス 1 の要素にアクセスすると、num = " << num << endl;

    /* 要素を更新 */
    nums->set(1, 0);
    cout << "インデックス 1 の要素を 0 に更新すると、nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 拡張機構をテストする */
    for (int i = 0; i < 10; i++) {
        // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
        nums->add(i);
    }
    cout << "拡張後のリスト nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長さ = " << nums->size() << endl;

    // メモリを解放する
    delete nums;

    return 0;
}
