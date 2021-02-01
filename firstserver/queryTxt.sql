insert into Table_1 values('컴퓨터');
insert into Table_1 values('모니터');
insert into Table_1 values('마우스');
insert into Table_1 values('키보드');
insert into Table_1 values('프린터');
insert into Table_1 values('스캐너');
insert into Table_1 values('캠코더');
insert into Table_1 values('냉장고');
insert into Table_1 values('세탁기');
insert into Table_1 values('청소기');

CREATE TABLE tb_board2 (
  num int NOT NULL AUTO_INCREMENT,
  board_code varchar(20) DEFAULT NULL,
  subject varchar(300) DEFAULT NULL,
  cont text,
  id varchar(50) DEFAULT NULL,
  filename varchar(200) DEFAULT NULL,
  ori_filename varchar(200) DEFAULT NULL,
  filesize int DEFAULT NULL,
  regdate datetime DEFAULT NULL,
  editdate datetime DEFAULT NULL,
  PRIMARY KEY (num)
)

insert into tb_board values(1, 'test', '안녕하세요', '안녕하십니까', 'yh', '안녕', '원안녕',null, '2020-10-20', '2020-10-20');  