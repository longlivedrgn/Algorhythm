
from collections import defaultdict
import copy

def solution(str1, str2):
    
    str1 = str1.upper()
    str2 = str2.upper()
    
    # 다중집합 구하기
    A, B = [], [] 
    for i in range(len(str1)-1):
        str = str1[i:i+2] # 두글자씩 끊어
        if str.isalpha(): # 영문자로 된 글자만 다중집합의 원소로 만듦
            A.append(str)
    for i in range(len(str2)-1):
        str = str2[i:i+2] # 두글자씩 끊어
        if str.isalpha(): # 영문자로 된 글자만 다중집합의 원소로 만듦
            B.append(str)
    
    
    str1_dict = defaultdict(int)
    str2_dict = defaultdict(int)
    union_dict = defaultdict(int)
    for i in A:
        str1_dict[i] = str1_dict[i] + 1
    for m in B:
        str2_dict[m] = str2_dict[m] + 1
    
    temp_str1 = copy.deepcopy(str1_dict)
    
    union_count = 0 ## 교집합 요소의 갯수 계산~!
    for m in B:
        if m in str1_dict:
            if temp_str1[m] > 0:
                temp_str1[m] -= 1
                union_count += 1
        
    all_union_count = 0
        
    for (key, value) in str2_dict.items():
        if key in str1_dict:
            if str1_dict[key] < str2_dict[key]:
                str1_dict[key] = str2_dict[key]
        else:
            str1_dict[key] = str2_dict[key]
    for value in str1_dict.values():
        all_union_count += value
    if all_union_count == 0:
        return 65536
    return int((union_count / all_union_count) * 65536)