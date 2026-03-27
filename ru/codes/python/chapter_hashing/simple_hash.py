"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """Аддитивное хеширование"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """Мультипликативное хеширование"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """XOR-хеширование"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """Вращательное хеширование"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""Driver Code"""
if __name__ == "__main__":
    key = "Hello Algo"

    hash = add_hash(key)
    print(f"Аддитивное хешированиезначениеравно {hash}")

    hash = mul_hash(key)
    print(f"Мультипликативное хешированиезначениеравно {hash}")

    hash = xor_hash(key)
    print(f"XOR-хешированиезначениеравно {hash}")

    hash = rot_hash(key)
    print(f"Вращательное хешированиезначениеравно {hash}")
