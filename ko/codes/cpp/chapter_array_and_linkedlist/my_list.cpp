/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 리스트 클래스 */
class MyList {
  private:
    int *arr;             // 배열(리스트 원소 저장)
    int arrCapacity = 10; // 리스트 용량
    int arrSize = 0;      // 리스트 길이(현재 원소 개수)
    int extendRatio = 2;   // 리스트의 용량을 확장할 때마다 적용하는 배수

  public:
    /* 생성자 */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* 소멸자 */
    ~MyList() {
        delete[] arr;
    }

    /* 리스트 길이(현재 원소 개수) 반환*/
    int size() {
        return arrSize;
    }

    /* 리스트 용량 반환 */
    int capacity() {
        return arrCapacity;
    }

    /* 원소 접근 */
    int get(int index) {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if (index < 0 || index >= size())
            throw out_of_range("인덱스가 범위를 벗어났다");
        return arr[index];
    }

    /* 원소 갱신 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("인덱스가 범위를 벗어났다");
        arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    void add(int num) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // 원소 개수를 갱신한다
        arrSize++;
    }

    /* 중간에 원소 삽입 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("인덱스가 범위를 벗어났다");
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (size() == capacity())
            extendCapacity();
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 원소 개수를 갱신한다
        arrSize++;
    }

    /* 원소 삭제 */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("인덱스가 범위를 벗어났다");
        int num = arr[index];
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 원소 개수를 갱신한다
        arrSize--;
        // 삭제한 원소를 반환한다
        return num;
    }

    /* 리스트 용량 확장 */
    void extendCapacity() {
        // 길이가 기존 배열의 extendRatio배인 새 배열 생성
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // 원래 배열의 모든 원소를 새 배열에 복사한다
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // 메모리 해제
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* 출력을 위해 리스트를 Vector로 변환 */
    vector<int> toVector() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* 실행 코드 */
int main() {
    /* 리스트 초기화 */
    MyList *nums = new MyList();
    /* 맨 뒤에 원소 추가 */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "리스트 nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "용량 = " << nums->capacity() << " , 길이 = " << nums->size() << endl;

    /* 중간에 원소 삽입 */
    nums->insert(3, 6);
    cout << "인덱스 3에 숫자 6을 삽입한 후 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 원소 삭제 */
    nums->remove(3);
    cout << "인덱스 3의 원소를 삭제한 후 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 원소 접근 */
    int num = nums->get(1);
    cout << "인덱스 1의 원소에 접근하여 얻은 num = " << num << endl;

    /* 원소 갱신 */
    nums->set(1, 0);
    cout << "인덱스 1의 원소를 0으로 갱신한 후 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* 용량 확장 동작 테스트 */
    for (int i = 0; i < 10; i++) {
        // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
        nums->add(i);
    }
    cout << "용량을 확장한 후 리스트 nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "용량 = " << nums->capacity() << " , 길이 = " << nums->size() << endl;

    // 메모리 해제
    delete nums;

    return 0;
}
