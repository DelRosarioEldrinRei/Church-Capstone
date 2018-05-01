var express = require('express');
var priestRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

priestRouter.use(authMiddleware.priestAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
priestRouter.get('/', (req, res)=>{
    res.render('priest/views/index')
});



//===============================================================================================//
exports.priest = priestRouter;