def cal_time(time):
    splitted = time.split(":")
    return int(splitted[0]) * 60 + int(splitted[1])

def change(contents):
    replacement = {'C#':'1','D#':'2', 'F#':'3', 'G#':'4', 'A#':'5', 'B#': "6"}
    
    for (k, v) in replacement.items():
        contents = contents.replace(k,v)
    return contents

def solution(m, musicinfos):
    answers = []

    for info in musicinfos:
        splitted = info.split(",")
        start = splitted[0]
        end = splitted[1]
        song = splitted[2]
        con = splitted[3]
        
        length = cal_time(end) - cal_time(start)
        changed = change(con)
        if length > len(changed):
            ans, remain = divmod(length, len(changed))
            changed = changed * ans
            changed += changed[:remain]
        else:
            changed = changed[:length]
        if change(m) in changed:
            answers.append([length, song])
    if len(answers) != 0:
        answers = sorted(answers, key = lambda x: -x[0])        
        return answers[0][1]
    else:
        return "(None)"

        
        
        

        
        
        
        
        
