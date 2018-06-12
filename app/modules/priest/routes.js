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
priestRouter.get('/notification', (req, res)=>{
    res.render('priest/views/notification')
});
priestRouter.get('/schedule', (req, res)=>{
    res.render('priest/views/schedule')
});
priestRouter.get('/appointments', (req, res)=>{
    res.render('priest/views/appointments')
});

//===============================================================================================//
exports.priest = priestRouter;