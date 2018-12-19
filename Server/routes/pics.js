const express=require("express");
const router=express.Router();
const pool=require("../pool");

//测试: http://localhost:3001/pics/pics
router.get("/pics",(req,res)=>{
    var sql=`SELECT *FROM spot s,img i WHERE s.sid=i.iid`;
  pool.query(sql,(err,result)=>{
    if(err) throw (err);
    res.send(result);
  })
})

module.exports=router;