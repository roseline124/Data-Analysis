import pandas as pd
import random

df = pd.read_csv('DA.csv',header=9)

df.drop(df.columns[7:], axis=1, inplace=True)
df.drop(df.columns[2], axis=1, inplace=True)
df.drop([0], inplace=True)
df.drop(df.index[17:33], inplace=True)
df.rename(columns={df.columns[5] : 'name'}, inplace=True )

#get leaders group
leaders = input("팀장을 입력하세요. ex) 김철수 김영희 >").split(" ")

#get team mates number
mateNum = (len(df)//len(leaders))-1

#get plus team mates 
plusMate = len(df)%len(leaders)

#team
team = {}

for n in leaders :
    team[n] = []
    
#suffle team mates
mates = list(df.name)
random.shuffle(mates)

#get mates group
mates = [m for m in mates if m not in leaders]

def assignTeam(_team, _leaders, _mateNum, _mates) :
    i = 0 

    for l in _leaders : 
        while len(_team[l]) < _mateNum : 
            _team[l].append(_mates[i]) 
            i += 1
            
assignTeam(team, leaders, mateNum, mates)

#남은 팀원 할당 
while plusMate != 0 :
    plusMate -= 1
    team[leaders[plusMate]].append(mates[-(plusMate+1)])

#grouping
team_mates = [t for t in team.values()]

#표로 만들기
df = pd.DataFrame({'팀' : pd.Series(leaders), '팀원': pd.Series(team_mates)})

#csv로 저장
df.to_csv('random_team.csv', index=False, na_rep = 'null', encoding='ms949')


