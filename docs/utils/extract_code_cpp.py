"""
File: extract_code_cpp.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksCpp(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()

        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)(static|)\s*(|\S+)\s*(\w+)(\(.*\))\s+\{'
        self.class_pattern = r'(public|)\s*(class|struct)\s+(\w+)\s*\{'
        
        self.func_pattern_keys = ["total", "ind", "static", "return", "label", "args"]
        self.class_pattern_keys = ["total", "scope", "type", "label"]


# for code_path in glob.glob("codes/cpp/chapter_*/my_heap.cpp"):
#     ext = ExtractCodeBlocksCpp()
#     ext.extract(code_path)
