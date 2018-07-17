var express = require('express');
var catechistRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

catechistRouter.use(authMiddleware.catechistAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
catechistRouter.get('/', (req, res)=>{
    res.render('catechist/views/index')
});
catechistRouter.get('/profile', (req, res)=>{
    res.render('catechist/views/profile')
});
catechistRouter.get('/schedule', (req, res)=>{
    res.render('catechist/views/schedule')
});

/// SECTIONS
    catechistRouter.get('/sections', (req, res)=>{
        var queryString2 =`SELECT * FROM tbl_specialevent`
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err);
                for(var i = 0; i < results.length; i++){
                }
                return res.render('catechist/views/sections',{specialevents: results });
            });   
    });

    // catechistRouter.get('/sections/add', (req, res)=>{
    //     var queryString1 = `INSERT INTO tbl_grd3students(int_userID, int_facilityID, var_event, date_reservedate,time_reservestart, time_reserveend, char_reservestatus) VALUES(?,?,?,?,?,?,?)`;
    //     db.query(queryString1, [req.session.user.int_userID, req.session.user.facilityID.int_facilityID, req.body.event, req.body.desireddate, req.body.starttime, req.body.endtime, 'Pending'], (err, results, fields) => {
    //         if (err) throw err;
    //         return res.redirect(`/guest`);
    //     });
    // });
//===============================================================================================//
exports.catechist = catechistRouter;