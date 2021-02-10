<template>
  <div id="app">
    <!-- 추가된 헤더 컴포넌트 사용 -->
    <router-view name="header"/>
    <div class="container"> <!--class 추가-->
    <router-view></router-view>
    </div>
    <!-- 추가된 풋터 컴포넌트 사용 -->
    <Footer />
  </div>
</template>

<script>
// import Header from './components/common/Header.vue'; //import 헤더 추가
//import HelloWorld from './components/HelloWorld.vue'; 
import Footer from './components/common/Footer.vue'; //import 풋터 추가

export default {
  name: 'App',
  components: {
    // Header          //헤더 컴포넌트 추가
    //, HelloWorld
    Footer         //풋터 컴포넌트 추가
    
  }
}
</script>

<style>
html,body{padding:0; margin:0;}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin:0; padding:0;
}
h1{color:#43b984;}
table{width:100%; border-collapse:collapse;}
.wrap{width:100%;}
.container{width:800px; margin:0 auto;}
a{text-decoration:none;}
.btn{padding:10px; background:#34445c; color:#fff;}
</style>