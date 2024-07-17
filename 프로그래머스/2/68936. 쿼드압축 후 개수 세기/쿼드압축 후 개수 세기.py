def check(arr, r, c, l): # row, column, range(length)
    start = arr[r][c]
    for row in range(r, r+l):
        for column in range(c, c+l):
            if arr[row][column] != start: # 만약 start와 다르다면?
                l = l // 2
                check(arr, r, c, l) # 1사분면
                check(arr, r+l, c, l) # 3사분면
                check(arr, r,c+l, l) # 2사분면
                check(arr, r+l, c+l, l) # 4사분면
                return # 이상한 것을 찾았으면 return을 해줘야된다!..
    answer[start] += 1
                

def solution(arr):
    global answer
    answer = [0, 0] # 첫번째 - 0 두번째 - 1
    length = len(arr) # 배열의 변의 길이
    
    check(arr, 0, 0, length)
    
    return answer