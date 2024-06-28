def solution(record):
    answer = []
    real_answer = []
    id_name = dict()
    entered_id = set() # 현재 톡방에 있는 놈인가?... -> 있으면 해당 놈들을 entered된 새로운 닉네임으로 바꾼다.
    for rec in record:
        splitted = rec.split()
        action = splitted[0]
        id = splitted[1]
        if action == "Enter" or action == "Change":
            id_name[id] = splitted[2]
            answer.append([action, id])
        elif action == "Leave":
            answer.append([action, id])

            
            
    for ans in answer:
        if ans[0] == "Enter":
            real_answer.append(f'{id_name[ans[1]]}님이 들어왔습니다.')
        elif ans[0] == "Leave":
            real_answer.append(f'{id_name[ans[1]]}님이 나갔습니다.')
        
    return real_answer