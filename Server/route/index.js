const express = require('express');
const pool = require("../pool");
const common = require('../libs/common');
const route = express.Router(); 

   const getHomeStr = `SELECT product_id,product_name,product_price,product_img_url,product_uprice FROM product`;
    const getCateNames = `SELECT * FROM category ORDER BY category_id desc`;
    //获取主页数据
    route.get('/home', (req, res) => {
    const getHomeStr = `SELECT product_id,product_name,product_price,product_img_url,product_uprice FROM product`;
    const getCateNames = `SELECT * FROM category ORDER BY category_id desc`;
        pool.query(getHomeStr, (err, data) => {
            if (err) throw err;
            if (data.length == 0) {
                res.status(500).send('no datas').end();
            } else {
                res.send(data);
            }
        });
    });

    //获取产品详情    
    route.get('/detail', (req, res) => {
        let produId = req.query.mId;
        const imagesStr = `select image_url from product_image where product_id='${produId}'`;
        const productStr = `select * from product where product_id='${produId}'`;
        let detailDatas = [];
        pool.query(imagesStr, (err, imgDatas) => {
            if (err) throw err;
            detailDatas.push(imgDatas);
            pool.query(productStr, (err, data) => {
                if (err) throw err;
                    detailDatas.push(data);
                    res.send(detailDatas);
                });
    });
    });

    
    // 商品搜索
    route.get('/search', (req, res) => {
        let keyWord = req.query.kw;
        let hot = req.query.hot;
        let priceUp = req.query.priceUp;
        let priceDown = req.query.priceDown;
        // 按关键词---普通查询
        const keywordStr = `select  *  from product,shop where product.shop_id=shop.shop_id and product.product_name like '%${keyWord}%'`;
        // 按评论数
        const hotStr = `select  *  from product,shop where product.shop_id=shop.shop_id and product.product_name like '%${keyWord}%' order by product_comment_num desc`;
        // 按价格
        const priceUpStr = `select  *  from product,shop where product.shop_id=shop.shop_id and product.product_name like '%${keyWord}%' order by product_uprice asc`;
        const priceDownStr = `select  *  from product,shop where product.shop_id=shop.shop_id and product.product_name like '%${keyWord}%' order by product_uprice desc`;
        if (keyWord != '') {
            if (hot != '') {
                getSearchDatas(hotStr, res);
            } else if (priceUp != '') {
                getSearchDatas(priceUpStr, res);
            } else if (priceDown != '') {
                getSearchDatas(priceDownStr, res);
            } else {
                getSearchDatas(keywordStr, res);
            }
        }

    });
 
    function getSearchDatas(keywordStr, res) {
        pool.query(keywordStr, (err, data) => {
            if (err) throw err;
                if (data.length == 0) {
                    res.status(500).send('no datas').end();
                } else {
                    res.send(data);
                }
        });
    }





















    route.get('/category', (req, res) => {
        getCateNamesDatas(getCateNames, res);
    });

    function getCateNamesDatas(getCateNames, res) {
        pool.query(getCateNames, (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send('database err').end();
            } else {
                if (data.length == 0) {
                    res.status(500).send('no datas').end();
                } else {
                    res.send(data);
                }
            }
        });
    };


    route.get('/categorygoods', (req, res) => {
        let mId = req.query.mId;
        const sql = `select * from product,category where product.category_id=category.category_id and category.category_id='${mId}'`;
        getCateGoods(sql, res);
    });

    function getCateGoods(sql, res) {
        pool.query(sql, (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send('database err').end();
            } else {
                if (data.length == 0) {
                    res.status(500).send('no datas').end();
                } else {
                    res.send(data);
                }
            }
        });
    }

    route.get('/cart', (req, res) => {
        const cartStr = "SELECT cart_id,user.user_id,product.product_id,product_name,product_uprice,product_img_url,goods_num,product_num,shop_name FROM product,user,goods_cart,shop where product.product_id=goods_cart.product_id and user.user_id=goods_cart.user_id and shop.shop_id = product.shop_id";
        pool.query(cartStr, (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send('database err').end();
            } else {
                if (data.length == 0) {
                    res.status(500).send('no datas').end();
                } else {
                    res.send(data);
                }
            }
        });
    })

   
    /*
     *用户注册
     */
    route.post('/reg', (req, res) => {
        let mObj = {};
        for (let obj in req.body) {
            mObj = JSON.parse(obj);
        }
        let regPhone = mObj.regPhone;
        let regPasswd = mObj.regPasswd;
        regPasswd = common.md5(regPasswd + common.MD5_SUFFXIE);

        const insUserInfo = `INSERT INTO user(user_phone,login_password)
         VALUES('${regPhone}','${regPasswd}')`;
        pool.query(insUserInfo,[regPhone,regPasswd], (err) => {
            if (err) {
                console.error(err);
                res.send({ 'msg': '服务器出错', 'status': 0 }).end();
            } else {
                res.send({ 'msg': '注册成功', 'status': 1 }).end();
            }
        })
    });

    /**
     * 验证手机号
     */
    route.get('/ackphone',(req,res)=>{
        var phone = req.query.phone;
        var ackUserPhone=`SELECT user_id FROM user 
        WHERE user_phone=?`;
        pool.query(ackUserPhone,phone,(err,result)=>{
            if(err) throw (err);
            if(result.length>0){
                res.send({
                    code:1,
                    msg:"手机号已被占用！"
                });
            }
        })
    })


/**
 * 用户登录
 */
    route.post('/login', (req, res) => {

        let mObj = {};
        for (let obj in req.body) {
            mObj = JSON.parse(obj);
            // console.log(mObj);
        }
        let user_phone = mObj.loginPhone;
        let password = common.md5(mObj.loginPawd + common.MD5_SUFFXIE);
        // console.log(username, mObj.passwd);
        const selectUser = `SELECT * FROM user where user_phone='${user_phone}'`;
        pool.query(selectUser, (err, data) => {
            if (err) throw err;
                if (data.length == 0) {
                    res.send({ 'msg': '该用户不存在', 'status': -1 }).end();
                } else {
                    let dataw = data[0];
                   
                    if (dataw.login_password === password) {
                        //save the session 
                        req.session['user_id'] = dataw.user_id;
                        dataw.msg = "登录成功";
                        dataw.status = 1;
                        console.log(dataw)
                        res.send(dataw).end();
                    } else {
                        res.send({ 'msg': '密码不正确', 'status': -2 }).end();
                    }
                }
    });
});














    route.get('/userinfo', (req, res) => {
        let uId = req.query.uId;
        const getU = `SELECT user_name,user_number FROM user where user_id='${uId}'`;
        pool.query(getU, (err, data) => {
            if (err) {
                console.log(err);
                res.status(500).send('database err').end();
            } else {
                if (data.length == 0) {
                    res.status(500).send('no datas').end();
                } else {
                    res.send(data[0]);
                }
            }
        });
    });

 module.exports=route;

