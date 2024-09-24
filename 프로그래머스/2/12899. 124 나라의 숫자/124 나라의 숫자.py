def solution(n):
    
    result = []
    
    while n:
        temp = n % 3
        
        if temp == 0:
            temp = 4
            n -= 1
        result.append(str(temp))
        n //= 3
    return "".join(result[::-1])
            