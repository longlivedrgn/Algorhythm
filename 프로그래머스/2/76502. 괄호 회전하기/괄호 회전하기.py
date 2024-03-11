from collections import deque

def isCorrect(strings):
    queue = deque()
    queue.append(strings[0])
    for (idx, str) in enumerate(strings):
        if idx == 0:
            continue
        if str == "[" or str == "(" or str == "{":
            queue.append(str)
        else:
            if len(queue) == 0:
                return False
            if str == "]":
                if queue[-1] == "[":
                    queue.pop()
                else:
                    return False
            if str == ")":
                if queue[-1] == "(":
                    queue.pop()
                else:
                    return False
            if str == "}":
                if queue[-1] == "{":
                    queue.pop()
                else:
                    return False
    if len(queue) == 0:
        return True
    else:
        return False

def solution(s):
    answer = 0
    queue = deque()
    for str in s:
        queue.append(str)
    if isCorrect(queue) == True:
        answer += 1
    for _ in range(len(s)-1):
        popped = queue.popleft()
        queue.append(popped)
        if isCorrect(queue) == True:
            answer += 1
    return answer