import itertools
def solution(user_id, banned_id):
    answer = 0
    name_list = [[] for _ in range(len(banned_id))]
    
    for (b_index, ban) in enumerate(banned_id):
        for user in user_id:
            if len(ban) == len(user):
                if check(ban, user):
                    name_list[b_index].append(user)
    users = []
    for i in itertools.product(*name_list):
        temp_set = set(i)
        if len(temp_set) == len(banned_id):
            temp_list = list(temp_set)
            temp_list.sort()
            if temp_list not in users:
                users.append(temp_list)
    return len(users)

def check(ban, user):
    for i in range(len(ban)):
        if ban[i] == "*":
            continue
        else:
            if ban[i] != user[i]:
                return False
    return True
            