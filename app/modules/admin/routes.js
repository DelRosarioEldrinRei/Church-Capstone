var express = require('express');
var adminRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

adminRouter.use(authMiddleware.adminAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
adminRouter.get('/', (req, res)=>{
    res.render('admin/views/index')
});



//===============================================================================================//
exports.admin = adminRouter;