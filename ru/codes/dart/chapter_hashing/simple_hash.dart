/**
 * File: simple_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Аддитивное хеширование */
int addHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Мультипликативное хеширование */
int mulHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* XOR-хеширование */
int xorHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash ^= key.codeUnitAt(i);
  }
  return hash & MODULUS;
}

/* Вращательное хеширование */
int rotHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = ((hash << 4) ^ (hash >> 28) ^ key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Dirver Code */
void main() {
  String key = "Hello Algo";

  int hash = addHash(key);
  print("Значение аддитивного хеширования равно $hash");

  hash = mulHash(key);
  print("Значение мультипликативного хеширования равно $hash");

  hash = xorHash(key);
  print("Значение XOR-хеширования равно $hash");

  hash = rotHash(key);
  print("Значение вращательного хеширования равно $hash");
}
