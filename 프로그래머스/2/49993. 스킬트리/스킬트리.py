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
        for m in tree:
            if m in skill_set:
                popped = skill_queue.popleft()
                if popped != m:
                    break
        else:
            answer += 1
    return answer