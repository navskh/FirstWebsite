import Vue from 'vue';
import Router from 'vue-router';
import HelloWorld from '@/components/HelloWorld'; //메인 컴포넌트 호출
import List from '@/components/board/List'; //게시판 리스트 컴포넌트 호출
import Write from '@/components/board/Write'; //게시판 리스트 컴포넌트 호출
import View from '@/components/board/View'; //게시판 상세보기 
import User from '@/components/board/User'; //회원 가입, 회원 관리, 로그인
import Header from '@/components/common/Header'; // 헤더 부분 수정할 때 사용
import UserAdd from '@/components/board/UserAdd'; // 헤더 부분 수정할 때 사용

Vue.use(Router); //vue 라우터 사용

export default new Router({ //라우터 연결
	routes:[
		{
			path:'/'
			,components:{
        default:HelloWorld
        ,header:Header
      }
		}
		,{
			path:'/board/list'
			,name:List
			,components:{
        default:List
        ,header:Header
      }
    }
    ,{
      path:'/board/write'
      ,name:Write
      ,components:{
        default:Write
        ,header:Header
      }
    }
    ,{
      path:'/board/view'  // 상세 페이지
      ,name:View
      ,components:{
        default:View
        ,header:Header
      }
    }
    ,{
      path:'/board/user'  // 회원관리
      ,name:User
      ,components:{
        default:User
        ,header:Header
      }
    }
    ,{
      path:'/board/userAdd'  // 회원관리
      ,name:UserAdd
      ,components:{
        default:UserAdd
        ,header:Header
      }
    }
	]
})