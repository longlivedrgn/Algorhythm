def solution(A, B):
    answer = 0
    start_index = 0
    A.sort()
    B.sort()
    
    for a in A:
        for v in range(start_index, len(A)):
            if a < B[v]:
                start_index += 1
                answer += 1
                break
            start_index += 1
            
    return answer