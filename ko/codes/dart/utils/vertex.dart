/**
 * File: Vertex.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 정점 클래스 */
class Vertex {
  int val;
  Vertex(this.val);

  /* 값 리스트 vals를 받아 정점 리스트 vets를 반환한다. */
  static List<Vertex> valsToVets(List<int> vals) {
    List<Vertex> vets = [];
    for (int i in vals) {
      vets.add(Vertex(i));
    }
    return vets;
  }

  /* 정점 리스트 vets를 받아 값 리스트 vals를 반환한다. */
  static List<int> vetsToVals(List<Vertex> vets) {
    List<int> vals = [];
    for (Vertex vet in vets) {
      vals.add(vet.val);
    }
    return vals;
  }
}
