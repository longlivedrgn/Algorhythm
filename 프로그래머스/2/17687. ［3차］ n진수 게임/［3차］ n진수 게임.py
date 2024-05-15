def jin(value,jin):
    answer = []
    c, d = divmod(value, jin)
    if d == 10:
        answer.append("A")
    elif d == 11:
        answer.append("B")
    elif d == 12:
        answer.append("C")
    elif d == 13:
        answer.append("D")
    elif d == 14:
        answer.append("E")
    elif d == 15:
        answer.append("F")
    else:
        answer.append(str(d))

    while c != 0:
        c, d = divmod(c, jin)
        if d == 10:
            answer.append("A")
        elif d == 11:
            answer.append("B")
        elif d == 12:
            answer.append("C")
        elif d == 13:
            answer.append("D")
        elif d == 14:
            answer.append("E")
        elif d == 15:
            answer.append("F")
        else:
            answer.append(str(d))
    answer.reverse()
    return answer

def solution(n, t, m, p):
    answer = ''
    p -= 1
    count = 1
    values = []
    for i in range(0,t*m+1):
        values += jin(i,n)
    answer += values[p]
    while count != t:
        p = p + m
        answer += values[p]
        count += 1
    return answer