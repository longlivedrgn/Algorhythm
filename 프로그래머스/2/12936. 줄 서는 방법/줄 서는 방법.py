import math

def solution(n, k):
    answer = []
    arr = [i for i in range(1, n+1)]
    
    while arr:
        ans, surplus = divmod((k-1), math.factorial(n-1))
        popped = arr.pop(ans)
        answer.append(popped)
        
        surplus = k % math.factorial(n-1)
        k = surplus
        n -= 1
    
    return answer