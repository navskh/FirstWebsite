<template>
	<div>
		<h2>게시판 리스트</h2>

    <div class="searchWrap" >
      <select v-model="view_mode" @change="fnSelectViewMode">
        <option value="select_ten">10개씩 보이기</option>
        <option value="select_thirty">30개씩 보이기</option>
        <option value="select_fifty">50개씩 보이기</option>
        <option value="select_hundred">100개씩 보이기</option>
      </select>
      <input type="text" v-model="keyword" @keyup.enter="fnSearch" /><a href="javascript:;" @click="fnSearch" class="btnSearch btn">검색</a>
		</div>

    <div class="listWrap">
			<table class="tbList">
				<colgroup>
					<col width="6%" />
					<col width="*" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th>no</th>
					<th>제목</th>
					<th>아이디</th>
					<th>날짜 
            <a href="javascript:;" @click="fnAscend"><a href="javascript:;" @click="fnGetList(paging.updown)">▲</a></a>
            <a href="javascript:;" @click="fnDescend"><a href="javascript:;" @click="fnGetList(paging.updown)">▼</a></a>
            </th>
				</tr>

        <tr v-for="(row, idx) in list.recordset" :key="idx">
        <td>{{row.i_num}}</td>
        <td class="txt_left"><a href="javascript:;" @click="fnView(`${row.num}`,`${paging.updown}`)">{{row.subject}}</a></td>
        <td>{{row.id}}</td>
        <td>{{row.regdate}}</td>
        </tr>

				<tr v-if="list.length == 0">
					<td colspan="4">데이터가 없습니다.</td>
				</tr>
			</table>
		</div> 
  <div class="pagination" v-if="paging.totalCount > 0">
			<a href="javascript:;" @click="fnPage(1,`${paging.updown}`)" class="first">&lt;&lt;</a>
			<a href="javascript:;" v-if="paging.end_page > 10" @click="fnPage(`${--paging.page}`,`${paging.updown}`)" class="prev">&lt;</a>
			<template v-for=" (n,index) in paginavigation()">
				<template v-if="paging.page==n">
					<strong :key="index">{{n}}</strong> <!--현재 페이지 굵은 글씨로 출력-->
				</template>
				<template v-else>
					<a href="javascript:;" @click="fnPage(`${n}`,`${paging.updown}`)" :key="index">{{n}}</a> <!--현재 페이지 아닌 페이지 얇은 글씨로 출력-->
				</template>
			</template>
			<a href="javascript:;" v-if="paging.total_page > paging.end_page" @click="fnPage(`${++paging.page}`,`${paging.updown}`)" class="next">&gt;</a>
			<a href="javascript:;" @click="fnPage(`${paging.total_page}`,`${paging.updown}`)" class="last">&gt;&gt;</a>
		</div>

		<div class="btnRightWrap">
			<a href="javascript:;" @click="fnAdd(`${paging.updown}`)" class="btn">등록</a>
		</div>
	</div>
</template>

<script>
export default {
    data() {
      return {
       body:'' //리스트 페이지 데이터전송
			,board_code:'news' //게시판코드
			,list:'' //리스트 데이터
			,no:'' //게시판 숫자처리
			,paging:'' //페이징 데이터
			,start_page:'' //시작페이지
			,page:this.$route.query.page ? this.$route.query.page:1
			,keyword:this.$route.query.keyword
      ,updown:this.$route.query.updown
      ,view_mode:'select_ten'
      ,LoginFlag:this.$route.query.LoginFlag
      ,userID:this.$route.query.UserID
			,paginavigation:function() { //페이징 처리 for문 커스텀
				var pageNumber = [];
				var start_page = this.paging.start_page;
				var end_page = this.paging.end_page;
				for (var i = start_page; i <= end_page; i++) pageNumber.push(i);
				return pageNumber;
        }
      }
    }
    ,mounted(){
      this.fnGetList(this.updown); 
    }
  ,methods:{
		fnGetList(updown) { //데이터 가져오기 함수
			this.body = { // 데이터 전송
				board_code:this.board_code
				,keyword:this.keyword
        ,page:this.page
        ,updown:updown
        ,view_mode:this.view_mode
      }
			this.$axios.get('http://localhost:3000/api/board',{params:this.body}) 
			.then((res)=>{
				if(res.data.success) {
					this.list = res.data.list;
					this.paging = res.data.paging;
					this.no = this.paging.totalCount - ((this.paging.page-1) * this.paging.ipp);
          this.updown = updown;
				} else {
					alert("실행중 실패했습니다.\n다시 이용해 주세요.");
				}
			})
			.catch((err)=>{
				console.log(err);
			})
		}
		,fnAdd(updown) {
      this.body.updown = updown;
      this.body.LoginFlag = this.LoginFlag;
      this.body.userID = this.userID;
      if(this.LoginFlag==='true')  this.$router.push({path:'./write',query:this.body});
      else alert("로그인하셔야 작성이 가능합니다.")
			
		}
		,fnSearch() { //검색
			this.paging.page = 1;
			this.fnGetList(this.paging.updown);
		}
		,fnPage(n) {
			if(this.page != n) {
				this.page = n;
				this.fnGetList(this.paging.updown);
			}
    }
    ,fnView(num,updown) {
      this.body.num = num;
      this.body.updown = updown;
      this.body.LoginFlag = this.LoginFlag;
      this.body.userID = this.userID;
      this.$router.push({path:'./view',query:this.body}); // 추가한 상세페이지 라우터 
    }
    ,fnAscend(){
      this.body.updown = 1;
      this.$axios.get("http://localhost:3000/api/board/",{params:this.body});
    }
    ,fnDescend(){
      this.body.updown = 2;
      this.$axios.get("http://localhost:3000/api/board/",{params:this.body});
    }
    ,fnSelectViewMode(){
      this.body.view_mode=this.view_mode;
      this.fnGetList(this.paging.updown);
    }
	}
}
</script>

<style scoped>
  searchWrap{border:1px solid #888; border-radius:5px; text-align:center; padding:20px 0; margin-bottom:40px;}
	.searchWrap input{width:60%; height:30px; border-radius:3px; padding:0 10px; border:1px solid #888; margin:10px;}
	.searchWrap .btnSearch{display:inline-block; margin-left:10px;}
	.tbList th{border-top:1px solid #888;}
	.tbList th, .tbList td{border-bottom:1px solid #eee; padding:5px 0;}
	.tbList td.txt_left{text-align:left;}
	.btnRightWrap{text-align:right; margin:10px 0 0 0;}

  h2 {text-align : center; margin:10px; width:90%;}

	.pagination{margin:20px 0 0 0; text-align:center;}
	.first, .prev, .next, .last{border:1px solid #666; margin:0 5px;}
	.pagination span{display:inline-block; padding:0 5px; color:#333;}
	.pagination a{text-decoration:none; display:inline-blcok; padding:0 5px; color:#666;}
</style>