def solution(arr):
    answer = 0
    arr.sort()
    first_number = arr[-1]
    append_number = arr[-1]
    while True:
        is_all_ok = True
        for number in arr[:-1]:
            if first_number % number != 0:
                is_all_ok = False
                break
        if is_all_ok == True:
            break
        else:
            first_number += append_number
        
    return first_number