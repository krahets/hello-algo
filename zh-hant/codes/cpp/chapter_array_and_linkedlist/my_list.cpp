/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 串列類別 */
class MyList {
  private:
    int *arr;             // 陣列（儲存串列元素）
    int arrCapacity = 10; // 串列容量
    int arrSize = 0;      // 串列長度（當前元素數量）
    int extendRatio = 2;   // 每次串列擴容的倍數

  public:
    /* 建構子 */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* 析構方法 */
    ~MyList() {
        delete[] arr;
    }

    /* 獲取串列長度（當前元素數量）*/
    int size() {
        return arrSize;
    }

    /* 獲取串列容量 */
    int capacity() {
        return arrCapacity;
    }

    /* 訪問元素 */
    int get(int index) {
        // 索引如果越界，則丟擲異常，下同
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        return arr[index];
    }

    /* 更新元素 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        arr[index] = num;
    }

    /* 在尾部新增元素 */
    void add(int num) {
        // 元素數量超出容量時，觸發擴容機制
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 在中間插入元素 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        // 元素數量超出容量時，觸發擴容機制
        if (size() == capacity())
            extendCapacity();
        // 將索引 index 以及之後的元素都向後移動一位
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
            throw out_of_range("索引越界");
        int num = arr[index];
        // 將索引 index 之後的元素都向前移動一位
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        arrSize--;
        // 返回被刪除的元素
        return num;
    }

    /* 串列擴容 */
    void extendCapacity() {
        // 新建一個長度為原陣列 extendRatio 倍的新陣列
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 將原陣列中的所有元素複製到新陣列
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // 釋放記憶體
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 將串列轉換為 Vector 用於列印 */
    vector<int> toVector() {
        // 僅轉換有效長度範圍內的串列元素
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* 初始化串列 */
    MyList *nums = new MyList();
    /* 在尾部新增元素 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "串列 nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長度 = " << nums->size() << endl;

    /* 在中間插入元素 */
    nums->insert(3, 6);
    cout << "在索引 3 處插入數字 6 ，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 刪除元素 */
    nums->remove(3);
    cout << "刪除索引 3 處的元素，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 訪問元素 */
    int num = nums->get(1);
    cout << "訪問索引 1 處的元素，得到 num = " << num << endl;

    /* 更新元素 */
    nums->set(1, 0);
    cout << "將索引 1 處的元素更新為 0 ，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 測試擴容機制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
        nums->add(i);
    }
    cout << "擴容後的串列 nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，長度 = " << nums->size() << endl;

    // 釋放記憶體
    delete nums;

    return 0;
}
