def solution(n):
    numbers = [i for i in range(1, n+1)]
    count = 0
    for i in range(n):
        for j in range(i+1, n):
            if sum(numbers[i:j+1]) == n:
                count += 1

    return count+1