<template>
	<div class="container">
			<div>
        <h1> 회원가입 </h1>
				<h2><label for="name">이름</label></h2>
				<input type="text" id="name" v-model="userName"/>
			</div>
      <div>
				<h2><label for="userId">아이디</label></h2>
        <div class="check">
				<input type="userId" id="userId" v-model="userID" />
        <a href="javascript:;" @click="fnCheck" class="btnDelete">중복체크</a>
        </div>
			</div>
			<div>
				<h2><label for="password">비밀번호</label></h2>
				<input type="password" id="password" v-model="password" />
			</div>
			<div>
				<h2><label for="passwordConfirm">비밀번호 확인</label></h2>
        <div class="checkPass">
				<input type="password" id="passwordConfirm" v-model="passwordConfirm" />
        <template v-if="password===passwordConfirm"><font color="green"><b>비밀번호 확인을 완료했습니다.</b></font></template>
        <template v-else><font color="red"><b>비밀번호가 확인되지 않습니다.</b></font></template>
        </div>
			</div>
      <div class="btnWrap">
      <a href="javascript:;" @click="fnSubmitForm" class="btnAdd btn">회원가입</a>
      </div>	
	</div>
</template>

<script>
export default {
	name: 'SignupForm',
	data() {
		return {
			userName: '',
      userID: '',
			password: '',
			passwordConfirm: '',
      checkID:1,
      user:'',
		};
	},
	methods: {
		fnSubmitForm() {
      if(this.userName==='') alert("이름을 입력해야 합니다.");
      else if(this.userID==='') alert("아이디를 입력해야 합니다.");
      else if(this.password==='') alert("비밀번호를 입력해야 합니다.");
      else if(this.password!==this.passwordConfirm) alert("비밀번호 확인이 되지 않았습니다.");
      else{
        if(this.checkID===0){
          this.user={
            userName:this.userName
            ,userID:this.userID
            ,password:this.password
          }
          this.$axios.put('http://localhost:3000/api/'+this.userID,{params:this.user})
          .then((res)=>{
            if(res.data.success) {
              alert("회원가입 성공!");
              this.$router.push({path:'./user'});
            }
            else{
              alert("회원가입에 실패하였습니다.");
            }
          })
        }
        else{
          alert("아이디 중복확인이 되지 않았습니다.");
        }
      }
		},
    fnCheck(){
      // console.log(this.userID);
      this.user={
        UserID:this.userID
      }
      this.$axios.post('http://localhost:3000/api/board/'+this.userID,{params:this.user})
      .then((res)=>{
				if(res.data.success) {
          console.log(res.data.user.rowsAffected[0]);
          this.checkID=res.data.user.rowsAffected[0];
          if(this.checkID===1) alert("중복된 아이디가 있습니다.");
          else {
            alert("사용가능한 아이디입니다.");
          }
        }
      })
    },
  }
};
</script>

<style scoped>
  div{padding:0px;}
  .btnWrap{position: relative; top:40px; padding-left: 60px;}
	.btnAdd {background:#43b984;}
  .btnDelete{background:#f00; color:white; padding:10px;}
  .check{position: relative; left:40px;}
  .checkPass{position: relative; left:110px;}
  input{position:relative; right:20px; padding: 7px; width: 300px;}
  h2{text-align:left; position: relative; left:25%;}
  h1{position:relative; bottom:10px;}
</style>