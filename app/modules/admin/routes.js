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
//EVENTS
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

adminRouter.post('/maintenance-events/add', (req, res) => {
    var start= moment(req.body.start, 'hh:mm A').format('YYYY-MM-DD h:mm a');
    var end= moment(req.body.emd, 'hh:mm A').format('YYYY-MM-DD h:mm a');
    var queryString= `INSERT INTO tbl_specialevent(
        
        int_userID,
        var_spceventname,
        text_eventdesc,
        time_eventstart,
        time_eventend,
        var_eventvenue,
        char_eventtype,
        var_approvalstatus
        ) VALUES(?,?,?,?,?,?,?,?);`  
        db.query(queryString,  [req.session.admin.int_userID, req.body.spceventname, req.body.eventdesc, start, end, "Approved"], (err, results, fields) => {
            if (err) throw err;
                return res.redirect('/admin/maintenance-events');
        });            
    });


adminRouter.get('/maintenance-events/delete?int_eventID', (req, res) => {
    const queryString = `DELETE FROM tbl_specialevent
    WHERE int_eventID= ${req.params.int_specialeventID}`;
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-events');
    });
});

adminRouter.post('/maintenance-events/cancel?int_specialeventID', (req, res) => {
    const queryString = `UPDATE tbl_specialevent SET var_approvalstatus = "Cancelled"
    WHERE int_specialeventID= ${req.params.int_specialeventID}`;
    
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-events');
        
    });
});

adminRouter.post('/maintenance-events/edit?int_specialeventID', (req, res) => {
    var start= moment(req.body.start, 'hh:mm A').format('YYYY-MM-DD h:mm a');
    var end= moment(req.body.emd, 'hh:mm A').format('YYYY-MM-DD h:mm a');
    const queryString = `UPDATE tbl_specialevent SET 
        var_spceventname=?,
        text_eventdesc=?,
        time_eventstart=?,
        time_eventend=?,
        var_eventvenue=?,
        char_eventtype=?,
        var_approvalstatus
    WHERE int_specialeventID= ${req.params.int_specialeventID}`;
    
    db.query(queryString,[req.body.spceventname, req.body.eventdesc, start, end, venue, eventtype, "Approved"], (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-events');
        
    });
});
//=======================================================
//SERVICES
//=======================================================
adminRouter.get('/maintenance-services', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_event`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);
        var sacraments = results;        
        return res.render('admin/views/maintenance/services',{ sacraments : sacraments });    
    });
});

adminRouter.post('/maintenance-services/add', (req, res) => {
    var queryString= `INSERT INTO tbl_event(
        var_eventname,
        text_eventdesc,
        ) VALUES(?,?);`  
        db.query(queryString,  [req.body.eventname, req.body.eventdesc], (err, results, fields) => {
            if (err) throw err;
                return res.redirect('/admin/maintenance-services');
        });            
    });

    
adminRouter.get('/maintenance-services/delete?int_eventID', (req, res) => {
    const queryString = `DELETE FROM tbl_event
    WHERE int_eventID= ${req.params.int_eventID}`;
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-services');
    });
});

// adminRouter.post('/maintenance-services/cancel?int_eventID', (req, res) => {
//     const queryString = `UPDATE tbl_event SET var_approvalstatus = "Cancelled"
//     WHERE int_eventID= ${req.params.int_eventID}`;
    
//     db.query(queryString, (err, results, fields) => {        
//         if (err) throw err;
//         return res.redirect('/admin/maintenance-services');
        
//     });
// });

adminRouter.post('/maintenance-services/edit?int_eventID', (req, res) => {
   
    const queryString = `UPDATE tbl_event SET 
        var_eventname=?,
        var_eventdesc=?
        
    WHERE int_eventID= ${req.params.int_eventID}`;
    
    db.query(queryString,[req.body.eventname, req.body.eventdesc], (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-cervices');
        
    });
});
//=======================================================
//FACILITY
//=======================================================
adminRouter.get('/maintenance-facilities', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_facility`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);       
        return res.render('admin/views/maintenance/facilities',{ facilities : results });
    });     
});


adminRouter.get('/maintenance-facilities/delete?int_facilityID', (req, res) => {
    const queryString = `DELETE FROM tbl_facility
    WHERE int_facilityID= ${req.params.int_facilityID}`;
    
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-facilities');
        
    });
});

adminRouter.post('/maintenance-facilities/add', (req, res) => {
   
    var queryString= `INSERT INTO tbl_facility(var_facilityname, flt_rentfee) VALUES(?,?);`  
        db.query(queryString,  [req.body.facilityname, req.body.fee], (err, results, fields) => {
            if (err) throw err;
                return res.redirect('/admin/maintenance-facilities');
        });            
    });

adminRouter.post('/maintenance-facilities/edit?int_facilityID', (req, res) => {
    const queryString = `UPDATE tbl_facility SET var_facilityname =?, flt_rentfee= ?
    WHERE int_facilityID= ${req.params.int_facilityID}`;
    
    db.query(queryString,[req.body.facilityname, req.body.flt_rentfee], (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-facilities');
        
    });
});
//=======================================================
//MINISTRIES/ORG
//=======================================================
adminRouter.get('/maintenance-ministries', (req, res)=>{
    res.render('admin/views/maintenance/ministries')
});
//=======================================================
//REQUIREMENTS 
//eeeyy not yet done -_-
//=======================================================
adminRouter.get('/maintenance-requirements', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Anointing of the sick")`
    var queryString2 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Baptism")`
    var queryString3 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Confirmation")`
    var queryString4 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Funeral Mass=" or var_eventname= "Funeral Service" )`
    var queryString5 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Marriage")`
    var queryString6 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Establishment Blessing")`
    var queryString7 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="RCIA")`
    var queryString8 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Eucharist")`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err); 
        var anointing = result;
        db.query(queryString2, (err, results, fields) => {
            if (err) console.log(err); 
            var baptism = result;
            db.query(queryString3, (err, results, fields) => {
                if (err) console.log(err); 
                var confirmation = result;
                db.query(queryString4, (err, results, fields) => {
                    if (err) console.log(err); 
                    var funeral = result;
                    db.query(queryString5, (err, results, fields) => {
                        if (err) console.log(err); 
                        var marriage = result;
                        db.query(queryString6, (err, results, fields) => {
                            if (err) console.log(err);
                            var establishment = result; 
                            db.query(queryString7, (err, results, fields) => {
                                if (err) console.log(err);
                                var rcia = result; 
                                db.query(queryString8, (err, results, fields) => {
                                    if (err) console.log(err);
                                    var eucharist = result;       
        return res.render('admin/views/maintenance/requirements',{ anointing : anointing,baptism : baptism,confirmation : confirmation,funeral : funeral, marriage : marriage,establishment : establishment, rcia : rcia,eucharist : eucharist,});
    }); }); }); }); }); }); }); 

});     
});


adminRouter.post('/maintenance-requirements/add', (req, res) => {
   
    var queryString= `INSERT INTO tbl_requirementtype(var_facilityname, flt_rentfee) VALUES(?,?);`  
        db.query(queryString,  [req.body.facilityname, req.body.fee], (err, results, fields) => {
            if (err) throw err;
                return res.redirect('/admin/maintenance-requirements');
        });            
    });

adminRouter.get('/maintenance-requirements/delete?int_reqtypeID', (req, res) => {
    const queryString = `DELETE FROM tbl_requirementtype
    WHERE int_reqtypeID= ${req.params.int_reqtypeID}`;
    
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-requirements');
        
    });
});

adminRouter.post('/maintenance-requirements/edit?int_reqtypeID', (req, res) => {
    const queryString = `UPDATE tbl_requirementtype SET var_facilityname =?, flt_rentfee= ?
    WHERE int_reqtypeID= ${req.params.int_facilityID}`;
    
    db.query(queryString,[req.body.facilityname, req.body.flt_rentfee], (err, results, fields) => {        
        if (err) throw err;
        return res.redirect('/admin/maintenance-requirements');
        
    });
});

//===============================================================================================//
// T R A N S A C T I O N S //
//===============================================================================================//
adminRouter.get('/transaction-facilityreservation', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_facilityreservation 
    join tbl_facility on tbl_facilityreservation.int_facilityID = tbl_facility.int_facilityID 
    join tbl_user on tbl_facilityreservation.int_userID = tbl_user.int_userID`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);       
        return res.render('admin/views/transactions/facilityres',{ facilities : results });
    });     
    
});

adminRouter.get('/transaction-documentrequest', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_documentrequest 
    join tbl_document on tbl_documentrequest.int_documentID = tbl_document.int_documentID 
    join tbl_user on tbl_documentrequest.int_userID = tbl_user.int_userID`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);       
        return res.render('admin/views/transactions/docureq',{ documents : results });
    }); 
    
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