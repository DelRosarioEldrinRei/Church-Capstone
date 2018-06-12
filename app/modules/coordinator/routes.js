var express = require('express');
var coordinatorRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

coordinatorRouter.use(authMiddleware.coordinatorAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
coordinatorRouter.get('/', (req, res)=>{
    res.render('coordinator/views/index')
});
coordinatorRouter.get('/members', (req, res)=>{
    res.render('coordinator/views/members')
});
coordinatorRouter.get('/officers', (req, res)=>{
    res.render('coordinator/views/officers')
});
coordinatorRouter.get('/schedule', (req, res)=>{
    res.render('coordinator/views/schedule')
});
coordinatorRouter.get('/appointments', (req, res)=>{
    res.render('coordinator/views/appointments')
});

//===============================================================================================//
exports.coordinator = coordinatorRouter;