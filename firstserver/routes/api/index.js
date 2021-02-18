const router = require('express').Router();
const board = require('./board'); //board router 호출
const dao = require('./board/dao'); //board router 호출

router.post('/',dao.delete);
router.get('/',dao.header);
router.put('/:num',dao.userAdd);

router.all('*',(req, res, next)=>{
	console.log("path="+req.path);
	next();
})

router.use("/board",board); //board router 적용

router.all('*',(req, res)=>{
	res.status(404).send({success:false, msg:'api unknown uri ${req.path}'});
})

module.exports = router;