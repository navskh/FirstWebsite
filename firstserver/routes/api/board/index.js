const router = require('express').Router();
const dao = require('./dao'); // 데이터 모듈 호출

router.get("/", dao.list); //GET 방식으로 접근 시 dao.list 모듈 실행
router.post("/",dao.add);  //api/board post 방식으로 접근 시 모듈 실행

router.all('*',(req, res)=> {
	res.status(404).send({success:false, msg:'board unknown uri ${req.path}'});
})

module.exports = router;