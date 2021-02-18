<template>
	<header>
		<h1>
      <router-link to="/">
        <img alt="Vue logo" src="../../assets/panda.jpg" width="80">
      </router-link>
    </h1>
    <h1 class="centerLogo">JINHAK</h1>
    <h4>
      <template v-if="LoginFlag==='true'">
        {{userName}}님 반갑습니다! 
        <a href="javascript:;" @click="fnLogout" class="btnAdd btn">로그아웃</a>
      </template>
      <template v-else>
      <router-link to="/board/user">
        로그인
      </router-link>
      </template>
    </h4>
		<div class="menuWrap">
			<ul class="menu">
				<li>
          <a href="javascript:;" @click="fnViewList">NEWS</a>
        </li>
				<li><a href="javascript:;">메뉴2</a></li>
				<li><a href="javascript:;">메뉴3</a></li>
				<li><a href="javascript:;">메뉴4</a></li>
			</ul>
		</div>
	</header>
</template>

<script>
export default {
  name: 'Header'
	,data() {
      return{
        UserID:''
        ,PassWd:''
        ,LoginFlag:'false'
        ,userName:''
        }
  }
  ,mounted(){
    this.fnGetHeader()
  }
  ,methods:{
    fnGetHeader(){
      this.user={
        UserID:this.UserID
        ,PassWd:this.PassWd
        ,userName:''
        ,LoginFlag:''
      }
      // this.$axios.post('http://localhost:3000/api/board/'+this.UserID,{params:this.user})
      this.$axios.get('http://localhost:3000/api',{params:this.user})
      .then((res)=>{
				if(res.data.success) {
					this.user = res.data.user.recordset[0];
          this.LoginFlag=res.data.user.LoginFlag;
          this.userName=this.user.name; 
          this.UserID=this.user.id;
          }
				else {
					alert("실행중 실패했습니다.\n다시 이용해 주세요.");
				}
			})
    }
    ,fnLogout(){
      this.LoginFlag='false';
      this.user={
        UserID:this.UserID
        ,PassWd:this.PassWd
        ,userName:''
        ,LoginFlag:this.LoginFlag
      }
      this.$axios.get('http://localhost:3000/api',{params:this.user})
      alert("로그아웃 되었습니다.");
      this.$router.push({path:'../', user:this.user});
      this.$router.go();
    }
    ,fnViewList(){
      this.user={
        UserID:this.UserID
        ,LoginFlag:this.LoginFlag
      }
      this.$router.push({path:'board/list', query:this.user});
    }
  }
}
</script>

<style scoped>
header{width:100%; text-align:center; position:relative; height:120px; border-bottom:1px solid #35495e}
header h1{position:absolute; top:0; left:100px;}
header h4{position:absolute; bottom:20%; left:190px;}
header ul.menu:after{display:block; clear:both; content:'';}
header ul.menu{position:absolute; top:20px; right:50px;}
header ul.menu li{float:left; padding:10px 20px; list-style:none;}
h1.centerLogo{position: relative; left:0px; color:rgb(10,43,110)}
a{text-decoration:none; color:grey;}
.btnWrap{position: relative; top:40px; padding-left: 60px;}
.btnAdd {background:indigo; color: cornsilk;}
</style>