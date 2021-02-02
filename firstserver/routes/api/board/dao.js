//const { EPSILON } = require('core-js/fn/number');
const db = require('../../../config/db');

exports.list = async (req,res) => { //리스트 모듈 router에서 호출
  // 일단은 변수 입력
  let ipp = 10;
  let totalCount = 0;
	let block = 10;
	let total_page = 0;
	let page = 1;
	let start = 0;
	let end = ipp;
	let start_page = 1;
	let end_page = block;
  let where = "";

  let pool = await db.getPool("Board");
  let row = await pool.request()
  .query("select * from tb_board2");

  body = req.query; // get
  if(body.keyword) where += `AND subject like '%${body.keyword}%' `;
  var sql = `SELECT count(*) cnt FROM tb_board2 WHERE board_code = '` + body.board_code + `'${where}`;
  
  pool.query(sql,(err,data)=>{
    if(err) throw err;
    totalCount = data.recordset[0].cnt; //21
    total_page = Math.ceil(totalCount/ipp); // 2.1 --> 3

    if(body.page) page = body.page; //3
    //start = (page-1) * 10; // 20
    start = totalCount-10*(page-1);
    start_page = Math.ceil(page/block); // 0.3 --> 1
    end_page = start_page * block; // 10
    end = totalCount-(10*page)+1;

    if(total_page < end_page) end_page = total_page;

    let paging = {
      "totalCount" : totalCount
      ,"total_page" : total_page
      ,"page" : page
      ,"start_page" : start_page
      ,"end_page" : end_page
      ,"ipp" : ipp
    }
    // WHERE board_code = '" + body.board_code
    //SELECT * FROM tb_board2 where num <= 21 and num >= 12 ORDER BY num DESC
    sql = " SELECT * FROM tb_board2" + " where num <= " + start + " and num >=" + end + "ORDER BY num DESC "; 
		pool.query(sql,(err,list)=> {
			if(err) throw err;

			res.send({success:true,list:list,paging:paging});
		}) 
  })
  //res.send({success:true, data:row});
}

exports.add = async (req,res) => {
  let pool = await db.getPool("Board");
  body = req.body; //전송된 데이터를 받는다.
  var sql = " INSERT INTO tb_board2 (board_code, subject, cont, id, regdate) values ('"
  +body.board_code
  +"','"
  +body.subject
  +"','"
  +body.cont
  +"','"
  +body.id
  +"',"
  +"GETDATE())";
  //var sql = 'INSERT INTO  tb_board (num, board_code, subject, cont, id, regdate) values (4, ?, ?, ?, ?,now())';
  await pool.request()
  .query(sql,[body.board_code,body.subject,body.cont,body.id])
	res.send({success:true});
}

exports.view = async(req,res) => {
  let pool = await db.getPool("Board");
  body = req.query;
  num = req.params.num;

  sql = " SELECT * FROM tb_board2 WHERE board_code = '"+ body.board_code + "' AND num = '"+ num + "'";
  
	pool.query(sql,(err,view) => {
		if(err) throw err;
		
		res.send({success:true, view:view});
	})
}

exports.mod = async(req,res) => {
  let pool = await db.getPool("Board");
  body = req.body;
  sql = " UPDATE tb_board2 SET subject = '" + body.subject + "', cont = '" + body.cont + `', editdate = GETDATE() WHERE num = '` + body.num + "'";
	pool.query(sql,(err,result) => {
		if(err) throw err;
		res.send({success:true});
	})
}