
// do ask about this
const jwt=require('jsonwebtoken');

const auth=async(req,res,next)=>{
    try{
        const token=req.header('x-auth-token');
        
        if(!token)
        return res.status(401).json({msg:"No auth token, access denied"});

        const verified=jwt.verify(token,'Pass')
        if(!verified)
        return res.status(401).json({msg:"Token verification failed, access denied"});

        req.user=verified.id;
        req.token=token;
        next();

    }
    catch{error}{
        console.log('randi ka'+error);
        return res.status(500).json({msg:error.msg});
    }
};

module.exports=auth;