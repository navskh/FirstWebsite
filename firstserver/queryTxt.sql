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


insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'ㅎㅎ', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', '2', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', '24', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', '532', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', '123', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', '123', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Pariatur ullamco ullamco sit nisi adipisicing commodo adipisicing culpa qui incididunt anim Lorem.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Consequat magna veniam deserunt laborum et ea sit consectetur in.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Occaecat sint laborum cupidatat culpa excepteur consectetur in eu.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Deserunt minim duis qui in voluptate et mollit laborum ad amet Lorem est qui.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Incididunt minim deserunt in aliquip consequat proident enim nisi minim enim dolore quis ad deserunt.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Sit velit consectetur magna reprehenderit dolore anim aliquip.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Aliqua quis in eu quis ullamco adipisicing aliqua Lorem sint cupidatat nostrud magna consequat.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Proident commodo minim laboris in nulla nisi fugiat sint dolor amet reprehenderit minim.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Non nisi laboris pariatur ad excepteur ea dolor Lorem cillum sit ad.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Deserunt ipsum est consequat tempor cillum reprehenderit excepteur irure ipsum.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Cillum labore eiusmod deserunt elit.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Magna elit deserunt aliqua ullamco Lorem tempor do.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Tempor laborum non esse pariatur minim.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Excepteur pariatur deserunt excepteur ut magna aliquip enim irure.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Amet aliqua labore non deserunt et tempor ut reprehenderit ullamco.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Culpa consequat occaecat in dolore nostrud.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Proident ex non excepteur eu quis reprehenderit voluptate cupidatat consequat eiusmod id laborum.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Nostrud velit exercitation esse consectetur id anim.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Sit ex sit proident incididunt.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Consectetur ea ut proident fugiat minim irure mollit voluptate enim ipsum elit elit.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Deserunt tempor quis irure laboris magna commodo qui dolore ea aute magna eu.', '1111', 'yh', null, null, null, getdate(), getdate());  
insert into tb_board2(board_code,subject,cont,id,filename,ori_filename,filesize,regdate,editdate) values('news', 'Eu do ullamco sunt Lorem qui et nisi eiusmod Lorem reprehenderit anim officia laboris.', '1111', 'yh', null, null, null, getdate(), getdate());  


CREATE TABLE user_Info (
  name nvarchar(20) NOT NULL,
  id varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  PRIMARY KEY (id)
)