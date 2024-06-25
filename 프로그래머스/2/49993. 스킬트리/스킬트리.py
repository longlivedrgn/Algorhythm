from collections import deque
def solution(skill, skill_trees):
    answer = 0
    skill_set = set()
    skills = []
    for s in skill:
        skill_set.add(s)
        skills.append(s)

    for tree in skill_trees:
        skill_queue = deque(skills)
        isOk = True
        for m in tree:
            if isOk == False:
                break
            if m in skill_set:
                popped = skill_queue.popleft()
                print(popped)
                if popped != m:
                    isOk = False
        else:
            if isOk != False:
                answer += 1
    return answer