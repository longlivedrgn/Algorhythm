def calculate(x):
    splitted = x.split(":")
    return int(splitted[0])*60 + int(splitted[1])

def replaces(symbols):
    replacement = {'C#':'1','D#':'2', 'F#':'3', 'G#':'4', 'A#':'5', 'B#': "6"}
    for (k, v) in replacement.items():
        symbols = symbols.replace(k,v)
    return symbols

def solution(m, musicinfos):
    answers = []
    for info in musicinfos:
        splitted = info.split(",")
        start = calculate(splitted[0])
        end = calculate(splitted[1])
        long_time = end - start
        song = splitted[2]
        syms = splitted[3]
        
        changed = replaces(syms)
        
        if long_time <= len(changed):
            changed = changed[:long_time]
        else:
            (answer, surplus) = divmod(long_time, len(changed))
            changed = changed * answer
            changed += changed[:surplus]
        
        if replaces(m) in changed:
            answers.append([long_time, song])
    if len(answers) != 0:
        answers = sorted(answers, key = lambda x: -x[0])        
        return answers[0][1]
    else:
        return "(None)"
        
        
        
        
        
