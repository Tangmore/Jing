<template>
	<div class="homeNav">
		<nav class="homeNavItem">
                <ul>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav0.png" alt="">
                            <span>京东超市</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav1.gif" alt="">
                            <span>全球购</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav2.png" alt="">
                            <span>服装城</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav3.png" alt="">
                            <span>京东生鲜</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav4.png" alt="">
                            <span>京东到家</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav5.png" alt="">
                            <span>充值中心</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav6.png" alt="">
                            <span>惠赚钱</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav7.png" alt="">
                            <span>领券</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav8.png" alt="">
                            <span>物流查询</span>
                        </a>
                    </li>
                    <li class="nav_item">
                        <a href="#" class="nav_item_link">
                            <img src="../../assets/images/nav9.png" alt="">
                            <span>我的关注</span>
                        </a>
                    </li>
                </ul>
            </nav>
	</div>
</template>

<style >
/*导航*/
.homeNavItem {
    max-width: 100%;
    height: 150px;
}
.homeNavItem .nav_item {
    width: 20%;
    height: 70px;
}
.homeNavItem ul {
    width: 100%;
    padding-top: 16px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    text-align: center;
}
.nav_item .nav_item_link {
    display: flex;
    flex-direction: column;
}

.nav_item .nav_item_link img {
    width: 30px;
    height: 30px;
    margin: 0 auto;
}
.nav_item .nav_item_link span {
    font-size: 12px;
}
</style>