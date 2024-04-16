def solution(arr1, arr2):
    answer = [[]]
    arr_1_c = len(arr1[0])
    arr_1_r = len(arr1)
    
    arr_2_c = len(arr2[0])
    arr_2_r = len(arr2)
    
    answer = [[0 for _ in range(arr_2_c)] for _ in range(arr_1_r)]
    
    for c in range(arr_2_c):
        for r in range(arr_1_r):
            temp_sum = 0
            for (i, one) in enumerate(arr1[r]):
                temp_sum += one * arr2[i][c]
            answer[r][c] = temp_sum
    return answer