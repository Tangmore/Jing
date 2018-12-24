const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const session=require("express-session");
const index =require('./route/index')


var app = express();
app.listen(3008);
console.log("服务器创建成功，端口号3008");

app.use(bodyParser.urlencoded({extended:false}));
app.use(express.static(__dirname + "/public"));
app.use(cors({
    origin:[
        "http://192.168.0.112:3008",
        "http://127.0.0.1:3008",
        "http://127.0.0.1:8080",
        "http://localhost:8080"
    ],
    credentials:true
}))
app.use(session({
    secret:"128位随机字符",
    resave:false,
    saveUninitialized:true
  }))

  app.use('/',index);
