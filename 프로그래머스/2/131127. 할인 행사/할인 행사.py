import copy
from collections import defaultdict


def solution(want, number, discount):
    answer = 0
    fruit_dict = defaultdict(int)
    for (i, w) in enumerate(want):
        fruit_dict[w] = number[i]
    
    for i in range(len(discount)-9):
        is_all_ok = True
        temp_dict = copy.deepcopy(fruit_dict)
        for j in discount[i:i+10]:
            temp_dict[j] -= 1
        
        for value in temp_dict.values():
            if value > 0:
                is_all_ok = False
        if is_all_ok:
            answer += 1
        
    return answer