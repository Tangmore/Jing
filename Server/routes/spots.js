const express=require("express");
const router=express.Router();
const pool=require("../pool");

//测试: http://localhost:3001/spots/carousel
router.get("/carousel",(req,res)=>{
    var list = [];
    list.push(req.query.num1);
    list.push(req.query.num2);
    list.push(req.query.num3);
    list.push(req.query.num4);
  var sql=`SELECT * FROM carousel 
    WHERE cid=? OR cid=? OR cid=? OR cid=?`;
  pool.query(sql,list,(err,result)=>{
    if(err) throw (err);
    res.send(result);
  })
})

router.get("/allSpotsList",(req,res)=>{
  var sql = `SELECT country,spot,sid FROM spot ORDER BY sid`;
  pool.query(sql,(err,result)=>{
    if(err) throw (err);
    res.send(result);
  })
  
})
module.exports=router;