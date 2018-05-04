var express = require('express');
var secretariatRouter = express.Router();
// var secretariatRouter = express.Router();
// var secretariatRouter = express.Router();
// var secretariatRouter = express.Router();
// var reservationRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

secretariatRouter.use(authMiddleware.secretariatAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
secretariatRouter.get('/', (req, res)=>{
    res.render('secretariat/views/index')
});


//===============================================================================================//
// A P P O I N T //
//===============================================================================================//

secretariatRouter.get('/appoint', (req, res)=>{
    res.render('secretariat/views/appoint/coodinator')
});


secretariatRouter.get('/appoint/coordinator', (req, res)=>{
    res.render('secretariat/views/appoint/coordinator')
});


secretariatRouter.get('/appoint/member', (req, res)=>{
    res.render('secretariat/views/appoint/member')
});


secretariatRouter.get('/appoint/priest', (req, res)=>{
    res.render('secretariat/views/appoint/priest')
});


//===============================================================================================//
// E V E N T S //
//===============================================================================================//

secretariatRouter.get('/events', (req, res)=>{
    res.render('secretariat/views/event/sacraments')
});
secretariatRouter.get('/events/sacraments', (req, res)=>{
    res.render('secretariat/views/event/sacraments')
});


secretariatRouter.get('/events/seminars', (req, res)=>{
    res.render('secretariat/views/event/seminars')
});


//===============================================================================================//
// R E S E R V A T I O N //
//===============================================================================================//

secretariatRouter.get('/reservation/', (req, res)=>{
    res.render('secretariat/views/reservation/document')
});
secretariatRouter.get('/reservation/document', (req, res)=>{
    res.render('secretariat/views/reservation/document')
});


secretariatRouter.get('/reservation/events', (req, res)=>{
    res.render('secretariat/views/reservation/events')
});


secretariatRouter.get('/reservation/facilities', (req, res)=>{
    res.render('secretariat/views/reservation/facilities')
});

//===============================================================================================//
exports.secretariat = secretariatRouter;
// exports.index = indexRouter;
// exports.appoint = appointRouter;
// exports.events = eventsRouter;
// exports.reservation = reservationRouter;