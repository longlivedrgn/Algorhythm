def solution(land):
    answer = 0
    
    for r in range(1, len(land)):
        for c in range(4):
            max_value = 0
            for k in range(4):
                if c != k:
                    max_value = max(land[r-1][k], max_value)
            land[r][c] += max_value
    return max(land[-1])