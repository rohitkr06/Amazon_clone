const express=require("express");
const User = require("../models/user");
// const authrouter=express.Router;
const authrouter = express.Router(); 
const bcryptjs=require('bcryptjs');
const jwt=require('jsonwebtoken');
const auth = require("../middlewares/auth");

//sign up
authrouter.post("/api/signup",async (req,res)=>{

    try{
        console.log(req.body);
        const {name,email,password}=req.body;

    const existinguser=await User.findOne({email});
    if(existinguser)
    {
        return res.status(400).json({msg: 'User already exist with same email'});
    }

    const hashedpass=await bcryptjs.hash(password,6);
    
    let user=User({
        email,
        password:hashedpass,
        name,
    })
    console.log(user);

    
    user=await user.save();
    res.json(user);
    }catch(e){
        console.log(e);
        res.status(500).json({error: e.message}); 
    }

    

})

//Sign in
authrouter.post("/api/signin", async (req,res)=>{
    try{
        const {email,password}=req.body;
        const user=await User.findOne({email})
        if(!user)
        {
            return res.status(400).json({msg:"Email doesnt exist"});
        }
        let ismatch=await bcryptjs.compare(password,user.password);
       
        if(!ismatch)
        {
            return res.status(400).json({msg:"Password entered is wrong"});
        }
        const token=jwt.sign({id: user._id},"Pass");
        // console.log(token);
        res.json({token,...user._doc});
        // res.json({message:'success'});
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

// check if token is vald or not
authrouter.post("/tokenisvalid", async (req,res)=>{
    try{
        // console.log('agaya');
        const token=req.header('x-auth-token');
        console.log('rndi'+token);
        if(token==null) return res.json(false);

        const verified=jwt.verify(token,'Pass');  //key used here is Pass

        if(!verified) return res.json(false);

        const user=await User.findById(verified.id);
        if(!user) return res.json(false);

        //added return to check
        return res.json(true);

    } catch (e){

    }
})

// get data from token

authrouter.get('/',auth,async (req,res)=>{
    const user=User.findById(req.user);
    res.json({...user._doc,token: req.token});
})

module.exports=authrouter;