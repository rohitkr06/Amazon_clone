console.log("hello world");
const express= require("express");
const mongoose=require("mongoose");

const authRouter=require("./route/auth.js");
const PORT=3000;
const app=express();

const db="mongodb+srv://rohit:rohit001@cluster0.z2qcruw.mongodb.net/?retryWrites=true&w=majority";

app.use(authRouter);

mongoose.connect(db).then(()=>{
    console.log("connection Successful");
}).catch((e)=>{
    console.log(e);
}); 

app.listen(PORT,()=>{
    console.log(`Connected at port ${PORT}`);
});
