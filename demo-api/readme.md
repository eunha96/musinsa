#보상지급API
매일 00 시 00 분 00 초에 선착순 10 명에게 보상 지급 하는 REST API 를 구현

####보상데이터 API
* 보상데이터의 상세내용을 조회 
  * pdf내용을 토대로 작성하였으며, reward TABLE에 내용을 저장하여 해당사항에 맞는 내용 뿌려줌
####보상지급 API
*
####보상조회 API
*

###DB
* create 
  * CREATE TABLE `users` (
    `id` varchar(45) NOT NULL,
    `name` varchar(45) DEFAULT NULL,
    `point` int DEFAULT NULL,
    `date` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) 