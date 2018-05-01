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



//===============================================================================================//
exports.coordinator = coordinatorRouter;