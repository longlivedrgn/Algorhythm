def solution(s):
    answer = -1
    stack = []
    
    for letter in s:
        if len(stack) == 0:
            stack.append(letter)
            continue
        if stack[-1] == letter:
            stack.pop(-1)
        else:
            stack.append(letter)
    
    if len(stack) == 0:
        return 1
    else:
        return 0