def solution(arr):
    answer = []
    n = len(arr)
    answer = quardTree(arr, 0, 0, n)
    return answer

def quardTree(arr, x, y, n):
    ans = [0,0]
    quard = [0,0]*4 # 각각의 곳에서 내려온 (0의 갯수, 1의 갯수)
    if n == 1:
        ans[arr[y][x]]+=1
        return ans

    quard[0] = quardTree(arr, x, y, n//2)
    quard[1] = quardTree(arr, x+n//2, y, n//2)
    quard[2] = quardTree(arr, x, y+n//2, n//2)
    quard[3] = quardTree(arr, x+n//2, y+n//2, n//2)

    for i in range(4):
        ans[0] += quard[i][0] # 0의 갯수 더하기
        ans[1] += quard[i][1] # 1의 갯수 더하기

    if ans[1] == 0 and ans[0] == 4: # 만약 4개의 part에 온 놈들이 다 똑같은 놈이라면?..
        return [1, 0] # 0을 하나로 묶어서 1개로 바꿔서 던져준다.
    elif ans[0] == 0 and ans[1] == 4:
        return [0, 1] # 1을 하나로 묶어서 1개로 바꿔서 던져준다.
    else:
        return ans