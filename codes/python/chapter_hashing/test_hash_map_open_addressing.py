"""
File: test_hash_map_open_addressing.py
Created Time: 2026-10-27
Author: Shubham Padkonde
"""

import subprocess
import sys
import unittest
from pathlib import Path


class TestHashMapOpenAddressing(unittest.TestCase):
    def check_examples(self, code):
        root = Path(__file__).resolve().parents[3]
        for language in ("", "en", "ja", "ru", "zh-hant"):
            with self.subTest(language=language or "zh"):
                # A child process makes an unbounded probe fail with a timeout
                # rather than hanging the example test runner indefinitely.
                result = subprocess.run(
                    [
                        sys.executable,
                        "-c",
                        "from chapter_hashing.hash_map_open_addressing import "
                        "HashMapOpenAddressing\n" + code,
                    ],
                    cwd=root / language / "codes/python",
                    capture_output=True,
                    text=True,
                    timeout=5,
                )
                self.assertEqual(result.returncode, 0, result.stderr)

    def test_all_buckets_deleted(self):
        self.check_examples("""
m = HashMapOpenAddressing()
for key in range(4):
    m.put(key, str(key))
    m.remove(key)
assert m.size == 0 and m.capacity == 4
assert all(bucket is m.TOMBSTONE for bucket in m.buckets)
assert m.get(8) is None
m.remove(8)
assert m.size == 0
m.put(8, 'reused')
assert m.get(8) == 'reused' and m.size == 1 and m.capacity == 4
""")

    def test_deleted_and_live_buckets_without_empty_bucket(self):
        self.check_examples("""
m = HashMapOpenAddressing()
for key in range(4):
    m.put(key, str(key))
    if key != 1:
        m.remove(key)
assert None not in m.buckets
assert m.get(8) is None
m.put(8, 'new')
m.put(1, 'updated')
assert m.get(8) == 'new' and m.get(1) == 'updated' and m.size == 2
""")

    def test_collision_relocation_and_resize(self):
        self.check_examples("""
m = HashMapOpenAddressing()
for key in (0, 4, 8):
    m.put(key, str(key))
m.remove(0)
assert m.get(8) == '8'
assert m.buckets[0].key == 8
assert m.get(4) == '4' and m.size == 2
for key in range(20):
    m.put(key, str(key))
assert m.capacity > 4 and m.size == 20
for key in range(20):
    assert m.get(key) == str(key)
""")

    def test_repeated_insertion_and_deletion(self):
        self.check_examples("""
import random
rng = random.Random(0)
m = HashMapOpenAddressing()
expected = {}
for _ in range(1000):
    key = rng.randrange(32)
    if rng.randrange(3) == 0:
        expected[key] = str(key)
        m.put(key, str(key))
    else:
        expected.pop(key, None)
        m.remove(key)
    assert m.size == len(expected)
    for probe in range(32):
        assert m.get(probe) == expected.get(probe)
""")


if __name__ == "__main__":
    unittest.main()
