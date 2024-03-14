/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 列表类 */
class MyList {
  private:
    int *arr;             // 数组（存储列表元素）
    int arrCapacity = 10; // 列表容量
    int arrSize = 0;      // 列表长度（当前元素数量）
    int extendRatio = 2;   // 每次列表扩容的倍数

  public:
    /* 构造方法 */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* 析构方法 */
    ~MyList() {
        delete[] arr;
    }

    /* 获取列表长度（当前元素数量）*/
    int size() {
        return arrSize;
    }

    /* 获取列表容量 */
    int capacity() {
        return arrCapacity;
    }

    /* 访问元素 */
    int get(int index) {
        // 索引如果越界，则抛出异常，下同
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

    /* 在尾部添加元素 */
    void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 更新元素数量
        arrSize++;
    }

    /* 在中间插入元素 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (size() == capacity())
            extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素数量
        arrSize++;
    }

    /* 删除元素 */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        int num = arr[index];
        // 将索引 index 之后的元素都向前移动一位
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素数量
        arrSize--;
        // 返回被删除的元素
        return num;
    }

    /* 列表扩容 */
    void extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // 释放内存
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 将列表转换为 Vector 用于打印 */
    vector<int> toVector() {
        // 仅转换有效长度范围内的列表元素
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* 初始化列表 */
    MyList *nums = new MyList();
    /* 在尾部添加元素 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "列表 nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，长度 = " << nums->size() << endl;

    /* 在中间插入元素 */
    nums->insert(3, 6);
    cout << "在索引 3 处插入数字 6 ，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 删除元素 */
    nums->remove(3);
    cout << "删除索引 3 处的元素，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 访问元素 */
    int num = nums->get(1);
    cout << "访问索引 1 处的元素，得到 num = " << num << endl;

    /* 更新元素 */
    nums->set(1, 0);
    cout << "将索引 1 处的元素更新为 0 ，得到 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 测试扩容机制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums->add(i);
    }
    cout << "扩容后的列表 nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "容量 = " << nums->capacity() << " ，长度 = " << nums->size() << endl;

    // 释放内存
    delete nums;

    return 0;
}
