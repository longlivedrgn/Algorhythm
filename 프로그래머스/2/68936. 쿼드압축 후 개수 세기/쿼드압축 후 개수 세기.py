def solution(arr):
    answer = []
    n = len(arr)
    answer = quardTree(arr, 0, 0, n)
    return answer

def quardTree(arr, r, c, n):
    ans = [0, 0] # 0의 갯수, 1의 갯수
    quard = [0, 0] * 4 # 각 4파트에서의 0의 갯수와 1의 갯수
    if n == 1:
        ans[arr[r][c]] += 1
        return ans
    
    quard[0] = quardTree(arr, r, c, n // 2)
    quard[1] = quardTree(arr, r, c+ n//2, n//2)
    quard[2] = quardTree(arr, r+n//2, c, n//2)
    quard[3] = quardTree(arr, r+n//2, c+n//2, n//2)
    
    for i in range(4):
        ans[0] += quard[i][0]
        ans[1] += quard[i][1]
    
    if ans[0] == 0 and ans[1] == 4:
        return [0, 1]
    elif ans[0] == 4 and ans[1] == 0:
        return [1, 0]
    else:
        return ans
    
    