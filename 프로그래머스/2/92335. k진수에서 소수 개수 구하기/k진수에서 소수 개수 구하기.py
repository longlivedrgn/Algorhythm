import math


def solution(n, k):
    answer = 0
    strings = ""
    
    # k 진수로 일단 만들기!..
    while True:
        if n < k:
            strings = str(n) + strings
            break
        else:
            strings = str(n % k) + strings
            n = n // k
            
    # 글자 빼내기!..
    splited_numbers = strings.split("0")

    for number in splited_numbers:
        if number == "" or number == "1": # 만약 ""이거나 "1"이면 넘어간다!..
            continue
        if number == "2": # 만약 2라면 갯수를 하나 추가하고 다음 걸로 넘어간다!..
            answer += 1
            continue
            
        for m in range(3, int(math.sqrt(int(number))+1)):
            if int(number) % m == 0: # 이러면 약수가 존재하는 것이다!..
                break
        else:
            answer += 1
            
    return answer