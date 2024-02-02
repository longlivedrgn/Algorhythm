def solution(s):
    answer = []
    # 먼저 맨 앞 {{과 맨 뒤 }}를 없애준다.
    s = s[2:-2]
    
    # 그리고 }.{ 기준으로 split해준다.
    splited_s = s.split("},{")
    
    # 그리고 길이 순서대로 sorting하기
    splited_s.sort(key=len)
    
    for eachS in splited_s:
        temp_split = eachS.split(",")
        for each_temp in temp_split:
            if each_temp not in answer:
                answer.append(each_temp)
                
    return list(map(int, answer))