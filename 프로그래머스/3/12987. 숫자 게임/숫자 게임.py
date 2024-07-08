def solution(A, B):
    answer = 0
    start_index = 0
    A.sort()
    B.sort()
    
    for a in A:
        for v in range(start_index, len(A)):
            if a < B[v]:
                answer += 1
                start_index += 1
                break
            start_index += 1
            if v == len(A)-1:
                return answer
    return answer