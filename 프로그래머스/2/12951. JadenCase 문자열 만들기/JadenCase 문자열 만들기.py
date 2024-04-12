def solution(s):
    answer = ''
    for (index, i) in enumerate(s):
        if index == 0:
            answer += i.upper()
        elif s[index-1] == " ":
            answer += i.upper()
        else:
            answer += i.lower()
    return answer