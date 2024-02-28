### 코드가 2023년까지는 작동했지만 24년부터 네이버 검색 방식이 달라져서 수정이 필요함

library(KoNLP)      
library(wordcloud)  
library(dplyr)      
library(stringr)    
library(tidytext)   
library(ggplot2)
library(ggwordcloud)   
library(readr)
library(tidyverse)
library(widyr)
library(scales)
library(tidygraph)
library(ggraph)
library(N2H4)
library(httr)
library(rvest)

dic <- read_csv("knu_sentiment_lexicon.csv")

pg = seq(from =1 ,by=10,length.out = 100)
crawl=list()
n=1
for (i in pg){
  url=paste0("https://search.naver.com/search.naver?where=news&sm=tab_pge&query=%EB%B6%80%EB%8F%99%EC%82%B0&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=35&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start=",i)
  data=GET(url)
  data_title <- data %>%
    read_html(encoding="UTF-8") %>%
    html_nodes('.news_area') %>%
    html_nodes('a') %>%
    html_attr('title')
  crawl[[n]] <- data_title
  n=n+1  
}

GET('https://search.naver.com/search.naver?ssc=tab.news.all&where=news&sm=tab_jum&query=%EB%B6%80%EB%8F%99%EC%82%B0') %>% read_html(encoding="UTF-8") %>% html_nodes(css='a.news_tit') %>% html_text()
crawl <- unlist(crawl)
crawl <- crawl[complete.cases(crawl)]

raw_data=data.frame(reply_raw = str_squish(crawl),
                    exreply = str_replace_all(crawl, "[^가-힣]", " "),
                    reply = str_squish(reply))

word_noun <- raw_data %>%
  unnest_tokens(input = reply,
                output = word,
                token = extractNoun)

word_noun <- word_noun %>% 
  count(word, sort = T) %>%    # 단어 빈도 구해 내림차순 정렬
  filter(str_count(word) > 1)  # 두 글자 이상만 남기기
word_noun

# 상위 20개 명사 추출
top100 <- word_noun %>%
  head(100)

ntop100 <- word_noun[2:101,]
# 워드 클라우드 
library(ggwordcloud)
ggplot(top100, aes(label = word, size = n, col = n)) +
  geom_text_wordcloud(seed = 1234) +
  scale_radius(limits = c(3, NA),
               range = c(3, 15)) +
  scale_color_gradient(low = "#66aaf2", high = "#004EA1") +
  theme_minimal()

ggplot(ntop100, aes(label = word, size = n, col = n)) +
  geom_text_wordcloud(seed = 1234) +
  scale_radius(limits = c(3, NA),
               range = c(3, 15)) +
  scale_color_gradient(low = "#66aaf2", high = "#004EA1") +
  theme_minimal()
### 단어 빈도 그래프

word_noun <- raw_data %>%
  unnest_tokens(input = reply,
                output = word,
                token = extractNoun,
                drop = F)

frequency <- word_noun %>%
  count(word, sort = T) %>%    # 단어 빈도 구해 내림차순 정렬
  filter(str_count(word) > 1)

frequency %>%
  head(30) 

top30_noun <- frequency[2:31,]

ggplot(top30_noun, aes(x = reorder(word, n), y = n)) +
  geom_col() +
  coord_flip() +
  geom_text(aes(label = comma(n, accuracy = 1)), hjust = -0.3) +  
  scale_y_continuous(limits = c(0, 1000)) +
  
  labs(title = "부동산 뉴스 제목",
       subtitle = "언급 빈도 Top 30",
       x = NULL) +
  
  theme_minimal() +
  theme(text = element_text(family = "nanumgothic", size = 12),
        plot.title = element_text(size = 14, face = "bold"),      # 제목 폰트
        plot.subtitle = element_text(size = 13))    


### 긍정 부정 
word_comment <- raw_data %>%
  unnest_tokens(input = reply,
                output = word,
                token = "words",
                drop = F)

word_comment1 <- word_comment %>%
  left_join(dic, by = "word") %>%
  mutate(polarity = ifelse(is.na(polarity), 0, polarity))

word_comment2 <- word_comment1 %>%
  mutate(sentiment = ifelse(polarity ==  2, "pos",
                            ifelse(polarity == -2, "neg", "neu")))

score_comment <- word_comment2 %>%
  group_by(reply) %>%
  summarise(score = sum(polarity)) %>%
  ungroup()

score_comment <- score_comment %>%
  mutate(sentiment = ifelse(score >=  1, "pos",
                            ifelse(score <= -1, "neg", "neu")))

comment <- score_comment %>%
  unnest_tokens(input = reply,          # 단어 기준 토큰화
                output = word,
                token = "words",
                drop = F) %>%
  filter(str_detect(word, "[가-힣]") &  # 한글 추출
           str_count(word) >= 2)

frequency_word <- comment %>%
  count(sentiment, word, sort = T)

p=frequency_word %>%
  filter(sentiment == "pos")
p[-1,]

n=frequency_word %>%
  filter(sentiment == "neg")
n[-1,]

library(tidyr)
comment_wide <- frequency_word %>%
  filter(sentiment != "neu") %>%  # 중립 제외
  pivot_wider(names_from = sentiment,
              values_from = n,
              values_fill = list(n = 0))
comment_wide[-1,]


# 로그 오즈비 구하기
comment_wide <- comment_wide %>%
  mutate(log_odds_ratio = log(((pos + 1) / (sum(pos + 1))) /
                                ((neg + 1) / (sum(neg + 1)))))

comment_wide


# 로그 오즈비가 큰 단어 10개씩 추출
top10 <- comment_wide %>%
  group_by(sentiment = ifelse(log_odds_ratio > 0, "pos", "neg")) %>%
  slice_max(abs(log_odds_ratio), n = 10)

top10 %>% print(n = Inf)


# 로그 오즈비가 동점인 단어 제외하고 추출
top10 <- comment_wide %>%
  group_by(sentiment = ifelse(log_odds_ratio > 0, "pos", "neg")) %>%
  slice_max(abs(log_odds_ratio), n = 10, with_ties = F)

top10 


# 막대 그래프 만들기
ggplot(top10, aes(x = reorder(word, log_odds_ratio),
                  y = log_odds_ratio,
                  fill = sentiment)) +
  geom_col() +
  coord_flip() +
  labs(x = NULL) +
  theme(text = element_text(family = "nanumgothic"))

### 네트워크 그림 
comment_pos <- raw_data %>%
  unnest_tokens(input = reply,
                output = word,
                token = SimplePos22,  #단어를 22개의 품사로 구분
                drop = F)

comment_pos <- comment_pos %>%
  separate_rows(word, sep = "[+]")

comment_new <- comment_pos %>%
  separate_rows(word, sep = "[+]") %>%
  filter(str_detect(word, "/n|/pv|/pa")) %>%
  mutate(word = ifelse(str_detect(word, "/pv|/pa"),
                       str_replace(word, "/.*$", "다"),
                       str_remove(word, "/.*$"))) %>%
  filter(str_count(word) >= 2) %>% 
  arrange(id)

pair <- comment_new %>%
  pairwise_count(item = word,
                 feature = id,
                 sort = T)

line_comment <- comment_new %>%
  group_by(id) %>%
  summarise(sentence = paste(word, collapse = " "))

bigram_comment <- line_comment %>%
  unnest_tokens(input = sentence,
                output = bigram,
                token = "ngrams",
                n = 2)

bigram_seprated <- bigram_comment %>%
  separate(bigram, c("word1", "word2"), sep = " ")

pair_bigram <- bigram_seprated %>%
  count(word1, word2, sort = T) %>%
  na.omit()

graph_bigram <- pair_bigram %>%
  filter(n >= 8) %>%
  as_tbl_graph()

word_network <- function(x) {
  ggraph(x, layout = "fr") +
    geom_edge_link(color = "gray50",
                   alpha = 0.5) +
    geom_node_point(color = "lightcoral",
                    size = 5) +
    geom_node_text(aes(label = name),
                   repel = T,
                   size = 5,
                   family = "nanumgothic") +
    theme_graph()
}

set.seed(1234)
word_network(graph_bigram)
