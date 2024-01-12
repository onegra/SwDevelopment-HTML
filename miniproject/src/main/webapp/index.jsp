<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.main-banner {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
		margin: auto;
		width: 2000px;
		height: 300px;
		padding: 10px; 
		overflow: hidden;
	}
	.sub-banner {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
		width: 85%;
		padding: 10px; 
	}
	
	.sub-banner-side {
		width: 85%;
		display: flex;
		flex-direction: center;
		justify-content: flex-start;
		padding: 0;
		gap: 2px;
	}
	
	.sub-img > a > img {
		width: 400px;
		padding: 10px;
		margin: 0 10px;
		border-radius: 20px;
	}
	
	h2 {
	text-align: center;
	}
	
	.rank-img > a > img {
		width: 400px;
		padding: 10px;
		margin: 0 10px;
		border-radius: 20px;
	}
</style>

<main>
	<div>
		<div class="main-banner">
			<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2312/231227014909_16007528.gif"></a>		
		</div>
		
		<div class="sub-banner frame sb">
		<div class="sub-banner-side">
            <div class="sub-img">
            	<a href="#"><img src="http://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240110105926_23013472.gif"></a>
            </div>
            <div class="sub-img">
            	<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240109014301_23017574.gif"></a>
            </div>
            <div class="sub-img">
                <a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240110023540_24000403.gif"></a>
            </div>
        </div>
        <div class="sub-banner-side">
            <div class="sub-img">
            	<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240110105816_23014838.gif"></a>
            </div>
            <div class="sub-img">
            	<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240111010554_16007528.gif"></a>
            </div>
            <div class="sub-img">
                <a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240109015144_16007528.gif"></a>
            </div>
        </div>
        <div class="sub-banner-side">
            <div class="sub-img">
            	<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240111051239_24000369.gif"></a>
            </div>
            <div class="sub-img">
            	<a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240111010658_16007528.gif"></a>
            </div>
            <div class="sub-img">
                <a href="#"><img src="https://ticketimage.interpark.com/TCMS3.0/NMain/MiniBanner/2401/240110023754_23016742.gif"></a>
            </div>
        </div>
		</div>
		
	</div>
	<h2>장르별 랭킹</h2>
	<div class="rank-menu frame flex sb">
		<ul>
			<li><a>뮤지컬</a></li>
			<li><a>콘서트</a></li>
			<li><a>스포츠</a></li>
			<li><a>전시/행사</a></li>
			<li><a>클래식/무용</a></li>
			<li><a>아동/가족</a></li>
			<li><a>연극</a></li>
			<li><a>레저 캠핑</a></li>
		</ul>
	</div>
	<div class="ranking">
		<div class="rank frame sb" style="flex: 5">
			<div class="ranking">
				<div class="rank-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="ranking">
				<div class="rank-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="ranking">
				<div class="rank-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="ranking">
				<div class="rank-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="ranking">
				<div class="rank-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
		</div>
	
		
		<a href="#">뮤지컬 랭킹 전체보기 > </a>
	</div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>