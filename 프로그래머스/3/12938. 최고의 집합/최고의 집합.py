def solution(n, s):
    answer = []
    mok = s // n
    surplus = s % n
    
    if mok == 0:
        return [-1]
    answer = [mok] * n
    if surplus != 0:
        for i in range(n-1, n-1-surplus, -1):
            answer[i] += 1
    return answer