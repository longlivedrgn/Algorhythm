def solution(number, k):
    answer = []
    for i in number:
        if len(answer) == 0:
            answer.append(i)
            continue
        if k > 0:
            while len(answer) > 0 and answer[-1] < i and k > 0:
                answer.pop()
                k -= 1
        answer.append(i)
    if k > 0: # 남은 게 있다면?..
        answer = answer[:-k]
        
    return "".join(answer)