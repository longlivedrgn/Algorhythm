def count_1(m):
    temp_n = m
    answer = []
    while temp_n != 1:
        answer.append(temp_n % 2)
        temp_n = temp_n // 2
        
    temp_count = answer.count(1) + 1
    
    return temp_count

def solution(n):
    answer = 0
    # n을 이진수로 변경한다.
    first_one_count = count_1(n)
    
    while True:
        n += 1
        if first_one_count == count_1(n):
            return n