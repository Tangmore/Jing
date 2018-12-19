const mysql = require("mysql");
var pool = mysql.createPool({
	host: "127.0.0.1",//服务器ip
	port: 3306,
	user: "root",
	password: "",
	database: "lemon",
	connetionLimit: 15
});
module.exports = pool;