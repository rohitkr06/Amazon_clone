const express=require("express");
// const authrouter=express.Router;
const authrouter = express.Router(); 

authrouter.post('/api/signup',(req,res)=>{
    const {name,email,password}=req.body;
})

module.exports=authrouter;