"""
File: extract_code_python.py
Created Time: 2023-02-06
Author: Krahets (krahets@163.com)
"""

import re
import os
import os.path as osp
import glob

class ExtractCodeBlocksPython:
    def __init__(self, file_path) -> None:
        self.file_path = file_path
        with open(file_path) as f:
            self.lines = f.readlines()
            self.content = "".join(self.lines)
            
        # Regular expression pattern to match function names and class names
        self.func_pattern = re.compile(r'(\s*)def\s+(\w+)\s*\(')
        self.class_pattern = re.compile(r'class\s+(\w+)')
        
        # Detect and extract all the classes and fucntions
        self.classes = self.extract_class_blocks()
        self.functions = self.extract_function_blocks()

    def search_block(self, header_line, indentation):
        """
        Search class/function block given the header_line and indentation
        """
        start_line, end_line = 0, len(self.lines)
        # Search the code
        for i in range(header_line + 1, len(self.lines)):
            if re.search("^\s*\n|^\s{ind}\s+.+\n".replace("ind", str(indentation)),
                         self.lines[i]) is None:
                end_line = i
                break
        # Search the header comment
        for i in range(header_line - 1, -1, -1):
            if re.search('^\s{ind}""".+'.replace("ind", str(indentation)), 
                         self.lines[i]) is not None:
                start_line = i
                break
        func_block = self.lines[start_line:end_line] 
        # Remove empty lines at bottom
        for i in range(len(func_block) - 1, -1, -1):
            if re.search("^\s*\n", func_block[i]) is None:
                break
            end_line -= 1
        
        return start_line, end_line, self.lines[start_line:end_line]
        

    def extract_function_blocks(self, indentation=0, start_line=-1, end_line=-1):
        """
        Extract all the functions with given indentation
        """
        functions = {}
        
        if start_line == -1:
            start_line = 0
        if end_line == -1:
            end_line = len(self.lines) - 1
            
        for line_num in range(start_line, end_line + 1):
            # Search the function header
            func_match = self.func_pattern.match(self.lines[line_num])
            if func_match is None: continue
            # The function should match the input indentation
            if len(func_match.group(1)) != indentation: continue
            header_line = line_num
            
            # Search the block from the header line
            start_line, end_line, func_block = self.search_block(header_line, indentation)
            # Construct the functions dict
            func_label = func_match.group(2)
            functions[func_label] = {
                "indentation": indentation,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": func_block,
            }
        
        return functions

    def extract_class_blocks(self):
        """
        Extract all the classes with given indentation
        """
        classes = {}
        
        for line_num, line in enumerate(self.lines):
            # Search the class header
            class_match = self.class_pattern.match(line)
            if class_match is None: continue
            header_line = line_num
            
            # Search the block from the header line
            start_line, end_line, class_block = self.search_block(header_line, 0)
            # Construct the classes dict
            class_label = class_match.group(1)
            classes[class_label] = {
                "indentation": 0,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": class_block,
                "functions": self.extract_function_blocks(
                    indentation=4, start_line=start_line, end_line=end_line)
            }
        
        return classes
