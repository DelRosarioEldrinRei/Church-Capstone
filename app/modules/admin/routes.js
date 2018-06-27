var express = require('express');
var adminRouter = express.Router();
var moment = require('moment');
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

adminRouter.use(authMiddleware.adminAuth)
//===============================================================================================//
// I N D E X //
//===============================================================================================//
adminRouter.get('/', (req, res)=>{
    res.render('admin/views/index')
});
adminRouter.get('/reservations', (req, res)=>{
    res.render('admin/views/transactions/reservations')
});
adminRouter.get('/reservations/details', (req, res)=>{
    res.render('admin/views/transactions/details')
});


//===============================================================================================//
// M A I N T E N A N C E //
//===============================================================================================//

adminRouter.get('/maintenance-events', (req, res)=>{    
    var queryString2 =`SELECT * FROM tbl_specialevent`
    db.query(queryString2, (err, results, fields) => {
        if (err) console.log(err);
        for(var i = 0; i < results.length; i++){

            results[i].time_eventstart= moment(results[i].time_eventstart).format('YYYY-MM-DD h:mm a');
            results[i].time_eventend= moment(results[i].time_eventend).format('YYYY-MM-DD h:mm a');
        }
        return res.render('admin/views/maintenance/events',{specialevents: results });
    });     
});

adminRouter.get('/maintenance-services', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_event`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);
        var sacraments = results;        
        return res.render('admin/views/maintenance/services',{ sacraments : sacraments });    
    });
});
adminRouter.get('/maintenance-facilities', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_facility`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);       
        return res.render('admin/views/maintenance/facilities',{ facilities : results });
    });     
});


adminRouter.get('/maintenance-facilities/:int_facilityID/delete', (req, res) => {
    const queryString = `DELETE FROM tbl_facility
    WHERE int_facilityID= ${req.params.int_facilityID}`;
    
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-facilities');
        
    });
});

adminRouter.post('/addfacility', (req, res) => {
   
    var queryString= `INSERT INTO tbl_facility(var_facilityname, flt_rentfee) VALUES(?,?);`  
        db.query(queryString,  [req.body.facilityname, req.body.fee], (err, results, fields) => {
            if (err) throw err;
                return res.redirect('/admin/maintenance-facilities');
        });            
    });

adminRouter.post('/editfacility/:int_facilityID', (req, res) => {
    const queryString = `UPDATE tbl_facility SET var_facilityname =?,  flt_rentfee= ?
    WHERE int_facilityID= ${req.params.int_facilityID}`;
    
    db.query(queryString,[req.body.facilityname, req.body.flt_rentfee], (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-facilities');
        
    });
});
adminRouter.get('/maintenance-ministries', (req, res)=>{
    res.render('admin/views/maintenance/ministries')
});
adminRouter.get('/maintenance-requirements', (req, res)=>{
    res.render('admin/views/maintenance/requirements')
});

//===============================================================================================//
// T R A N S A C T I O N S //
//===============================================================================================//
adminRouter.get('/transaction-facilityreservation', (req, res)=>{
    res.render('admin/views/transactions/facilityres')
});
adminRouter.get('/transaction-documentrequest', (req, res)=>{
    res.render('admin/views/transactions/dodcureq')
});
adminRouter.get('/transaction-walkin', (req, res)=>{
    res.render('admin/views/transactions/walkin')
});
adminRouter.get('/transaction-baptism', (req, res)=>{
    res.render('admin/views/transactions/eventapp/baptism')
});
adminRouter.get('/transaction-blessing', (req, res)=>{
    res.render('admin/views/transactions/eventapp/blessings')
});
adminRouter.get('/transaction-confirmation', (req, res)=>{
    res.render('admin/views/transactions/eventapp/confirmation')
});
adminRouter.get('/transaction-marriage', (req, res)=>{
    res.render('admin/views/transactions/eventapp/marriage')
});

exports.admin = adminRouter;