def solution(order):
    answer = 0
    i = 1
    stack = []
    while i != len(order) + 1:
        stack.append(i)
        while len(stack) != 0 and stack[-1] == order[answer]:
            stack.pop()
            answer += 1
        i += 1
    return answer
            
    