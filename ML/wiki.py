from konlpy.tag import Okt
from gensim.models import word2vec

okt = Okt()
i = 0

writeFp = open("wiki.wakati", "w", encoding="utf-8")


with open("./dataset/wiki/wiki.txt", "r", encoding="utf-8") as f : 
    
    while True : 
        line = f.readline()
        
        if not line : break
        
        if i % 20000 == 0 :
            print("current - " + str(i))
        
        i += 1
        
        # 형태소 분석
        malist = okt.pos(line, norm=True, stem=True)
        
        # 필요한 어구만 대상으로 하기 
        r = []
        for word in malist : 
            
            # 어미 / 조사 / 구두점 등은 대상에서 제외 
            if not word[1] in ["Josa", "Eomi", "Punctuation"] : 
                writeFp.write(word[0] + " ")
                
writeFp.close()

from gensim.models import word2vec
data = word2vec.Text8Corpus("wiki.wakati")
model = word2vec.Word2Vec(data, size=100) # 벡터 차원 = 100
model.save("wiki.model")
print("Finished")