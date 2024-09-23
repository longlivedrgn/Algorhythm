from collections import defaultdict
def solution(weights):
    answer = 0
    dict = defaultdict(int)
    for weight in weights:
        dict[weight] += 1
    
    for (weight, count) in dict.items():
        if count > 1:
            answer += (count * (count-1)) / 2
        if weight * 2 in dict:
            answer += count * (dict[weight*2])
        if weight * (3/2) in dict:
            answer += count * (dict[weight * (3/2)])
        if weight * (4/3) in dict:
            answer += count * (dict[weight * (4/3)])
    return answer