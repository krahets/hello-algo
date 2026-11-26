/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 列表類別 */
class MyList {
  private:
    int *arr;             // 陣列（用來儲存列表元素）
    int arrCapacity = 10; // 列表容量
    int arrSize = 0;      // 列表長度（目前的元素數量）
    int extendRatio = 2;   // 每次擴充列表容量的倍數

  public:
    /* 建構方法 */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* 解構方法 */
    ~MyList() {
        delete[] arr;
    }

    /* 取得列表長度（目前的元素數量）*/
    int size() {
        return arrSize;
    }

    /* 取得列表容量 */
    int capacity() {
        return arrCapacity;
    }

    /* 存取元素 */
    int get(int index) {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 || index >= size())
            throw out_of_range("索引超出範圍");
        return arr[index];
    }

    /* 更新元素 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引超出範圍");
        arr[index] = num;
    }

    /* 在尾端加入元素 */
    void add(int num) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 在中間插入元素 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引超出範圍");
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size() == capacity())
            extendCapacity();
        // 將索引 index 起的所有元素往後移一格
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 刪除元素 */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("索引超出範圍");
        int num = arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        arrSize--;
        // 回傳刪除的元素
        return num;
    }

    /* 擴充列表容量 */
    void extendCapacity() {
        // 建立新陣列，長度為原陣列的 extendRatio 倍
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // 釋放記憶體
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 將列表轉為 Vector 以便印出 */
    vector<int> toVector() {
        // 僅轉換列表有效長度範圍內的元素
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* 範例主程式 */
int main() {
    /* 初始化列表 */
    MyList *nums = new MyList();
    /* 在尾端加入元素 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "列表 nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長度 = " << nums->size() << endl;

    /* 在中間插入元素 */
    nums->insert(3, 6);
    cout << "在索引 3 處插入數字 6，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 刪除元素 */
    nums->remove(3);
    cout << "刪除索引 3 處的元素，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 存取元素 */
    int num = nums->get(1);
    cout << "存取索引 1 處的元素，得到 num = " << num << endl;

    /* 更新元素 */
    nums->set(1, 0);
    cout << "將索引 1 處的元素更新為 0，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 測試容量擴充機制 */
    for (int i = 0; i < 10; i++) {
        // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        nums->add(i);
    }
    cout << "擴充後的列表 nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長度 = " << nums->size() << endl;

    // 釋放記憶體
    delete nums;

    return 0;
}
