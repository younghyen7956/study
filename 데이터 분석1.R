library(DBI)
library(RSQLite)
m = dbConnect(SQLite(), dbname = "C:/Users/yoyh1/Desktop/database/movie.sqlite")
dbExecute(m, "PRAGMA foreign_keys=ON")
sql = "CREATE TABLE 영화(영화번호 INTEGER  NOT NULL,PRIMARY KEY(영화번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 회원(회원번호       INTEGER	NOT NULL,이름	    VARCHAR(30)	,주소	    VARCHAR(100)	,주민번호       VARCHAR(30)	,휴대폰번호    VARCHAR(30)	,메일주소       VARCHAR(50)	,좋아하는장르 VARCHAR(30)	,PRIMARY KEY(회원번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 영화현재상영작(영화번호    INTEGER	NOT NULL,영화제목    VARCHAR(50)	NOT NULL,장르          VARCHAR(50),감독	 VARCHAR(30),출연진       VARCHAR(100),상영시간    VARCHAR(50),제작국가    VARCHAR(50),개봉일자    DATETIME,네티즌평점 VARCHAR(30)	,PRIMARY KEY(영화번호, 영화제목),FOREIGN KEY(영화번호) REFERENCES 영화(영화번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 영화개봉예정작(영화번호      INTEGER	NOT NULL,영화제목      VARCHAR(50)	NOT NULL,장르            VARCHAR(50),감독	   VARCHAR(30),출연진         VARCHAR(100),상영시간      VARCHAR(50),제작국가      VARCHAR(50),개봉일자      DATETIME,PRIMARY KEY(영화번호, 영화제목),FOREIGN KEY(영화번호) REFERENCES 영화(영화번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 예매(예매번호    INTEGER	NOT NULL,영화번호    INTEGER  ,관람극장    VARCHAR(50)	,관람일자TEXT,관람시간    VARCHAR(50),예매일자    DATETIME,회원번호    INTEGER 	,PRIMARY KEY(예매번호),FOREIGN KEY(영화번호) REFERENCES 영화(영화번호) ,FOREIGN KEY(회원번호) REFERENCES 회원(회원번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 장바구니(장바구니번호     INTEGER          NOT NULL,생성일자           DATETIME	,회원번호 	        INTEGER	 NOT NULL	,PRIMARY KEY(장바구니번호),FOREIGN KEY(회원번호) REFERENCES 회원(회원번호))"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 영화장바구니(장바구니번호   INTEGER	NOT NULL,영화번호 	       INTEGER ,영화수	       INTEGER,PRIMARY KEY(장바구니번호),FOREIGN KEY(장바구니번호) REFERENCES 장바구니(장바구니번호),FOREIGN KEY(영화번호) REFERENCES 영화(영화번호) )"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "CREATE TABLE 영화예매(예매번호       INTEGER	NOT NULL,영화번호 	    INTEGER 	,영화수	    INTEGER,PRIMARY KEY(예매번호),FOREIGN KEY(예매번호) REFERENCES 예매(예매번호),FOREIGN KEY(영화번호) REFERENCES 영화(영화번호) )"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(1)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(2)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(3)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(4)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(5)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(6)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(7)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(8)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(9)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(10)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(11)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(12)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(13)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(14)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(15)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(16)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(17)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(18)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(19)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "insert into 영화 values(20)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (1,'범죄도시2','액션','이상용','마동석,김홍백,장원석','106분','한국',2022-05-18,'9.07점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (2,'브로커','드라마','고레에다 히로카즈','송강호,강동원,배두나,아이유','129분','한국',2022-06-08,'7.00점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (3,'쥬라기월드','액션','콜린 트레보로우','크리스 프렛,브라이스 달라스','147분','미국',2022-06-01,'6.83점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (4,'이공삼칠','가족','모홍진','홍예지,김지영,김미화','126분','한국',2022-06-08,'8.75점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (5,'닥터 스트레인지2','액션','샘 레이미','베니딕트 컴버배치, 엘리자베스 올슨','126분','미국',2022-05-04,'7.78점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (6,'윤시내가 사라졌다','드라마','김진화','이주영,오민애,노재원','107분','한국',2022-06-08,'8.78점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (7,'애프터양','드라마','코고나다','콜린 파렐,조디 터너 스미스','96분','미국',2022-06-01,'7.92점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (8,'베르네 부인의 장미정원','드라마','피에르 피노드','카트린 프로, 팟사 부야 메드','95분','프랑스',2022-06-09,'9.17점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (9,'우연과ㅗ 상상','드라마','하마구치 류스케','후루카와코토네, 현리','121분','일본',2022-05-04,'8.40점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화현재상영작 VALUES (10,'아치의 노래','다큐멘터리','고영재','정태춘, 박은옥,유지연','113분','한국',2022-05-18,'9.24점')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (11,'마녀2','액션','박훈정','신시아,박은빈,진구','137분','한국',2022-06-15)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (12,'버즈 라이트이어','애니메이션','앤거스 맥클레인','크리스 에반스,피터 손','105분','미국',2022-06-15)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (13,'실종','스릴러','가타야마','사토지로,이토 아오,시미즈 히','123분','일본',2022-06-15)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (14,'더 렛지','스릴러','하워드 포드','브리터니 애쉬워스, 벤 램','86분','영국',2022-06-15)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (15,'경아의 딸','드라마','김정은','김정영,하윤경,김우겸','119분','한국',2022-06-16)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (16,'아부쟁이','액션','황승재','류의현','91분','한국',2022-06-16)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (17,'소리없는 추격자','미스터리','마리아노 바로소','레오노르 와틀링,미구엘 앙겔실베스트르','92분','스페인',2022-06-16)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (18,'탑건','액션','조셉 코신스키','톰 크루즈,마일즈 텔러','130분','미국',2022-06-22)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (19,'룸쉐어링','드라마','이순성','나문희,최우성','93분','한국',2022-06-22)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 영화개봉예정작 VALUES (20,'미친 능력','범죄','톰 고미칸','니콜라스 케이지,페드로 파스칼','107분','미국',2022-06-22)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13241,'한채영','전주완산구중화산동','850214-1431757','010-8573-1453','goldcyber1@google.com','멜로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13242,'문근영','전주완산구서신동','861128-2531342','010-4532-2685','qkrwpqud@hanmail.net','드라마')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13243,'이동주','전주덕진구인후동','830930-1431369','010-4453-7835','wpqhddl@naver.com','스릴러')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13244,'고재환','전주완산구효자동','800515-1436159','010-2857-1954','dldhkstjr@yahoo.co.kr','애로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13245,'이병일','전주완산구중앙동','821202-1403952','010-1684-7346','rhwodhks@nate.com','액션')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13246,'윤원영','전주완산구풍남동','851010-2810486','010-1363-7853','flgk134@hanmir.com','스릴러')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13247,'이호만','전주완산구완산동','790123-1238965','010-4846-1435','slsdkv@hanmail.net','로맨스')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13248,'홍시현','전주완산구노송동','890613-1400213','010-7479-6657','gpvldg@hanmir.com','멜로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13249,'김영민','전주완산구동서학동','810227-2233063','010-2274-3684','qpfl124@nate.com','애로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13250,'박종환','전주완산구서서학동','850322-1733456','010-2726-9669','lfpql@naver.com','공포')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13251,'이성규','전주덕진구인후동','881119-1231127','010-2485-7753','123d45s@hanmir.com','액션')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13252,'천강일','전주덕진구인후1동','770807-1433652','010-4535-0124','1f03pf@naver.com','애로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13253,'김경일','전주덕진구인후2동','840304-2617733','010-7675-7320','qpqpqpq@hanmail.net','로맨스')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13254,'장동혁','전주덕진구인후3동','810111-1431689','010-5076-7685','rhrhrh@yahoo.co.kr','스릴러')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13255,'황석환','전주덕진구덕진동','800826-2024894','010-7126-9214','adfkelf@hanmir.com','액션')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13256,'윤성한','전주덕진구금암1동','860729-1931686','010-4720-7243','laaaa@hanmail.net','공포')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13257,'최성한','전주덕진구금암2동','850219-1433474','010-4572-7862','qfldlf@hanmir.com','스릴러')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13258,'이민용','전주덕진구팔복동','840101-1331474','010-4867-7543','dkssud@naver.com','멜로')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13259,'정국희','전주덕진구우아1동','820920-2903563','010-7011-1975','ghkdlc@hanmir.com','공포')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 회원 VALUES (13260,'박유리','전주덕진구우아2동','811216-1259375','010-3049-4058','seesss@nate.com','액션')"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 예매 VALUES (64241,1,'씨네Q','2022-06-06','15시','2022-06-05',13241)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 예매 VALUES (64242,5,'CGV','2022-06-16','13시','2011-06-09',13242)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 예매 VALUES (64243,7,'롯데시네마','2022-06-15','09시','2022-06-09',13243)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 예매 VALUES (64244,1,'독립영화관','2022-06-14','19시','2022-06-10',13244)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql = "INSERT INTO 예매 VALUES (64245,10,'씨네Q','2022-06-09','15시','2022-06-02',13245)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (64246,9,'CGV','2022-06-17','13시','2022-05-30',13246)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (64247,6,'롯데시네마','2022-06-03','17시','2022-05-28',13247)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (64248,5,'롯데시네마','2022-06-07','10시','2022-06-01',13248)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (64249,8,'씨네Q','2022-06-04','09시','2022-05-26',13249)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642410,1,'독립영화관','2022-06-08','21시','2022-06-01',13250)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642411,4,'CGV','2022-06-13','15시','2022-06-09',13251)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642412,7,'씨네Q','2022-06-17','10시','2022-06-13',13252)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642413,9,'롯데시네마','2022-06-07','09시','2022-06-05',13253)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642414,2,'독립영화관','2022-06-15','20시','2022-06-11',13254)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql="INSERT INTO 예매 VALUES (642415,4,'CGV','2022-06-06','23시','2022-06-04',13255)"
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1941,"2022-04-26",13241)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1942,"2022-05-21",13248)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1943,"2022-05-19",13246)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1944,"2022-05-23",13247)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1945,"2022-05-19",13243)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1946,"2022-05-29",13242)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1947,"2022-06-08",13252)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1948,"2022-06-03",13257)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (1949,"2022-05-25",13245)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (19410,"2022-06-02",13251)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (19411,"2022-05-29",13259)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 장바구니 VALUES (19412,"2022-05-27",13258)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1941,1,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1942,5,4)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1943,2,5)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1944,4,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1945,1,3)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1946,8,1)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1947,7,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1948,2,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (1949,4,3)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (19410,5,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (19411,9,3)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화장바구니 VALUES (19412,4,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64241,1,16)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64242,5,1)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64243,7,8)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64244,1,5)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64245,10,3)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64246,9,12)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64247,6,15)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64248,5,8)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (64249,8,3)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642410,1,2)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642411,10,4)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642412,4,1)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642413,7,10)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642414,9,6)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
sql='INSERT INTO 영화예매 VALUES (642415,1,5)'
rs = dbSendQuery(m, sql)
dbClearResult(rs)
