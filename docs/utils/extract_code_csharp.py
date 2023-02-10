"""
File: extract_code_csharp.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksCSharp(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()

        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)(public|private|)\s*(static|)\s*(|\S+)\s*(\w+)(\(.*\))'
        self.class_pattern = r'(public|)\s*(class|struct)\s+(\w+)\s*\n'
        
        self.func_pattern_keys = ["total", "ind", "scope", "static", "return", "label", "args"]
        self.class_pattern_keys = ["total", "scope", "type", "label"]

# for code_path in glob.glob("codes/csharp/chapter_*/array.cs"):
#     ext = ExtractCodeBlocksCSharp()
#     res = ext.extract(code_path)
#     pass