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
adminRouter.get('/events/sacraments', (req, res)=>{
    res.render('admin/views/event/sacraments')
});
adminRouter.get('/events/seminars', (req, res)=>{
    res.render('admin/views/event/seminars')
});



//===============================================================================================//
exports.admin = adminRouter;