# def solution(n, times):
#     answer = 0

#     left, right = 1, max(times) * n # left는 제일 작게, right는 최악의 경우를 가정하기
#     while left <= right:
#         mid = (left + right) // 2
#         peopleNumber = 0
#         for time in times:
#             peopleNumber += (mid // time)
#         if peopleNumber <= n:
#             left = mid + 1
            
#             answer = mid
#         else:
#             right = mid - 1

#     return answer
def solution(n, times):
    answer = 0
    end = n * max(times)
    start = 0

    while start <= end:
        mid = (start + end) // 2
        people = 0

        for time in times:
            people += (mid // time)

        if people < n:
            start = mid + 1
            
        else:
            end = mid - 1
            answer = mid


    return answer
