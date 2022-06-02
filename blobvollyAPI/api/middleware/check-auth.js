const jwt = require('jsonwebtoken');

module.exports =(req, res, next) => {
    try{
        const token = req.headers.authorization.split(" ")[1];
        console.log(token);
        const decoded = jwt.verify(req.body.token, 'secret71232key');
        req.userData = decoded;
    } catch (error){
        return res.status(401).json({
            message: 'Authentication failed'
        })
    }
    next(); 
};