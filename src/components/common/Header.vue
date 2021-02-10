<template>
	<header>
		<h1>
      <router-link to="/">
        <img alt="Vue logo" src="../../assets/panda.jpg" width="80">
      </router-link>
    </h1>
    <h4>
      <template v-if="LoginFlag===true">
        {{UserID}}님 반갑습니다!
      </template>
      <template v-else>
      <router-link to="/board/user">
        로그인
      </router-link>
      </template>
      <input type="button" value="button" @click="fnGetHeader">
    </h4>
		<div class="menuWrap">
			<ul class="menu">
				<li>
          <router-link to="/board/list">게시판</router-link>
        </li>
        <!--
				<li><a href="javascript:;">메뉴2</a></li>
				<li><a href="javascript:;">메뉴3</a></li>
				<li><a href="javascript:;">메뉴4</a></li>
        -->
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
        ,LoginFlag:''
        }
  }
  ,mounted(){
    this.GetHeader()
  }
  ,methods:{
    fnGetHeader(){
      console.log(this.UserID);
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

a{text-decoration:none; color:#333;}
</style>