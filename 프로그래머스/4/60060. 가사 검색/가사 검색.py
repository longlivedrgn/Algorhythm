from bisect import bisect_left, bisect_right

def count_by_range(a, left_value, right_value):
    right_index = bisect_right(a, right_value)
    left_index = bisect_left(a, left_value)

    return right_index - left_index

# words를 문자열의 길이 별로 나눠서 담기 위한 list
array = [[] for _ in range(10001)]

# words를 길이마다 나누어서 reverse된 것을 담기위한 list
reversed_array = [[] for _ in range(10001)]

def solution(words, queries):
    answer = []
    for word in words: # 배열의 길이에 맞게 array와 reversed_array에 담기
        array[len(word)].append(word)
        reversed_array[len(word)].append(word[::-1])
    
    for i in range(10001):
        # 각각의 값들을 sort하기
        array[i].sort()
        reversed_array[i].sort()
    
    for q in queries:
        if q[0] != "?": # 접미사라면?
            res = count_by_range(array[len(q)], q.replace("?", "a"), q.replace("?", "z")) # 한번에 계산이 가능하다...
        else:
            res = count_by_range(reversed_array[len(q)], q[::-1].replace("?", "a"), q[::-1].replace("?", "z"))
        
        answer.append(res)
    
    return answer