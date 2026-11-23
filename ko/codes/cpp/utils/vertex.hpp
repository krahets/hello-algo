/**
 * File: vertex.hpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <vector>

using namespace std;

/* 정점 클래스 */
struct Vertex {
    int val;
    Vertex(int x) : val(x) {
    }
};

/* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
vector<Vertex *> valsToVets(vector<int> vals) {
    vector<Vertex *> vets;
    for (int val : vals) {
        vets.push_back(new Vertex(val));
    }
    return vets;
}

/* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
vector<int> vetsToVals(vector<Vertex *> vets) {
    vector<int> vals;
    for (Vertex *vet : vets) {
        vals.push_back(vet->val);
    }
    return vals;
}
