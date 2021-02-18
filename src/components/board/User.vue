<template>
	<div>
		<h1>로그인</h1>
    <div class="UserWrap" margin-top=100>
      <table>
        <tr>
          <th align="right" width=310>
            <b class="pad"> ID : </b>
          </th>
          <td align=left>
            <input type="text" v-model="UserID" class="indent">
          </td>
        </tr>
        <tr>
          <th align="right" width=310>
            <b class="pad"> PW : </b>
          </th>
          <td align=left>
            <input type="password" v-model="PassWd" @keyup.enter="fnLogin" class="indent">
          </td>
        </tr>
      </table>
		</div>

    <div class="btnWrap">
			<a href="javascript:;" @click="fnLogin" class="btn">로그인</a>
      <a href="javascript:;" @click="fnUserAdd" class="btnAdd btn">회원가입</a>
		</div>	
	</div>
</template>

<script>
  export default {
    data() {
      return{
        UserID:''
        ,PassWd:''
        ,user:''
		}
  }
	,methods:{
      fnLogin(){
        this.user={
          UserID:this.UserID
          ,PassWd:this.PassWd
        }
        this.$axios.post('http://localhost:3000/api/board/'+this.UserID,{params:this.user})
        .then((res)=>{
				if(res.data.success) {
					this.user = res.data.user.recordset[0];
          if(this.PassWd === this.user.password){
            alert("로그인 성공!");
            this.$router.push({path:'../', user:this.user});
            this.$router.go();
          }
          else{
            alert("패스워드 정보가 일치하지 않습니다.");
          }
				} else {
					alert("실행중 실패했습니다.\n다시 이용해 주세요.");
				}
			})
			.catch((err)=>{
				console.log(err);
			})
      }
      ,fnUserAdd(){
        this.$router.push({path:'./userAdd'});
      }
    }
  }
</script>

<style scoped>
  div{padding:20px;}
  .btnWrap{padding-left: 70px;}
	.btnAdd {background:#43b984;}
	.btnDelete{background:#f00;}
  input.indent{padding: 10;}
  b.pad{padding:10px;}
</style>