"""
File: extract_code_python.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import os
import os.path as osp

class ExtractCodeBlocksJava:
    def __init__(self) -> None:        
        self.langs = ["java"]
        # Pattern to match function names and class names
        self.func_pattern = r'(\s+)(public|private|)\s*(static|)\s*(\S+)\s+(\w+)(\(.*\))\s+\{'
        self.class_pattern = r'(public|)\s*class\s+(\w+)\s*\{'
        # Pattern to match the start and end of a block
        self.block_end_pattern = '^\s{ind}\}'
        self.block_start_pattern = '^\s{ind}\/\*.+\*\/'
        
    def extract(self, file_path):
        self.file_path = file_path
        with open(file_path) as f:
            self.lines = f.readlines()
            self.content = "".join(self.lines)
        # Detect and extract all the classes along with its fucntions
        classes = self.extract_class_blocks()
        # Remove 'static'
        self.post_process(classes)
        
        return {
            "classes": classes
        }
        
    def post_process(self, classes):
        for clas in classes.values():
            funcs = clas["funcs"]
            for func in funcs.values():
                for i, line in enumerate(func["block"]):
                    if "static " in line:
                        func["block"][i] = line.replace("static ", "")
                        break
                    

    def search_block(self, header_line, indentation):
        """
        Search class/function block given the header_line and indentation
        """
        start_line, end_line = 0, len(self.lines)
        
        block_end_pattern = re.compile(self.block_end_pattern.replace("ind", str(indentation)))
        block_start_pattern = re.compile(self.block_start_pattern.replace("ind", str(indentation)))
        
        # Search the code
        for i in range(header_line + 1, len(self.lines)):
            if re.match(block_end_pattern, self.lines[i]) is not None:
                end_line = i
                break
        # Search the header comment
        for i in range(header_line - 1, -1, -1):
            if re.search(block_start_pattern, self.lines[i]) is not None:
                start_line = i
                break
        code_block = self.lines[start_line:end_line + 1] 
        # Remove empty lines at bottom
        for i in range(len(code_block) - 1, -1, -1):
            if re.search("^\s*\n", code_block[i]) is None:
                break
            end_line -= 1
        
        return start_line, end_line, self.lines[start_line:end_line + 1]
        

    def extract_function_blocks(self, indentation=4, start_line=-1, end_line=-1):
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
            if func_match is None: continue
            # The function should match the input indentation
            if len(func_match.group(1)) != indentation: continue
            header_line = line_num
            
            # Search the block from the header line
            start_line, end_line, func_block = self.search_block(header_line, indentation)
            # Construct the funcs dict
            func_label = func_match.group(5)
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
            if class_match is None: continue
            header_line = line_num
            
            # Search the block from the header line
            start_line, end_line, class_block = self.search_block(header_line, 0)
            # Construct the classes dict
            class_label = class_match.group(2)
            classes[class_label] = {
                "indentation": 0,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": class_block,
                "funcs": self.extract_function_blocks(
                    indentation=4, start_line=start_line, end_line=end_line)
            }
        
        return classes

# ext = ExtractCodeBlocksJava()
# ext.extract("codes/java/chapter_array_and_linkedlist/array.java")
# ext.extract("codes/java/chapter_array_and_linkedlist/my_list.java")
