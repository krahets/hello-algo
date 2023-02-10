"""
File: extract_code_java.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))


class ExtractCodeBlocksJava:
    def __init__(self) -> None:
        self.ind = 4
        
        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)(public|private|)\s*(static|)\s*(\S+)\s+(\w+)(\(.*\))\s+\{'
        self.class_pattern = r'(public|)\s*class\s+(\w+)\s*\{'
        
        self.func_pattern_keys = ["total", "ind", "scope", "static", "return", "label", "args"]
        self.class_pattern_keys = ["total", "scope", "label"]
        
        # Pattern to match the start and end of a block
        self.block_start_pattern = '^\s{ind}\/\*.+\*\/'
        self.block_end_pattern = '^\s{ind}\}'
        self.block_start_shift = 0
        self.block_end_shift = 0

    def extract(self, file_path):
        """
        Extract classes and functions from a markdown document
        """
        if not osp.isfile(file_path):
            return None
        
        self.file_path = file_path
        with open(file_path) as f:
            self.lines = f.readlines()
            self.content = "".join(self.lines)

        # Detect and extract all the classes and fucntions
        classes = self.extract_class_blocks()
        funcs = self.extract_function_blocks()

        self.post_process(classes, funcs)

        return {
            "classes": classes,
            "funcs": funcs,
        }

    def search_block(self, header_line, indentation):
        """
        Search class/function block given the header_line and indentation
        """
        start_line, end_line = 0, len(self.lines)

        block_end_pattern = re.compile(
            self.block_end_pattern.replace("ind", str(indentation)))
        block_start_pattern = re.compile(
            self.block_start_pattern.replace("ind", str(indentation)))

        # Search the code
        for i in range(header_line + 1, len(self.lines)):
            if re.match(block_end_pattern, self.lines[i]) is not None:
                end_line = i + self.block_end_shift
                break
        # Search the header comment
        for i in range(header_line - 1, -1, -1):
            if re.search(block_start_pattern, self.lines[i]) is not None:
                start_line = i + self.block_start_shift
                break

        return start_line, end_line, self.lines[start_line:end_line + 1]

    def extract_function_blocks(self, indentation=0, start_line=-1, end_line=-1):
        """
        Extract all the functions with given indentation
        """
        funcs = {}

        if start_line == -1:
            start_line = 0
        if end_line == -1:
            end_line = len(self.lines) - 1

        func_pattern = re.compile(self.func_pattern)

        for line_num in range(start_line, end_line + 1):
            # Search the function header
            func_match = func_pattern.match(self.lines[line_num])
            if func_match is None:
                continue
            # The function should match the input indentation
            if len(func_match.group(self.func_pattern_keys.index("ind"))) != indentation:
                continue
            header_line = line_num

            # Search the block from the header line
            start_line, end_line, func_block = self.search_block(
                header_line, indentation)
            # Construct the funcs dict
            func_label = func_match.group(self.func_pattern_keys.index("label"))
            funcs[func_label] = {
                "indentation": indentation,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": func_block,
            }

        return funcs

    def extract_class_blocks(self):
        """
        Extract all the classes with given indentation
        """
        classes = {}
        class_pattern = re.compile(self.class_pattern)

        for line_num, line in enumerate(self.lines):
            # Search the class header
            class_match = class_pattern.match(line)
            if class_match is None:
                continue
            header_line = line_num

            # Search the block from the header line
            start_line, end_line, class_block = self.search_block(
                header_line, 0)
            # Construct the classes dict
            class_label = class_match.group(self.class_pattern_keys.index("label"))
            classes[class_label] = {
                "indentation": 0,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": class_block,
                "funcs": self.extract_function_blocks(
                    indentation=self.ind, start_line=start_line, end_line=end_line)
            }

        return classes

    def post_process(self, classes, funcs):
        """
        Process the classes and functions
        """
        def remove_keyword(func):
            block = func["block"]
            header_line = func["line_number"]["header"] - \
                func["line_number"]["start"]
            block[header_line] = block[header_line] \
                .replace("static ", "", 1).replace("public ", "", 1).replace("private ", "", 1)
        for clas in classes.values():
            remove_keyword(clas)
            for func in clas["funcs"].values():
                remove_keyword(func)
        for func in funcs.values():
            remove_keyword(func)

# ext = ExtractCodeBlocksJava()
# ext.extract("codes/java/chapter_array_and_linkedlist/my_list.java")
