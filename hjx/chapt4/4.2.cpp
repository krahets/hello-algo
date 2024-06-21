#include <iostream>

using namespace std;

// template <typename T>
// class ListNode;

// void ergodic_list(ListNode<T>* list);
template <typename T>
void ergodic_list(T* _list);

template <typename T>
void del_list(T* _list);

template <typename T>
void insert_list(T* _list, T* value);

template <typename T>
class ListNode {
public:
    ListNode(T value)
        : _value(value)
    {
        next = nullptr;
    };
    ListNode<T>* next;
    // template <typename T>
    // friend void ergodic_list(ListNode<T>* _list);//error
    friend void ergodic_list<>(ListNode<T>* _list); //OK
    // friend void ergodic_list<ListNode<T>>(ListNode<T>* _list); //OK,but void ergodic_list(ListNode<T>* list);error
    friend void insert_list<ListNode<T>>(ListNode<T>* _list, ListNode<T>* value);
    friend void del_list<>(ListNode<T>* _list);
    void distory();

private:
    T _value;
};

template <typename T>
void ListNode<T>::distory()
{
    while (this->next != nullptr) {
        del_list(this);
    }
}

template <typename T>
// void ergodic_list(ListNode<T>* _list)
void ergodic_list(T* _list)
{
    T* current = _list;
    while (current != nullptr) {
        std::cout << current->_value << " ";
        current = current->next;
    }
    std::cout << std::endl;
}

template <typename T>
void insert_list(T* _list, T* value)
{
    if (value == nullptr)
        return;
    T* _next = _list->next;
    _list->next = value;
    value->next = _next;
    // value->next = _list->next;
    // _list->next = value;
}

template <typename T>
void del_list(T* _list)
{
    if (_list->next == nullptr) {
        return;
    }
    T* _next = _list->next;
    _list->next = _next->next;
    delete _next;
}

int main(int argc, char** argv)
{
    ListNode<int>* no0 = new ListNode<int>(1);
    ListNode<int>* no1 = new ListNode<int>(3);
    ListNode<int>* no2 = new ListNode<int>(2);
    ListNode<int>* no3 = new ListNode<int>(5);
    ListNode<int>* no4 = new ListNode<int>(4);
    ListNode<int>* no5 = new ListNode<int>(40);

    no0->next = no1;
    no1->next = no2;
    no2->next = no3;
    no3->next = no4;
    ergodic_list(no0);
    insert_list(no1, no5);
    //1,3,40,2,5,4
    ergodic_list(no0);
    del_list(no1);
    ergodic_list(no0);
    no0->distory();
    ergodic_list(no0);
    delete no0;
    // delete no1;
    // delete no2;
    // delete no3;
    // delete no4;
    // delete no5;

    return 0;
}