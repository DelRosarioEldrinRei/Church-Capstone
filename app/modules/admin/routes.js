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
    adminRouter.get('/details', (req, res)=>{
        res.render('admin/views/ref/details')
    });
//===============================================================================================//
// M A I N T E N A N C E //
//===============================================================================================//
//EVENTS
//=======================================================
    adminRouter.get('/maintenance-events', (req, res)=>{    
        var queryString2 =`SELECT * FROM tbl_specialevent`
        db.query(queryString2, (err, results, fields) => {
            if (err) console.log(err);
            for(var i = 0; i < results.length; i++){

                results[i].time_eventstart= moment(results[i].time_eventstart).format('MM/DD/YYYY h:mm a');
                results[i].time_eventend= moment(results[i].time_eventend).format('MM/DD/YYYY h:mm a');
            }
            return res.render('admin/views/maintenance/events',{specialevents: results });
        });     
    });

    adminRouter.post('/maintenance-events/add', (req, res) => {
        var start= moment(req.body.start, 'MM/DD/YYYY h:mm a').format('YYYY-MM-DD HH:mm:ss');
        var end= moment(req.body.end, 'MM/DD/YYYY h:mm a').format('YYYY-MM-DD HH:mm:ss');
        
        var queryString4 = `INSERT INTO tbl_specialevent(int_userID, var_spceventname, text_eventdesc, time_eventstart, time_eventend, var_eventvenue, char_eventtype, var_approvalstatus ) VALUES(?,?, ?,?, ?,?, ?,?)`
            db.query(queryString4, [req.session.admin.int_userID, req.body.spceventname, req.body.eventdesc, start, end, req.body.venue, req.body.eventtype, "Approved"], (err, results, fields) => {         
                if (err) throw err;
                    return res.redirect('/admin/maintenance-events');
            });   

        });

    adminRouter.post('/maintenance-events/delete', (req, res) => {
        const queryString = `DELETE FROM tbl_specialevent WHERE int_specialeventID= ?`;
        db.query(queryString,[req.body.id1], (err, results, fields) => {        
            if (err) throw err;
            console.log(req.body.id1)
            return res.redirect('/admin/maintenance-events');
        });
    });

    adminRouter.post('/maintenance-events/cancel/:int_specialeventID', (req, res) => {
        const queryString = `UPDATE tbl_specialevent SET var_approvalstatus = "Cancelled"
        WHERE int_specialeventID= ${req.params.int_specialeventID}`; 
        
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-events');
            
        });
    });

    adminRouter.get('/maintenance-events/edit/:int_specialeventID', (req, res) => {
        
        var queryString = `SELECT * FROM tbl_specialevent 
        WHERE int_specialeventID = ${req.params.int_specialeventID}`;
        db.query(queryString, (err, results, fields) => {        
            var events = results[0];
            var start= moment(events.time_eventstart, "YYYY-MM-DD HH:mm:ss").format('MM/DD/YYYY h:mm a');
            var end = moment(events.time_eventend, 'YYYY-MM-DD HH:mm:ss').format('MM/DD/YYYY h:mm a');
            events.time_eventstart = start;
            events.time_eventend =end;
            if (err) throw err;
            console.log(results);
            return res.render('admin/views/maintenance/eventsedit', {events:events});
        });
    });

    adminRouter.post('/maintenance-events/edit/:int_specialeventID', (req, res) => {
        var start= moment(req.body.start, 'YYYY-MM-DD h:mm a').format('YYYY-MM-DD HH:mm:ss');
        var end= moment(req.body.end, 'YYYY-MM-DD h:mm a').format('YYYY-MM-DD HH:mm:ss');
        const queryString = `UPDATE tbl_specialevent SET  var_spceventname=?, text_eventdesc=?, time_eventstart=?, time_eventend=?, var_eventvenue=?, char_eventtype=?, var_approvalstatus =? WHERE int_specialeventID= ${req.params.int_specialeventID}`;
        
        db.query(queryString,[req.body.spceventname, req.body.eventdesc, start, end, req.body.venue, req.body.eventtype, "Approved"], (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-events');
            
        });
    });
//=======================================================
//SERVICES
//=======================================================
    adminRouter.get('/maintenance-services', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_event where var_type = "Sacrament"`
        db.query(queryString1, (err, results, fields) => {
            if (err) console.log(err);
            var sacraments = results;  
            var queryString1 =`SELECT * FROM tbl_event where var_type = "Special Service"`
            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                var services = results;        
            return res.render('admin/views/maintenance/services',{ sacraments : sacraments, services:services });    
        }); });
    });

    adminRouter.post('/maintenance-services/add', (req, res) => {
        var queryString= `INSERT INTO tbl_event(
            var_eventname,
            var_eventdesc, 
            var_eventtype
            ) VALUES(?,?,?);`  
            db.query(queryString,  [req.body.eventname, req.body.eventdesc, "Special Service"], (err, results, fields) => {
                if (err) throw err;
                    return res.redirect('/admin/maintenance-services');
            });            
        });

        
    adminRouter.get('/maintenance-services/delete/:int_eventID', (req, res) => {
        const queryString = `DELETE FROM tbl_event
        WHERE int_eventID= ${req.params.int_eventID}`;
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-services');
        });
    });


    adminRouter.get('/maintenance-services/edit/:int_eventID', (req, res) => {
        var queryString = `SELECT * FROM tbl_event 
        WHERE int_eventID = ${req.params.int_eventID}`;
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            var services = results[0];
            return res.render('admin/views/maintenance/serviceedit', {services:services });
        });
    });

    adminRouter.post('/maintenance-services/edit/:int_eventID', (req, res) => {
        const queryString = `UPDATE tbl_event SET 
        var_eventname = ?,
        var_eventdesc=?
        WHERE int_eventID= ${req.params.int_eventID}`;
        
        db.query(queryString,[req.body.eventname, req.body.eventdesc], (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-services');
            
        });
    });


    adminRouter.post('/maintenance-services/edit/int_eventID', (req, res) => {
    
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


    adminRouter.post('/maintenance-facilities/addfacility', (req, res) => {
    
        var queryString= `INSERT INTO tbl_facility(var_facilityname, flt_rentfee) VALUES(?,?);`  
            db.query(queryString,  [req.body.facilityname, req.body.fee], (err, results, fields) => {
                if (err) throw err;
                    return res.redirect('/admin/maintenance-facilities');
            });            
        });
    adminRouter.get('/maintenance-facilities/delete/:int_facilityID', (req, res) => {
        const queryString = `DELETE FROM tbl_facility
        WHERE int_facilityID= ${req.params.int_facilityID}`;
        
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-facilities');
            
        });
    });

    adminRouter.get('/maintenance-facilities/edit/:int_facilityID', (req, res) => {
        
        var queryString = `SELECT * FROM tbl_facility 
        WHERE int_facilityID = ${req.params.int_facilityID}`;
        db.query(queryString, (err, results, fields) => {        
            
            if (err) throw err;
            console.log(results);
            var facilities = results[0];
            return res.render('admin/views/maintenance/facilitiesedit', {facilities:facilities});
        });
    });

    adminRouter.post('/maintenance-facilities/edit/:int_facilityID', (req, res) => {
        const queryString = `UPDATE tbl_facility SET var_facilityname =?, flt_rentfee= ?
        WHERE int_facilityID= ${req.params.int_facilityID}`;
        
        db.query(queryString,[req.body.facilityname, req.body.fee], (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-facilities');
            
        });
    });
//=======================================================
//MINISTRIES/ORG
//=======================================================
    adminRouter.get('/maintenance-ministries', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_facility`
        db.query(queryString1, (err, results, fields) => {
            if (err) console.log(err);       
            return res.render('admin/views/maintenance/ministries',{ ministries : results });
        });     
    });


    adminRouter.post('/maintenance-ministries/addministry', (req, res) => {
    
        var queryString= `INSERT INTO tbl_ministry(var_ministryname) VALUES(?);`  
            db.query(queryString,  [req.body.ministryname], (err, results, fields) => {
                if (err) throw err;
                    return res.redirect('/admin/maintenance-ministries');
            });            
        });
    adminRouter.get('/maintenance-ministries/delete/:int_ministryID', (req, res) => {
        const queryString = `DELETE FROM tbl_ministry
        WHERE int_ministryID= ${req.params.int_ministryID}`;
        
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-ministries');
            
        });
    });

    adminRouter.get('/maintenance-ministries/edit/:int_ministryID', (req, res) => {
        
        var queryString = `SELECT * FROM tbl_ministry 
        WHERE int_ministryID = ${req.params.int_ministryID}`;
        db.query(queryString, (err, results, fields) => {        
            
            if (err) throw err;
            console.log(results);
            var ministries = results[0];
            return res.render('admin/views/maintenance/ministriesedit', {ministries:ministries});
        });
    });

    adminRouter.post('/maintenance-ministries/edit/:int_ministryID', (req, res) => {
        const queryString = `UPDATE tbl_ministry SET var_ministryname =?
        WHERE int_ministryID= ${req.params.int_ministryID}`;
        
        db.query(queryString,[req.body.ministryname], (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-ministries');
            
        });
    });
//=======================================================
//REQUIREMENTS 
//=======================================================
    adminRouter.get('/maintenance-requirements', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Anointing of the sick")`
        var queryString2 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Baptism")`
        var queryString3 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Confirmation")`
        var queryString4 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Funeral Mass=" or var_eventname= "Funeral Service" )`
        var queryString5 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Marriage")`
        var queryString6 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Establishment Blessing")`
        var queryString8 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="First Communion")`
        var queryString9 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Facility Reservation")`
        var queryString10 =`SELECT * FROM tbl_requirementtype where int_eventID = (select int_eventID from tbl_event where var_eventname ="Document Request")`
        var queryString11 =`SELECT var_eventname FROM tbl_event ORDER BY var_eventname`
        db.query(queryString1, (err, results, fields) => {
            if (err) console.log(err); 
            var anointings = results;
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err); 
                var baptisms = results;
                db.query(queryString3, (err, results, fields) => {
                    if (err) console.log(err); 
                    var confirmations = results;
                    db.query(queryString4, (err, results, fields) => {
                        if (err) console.log(err); 
                        var funerals = results;
                        db.query(queryString5, (err, results, fields) => {
                            if (err) console.log(err); 
                            var marriages = results;
                            db.query(queryString6, (err, results, fields) => {
                                if (err) console.log(err);
                                var establishments = results; 
                                    db.query(queryString8, (err, results, fields) => {
                                        if (err) console.log(err);
                                        var eucharists = results;       
                                        db.query(queryString9, (err, results, fields) => {
                                            if (err) console.log(err);
                                            var reservations = results;       
                                            db.query(queryString10, (err, results, fields) => {
                                                if (err) console.log(err);
                                                var requests = results; 
                                                db.query(queryString11, (err, results, fields) => {
                                                    if (err) console.log(err);
                                                    var services = results;       
                                                    console.log(services)
            return res.render('admin/views/maintenance/requirements',{ anointings : anointings,baptisms : baptisms,confirmations : confirmations,funerals : funerals, marriages : marriages,establishments : establishments,eucharists : eucharists,reservations : reservations,requests: requests, services:services});
        }); }); }); }); }); }); }); }); }); 
        });     
    });



    adminRouter.post('/maintenance-requirements/add', (req, res) => {
        var queryString= `select int_eventID from tbl_event where var_eventname = ?`
        db.query(queryString, [req.body.eventname], (err, results, fields) => {
            if (err) throw err;
                var eventid = results[0];
                console.log(eventid)
                var queryString1= `INSERT INTO tbl_requirementtype(int_eventID, var_reqname, var_reqdesc) VALUES(?,?,?);`  
                db.query(queryString1,  [eventid.int_eventID, req.body.reqname, req.body.reqdesc], (err, results, fields) => {
                    if (err) throw err;
                    return res.redirect('/admin/maintenance-requirements');
                });
            });            
        });

    adminRouter.get('/maintenance-requirements/delete/:int_reqtypeID', (req, res) => {
        const queryString = `DELETE FROM tbl_requirementtype
        WHERE int_reqtypeID= ${req.params.int_reqtypeID}`;
        
        db.query(queryString, (err, results, fields) => {        
            if (err) throw err;
            return res.redirect('/admin/maintenance-requirements');
            
        });
    });

    
    adminRouter.get('/maintenance-requirements/edit/:int_reqtypeID', (req, res) => {
        
        var queryString = `SELECT * FROM tbl_requirementtype 
        WHERE int_reqtypeID = ${req.params.int_reqtypeID}`;
        db.query(queryString, (err, results, fields) => {        
            
            if (err) throw err;
            console.log(results);
            var requirements = results[0];
            return res.render('admin/views/maintenance/requirementsedit', {requirements:requirements});
        });
    });
    
    adminRouter.post('/maintenance-requirements/edit/:int_reqtypeID', (req, res) => {
        var queryString= `select int_eventID from tbl_event where var_eventname = ?`
        db.query(queryString,  [req.body.eventname], (err, results, fields) => {
            if (err) throw err;
                var eventid = results[0];
                console.log(eventid);
                const queryString1 = `UPDATE tbl_requirementtype SET int_eventID=?, var_reqname =?, var_reqdesc= ?
                WHERE int_reqtypeID= ${req.params.int_reqtypeID}`;
            
                db.query(queryString1,[eventid.int_eventID, req.body.reqname, req.body.reqdesc], (err, results, fields) => {        
                    if (err) throw err;
                    return res.redirect('/admin/maintenance-requirements');
                });    
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
            var reservations = results;
            for(var i = 0; i < reservations.length; i++){

                reservations[i].date_reservedate= moment(reservations[i].date_reservedate).format('MM/DD/YYYY');
                reservations[i].time_reservestart= moment(reservations[i].time_reservestart, 'HH:mm:ss').format('h:mm a');
                reservations[i].time_reserveend= moment(reservations[i].time_reserveend, 'HH:mm:ss').format('h:mm a');
            }
            if (err) console.log(err);       
            return res.render('admin/views/transactions/facilityres',{ reservations : reservations });
        });     
        
    });
    adminRouter.get('/transaction-documentrequest', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_documentrequest 
        join tbl_document on tbl_documentrequest.int_documentID = tbl_document.int_documentID 
        join tbl_user on tbl_documentrequest.int_userID = tbl_user.int_userID`
        db.query(queryString1, (err, results, fields) => {
            if (err) console.log(err);       
            var requests = results;
            for(var i = 0; i < requests.length; i++){
                requests[i].date_docurequested= moment(requests[i].date_docurequested).format('MM/DD/YYYY');
            }
            return res.render('admin/views/transactions/docureq',{ requests : requests });
        }); 
        
    });
    adminRouter.get('/transaction-walkin', (req, res)=>{
        res.render('admin/views/transactions/walkin')
    });
    adminRouter.get('/transaction-baptism', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_eventinfo 
        JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
        JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
        JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
        JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
        join tbl_baptism on tbl_eventinfo.int_eventinfoID = tbl_baptism.int_eventinfoID
        
        where tbl_event.var_eventname ='Baptism'`

            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                var regulars=results;
                for(var i = 0; i < regulars.length; i++){
                    
                    regulars[i].date_birthday= moment(regulars[i].date_birthday).format('YYYY-MM-DD');
                    regulars[i].date_desireddate= moment(regulars[i].date_desireddate).format('YYYY-MM-DD');
                    regulars[i].time_desiredtime= moment(regulars[i].time_desiredtime, 'HH:mm:ss').format('hh:mm A'); 
                }             
            
                var queryString3 =`SELECT * FROM tbl_eventinfo 
                    JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
                    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
                    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
                    JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
                    join tbl_baptism on tbl_eventinfo.int_eventinfoID = tbl_baptism.int_eventinfoID
                    
                    where tbl_event.var_eventname ='Special Baptism'`

                        db.query(queryString3, (err, results, fields) => {
                            if (err) console.log(err);
                            var specials = results;                
                            for(var i = 0; i < specials.length; i++){
                                
                                specials[i].date_birthday= moment(specials[i].date_birthday).format('YYYY-MM-DD');
                                specials[i].date_desireddate= moment(specials[i].date_desireddate).format('MM/DD/YYYY');
                                specials[i].time_desiredtime= moment(specials[i].time_desiredtime, 'HH:mm:ss').format('hh:mm A');
                                
                            }   
                                // console.log('results' + results[i])

                            return res.render('admin/views/transactions/eventapp/baptism',{regulars:regulars, specials:specials});
        }); 
        }); 
    }); 
    adminRouter.get('/transaction-blessings', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_eventinfo 
        JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
        JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
        JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
        JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
        join tbl_blessing on tbl_eventinfo.int_eventinfoID = tbl_blessing.int_eventinfoID
        
        where tbl_event.var_eventname ='Anointings of the sick'`

            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                var anointings=results;
                for(var i = 0; i < anointings.length; i++){
                    
                    anointings[i].date_birthday= moment(anointings[i].date_birthday).format('MM/DD/YYYY');
                    anointings[i].date_desireddate1= moment(anointings[i].date_desireddate1).format('MM/DD/YYYY');
                    anointings[i].time_desiredtime1= moment(anointings[i].time_desiredtime1,'HH:mm:ss').format('hh:mm A'); 
                    anointings[i].date_desireddate2= moment(anointings[i].date_desireddate2).format('MM/DD/YYYY');
                    anointings[i].time_desiredtime2= moment(anointings[i].time_desiredtime2,'HH:mm:ss').format('hh:mm A'); 
                }             
            
                var queryString3 =`SELECT * FROM tbl_eventinfo 
                    JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
                    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
                    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
                    JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
                    join tbl_blessing on tbl_eventinfo.int_eventinfoID = tbl_blessing.int_eventinfoID
                    
                    where tbl_event.var_eventname ='Funeral Service' OR tbl_event.var_eventname ='Funeral Mass'`

                        db.query(queryString3, (err, results, fields) => {
                            if (err) console.log(err);
                            var funerals = results;                
                            for(var i = 0; i < funerals.length; i++){
                                
                                funerals[i].date_birthday= moment(funerals[i].date_birthday).format('MM/DD/YYYY');
                                funerals[i].date_desireddate1= moment(funerals[i].date_desireddate1).format('MM/DD/YYYY');
                                funerals[i].time_desiredtime1= moment(funerals[i].time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                                funerals[i].date_desireddate2= moment(funerals[i].date_desireddate2).format('MM/DD/YYYY');
                                funerals[i].time_desiredtime2= moment(funerals[i].time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                                
                            }   

                    var queryString4 =`SELECT * FROM tbl_eventinfo 
                    JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
                    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
                    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
                    join tbl_houseblessing on tbl_eventinfo.int_eventinfoID = tbl_houseblessing.int_eventinfoID
                    
                    where tbl_event.var_eventname ='Establishment Blessing'`

                        db.query(queryString4, (err, results, fields) => {
                            if (err) console.log(err);
                            var establishments = results;                
                            for(var i = 0; i < establishments.length; i++){
                                
                                
                                establishments[i].date_desireddate1= moment(establishments[i].date_desireddate1).format('MM/DD/YYYY');
                                establishments[i].time_desiredtime1= moment(establishments[i].time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                                establishments[i].date_desireddate2= moment(establishments[i].date_desireddate2).format('MM/DD/YYYY');
                                establishments[i].time_desiredtime2= moment(establishments[i].time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                                
                            }   

                            return res.render('admin/views/transactions/eventapp/blessings',{anointings:anointings, funerals:funerals, establishments:establishments});
        });
        });  
        }); 
    });
    adminRouter.get('/transaction-confirmation', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_eventinfo 
        JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
        JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
        JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
        JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
        join tbl_baptism on tbl_eventinfo.int_eventinfoID = tbl_baptism.int_eventinfoID
        
        where tbl_event.var_eventname ='Confirmation'`

            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                var regulars=results;
                for(var i = 0; i < regulars.length; i++){
                    
                    regulars[i].date_birthday= moment(regulars[i].date_birthday).format('MM/DD/YYYY');
                    regulars[i].date_desireddate= moment(regulars[i].date_desireddate).format('MM/DD/YYYY');
                    regulars[i].time_desiredtime= moment(regulars[i].time_desiredtime, 'HH:mm:ss').format('hh:mm A'); 
                }             
            
                var queryString3 =`SELECT * FROM tbl_eventinfo 
                    JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
                    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
                    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
                    JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
                    join tbl_baptism on tbl_eventinfo.int_eventinfoID = tbl_baptism.int_eventinfoID
                    
                    where tbl_event.var_eventname ='Special Confirmation'`

                        db.query(queryString3, (err, results, fields) => {
                            if (err) console.log(err);
                            var specials = results;                
                            for(var i = 0; i < specials.length; i++){
                                
                                specials[i].date_birthday= moment(specials[i].date_birthday).format('MM/DD/YYYY');
                                specials[i].date_desireddate= moment(specials[i].date_desireddate).format('MM/DD/YYYY');
                                specials[i].time_desiredtime= moment(specials[i].time_desiredtime, 'HH:mm:ss').format('hh:mm A');
                                
                            }   
                                // console.log('results' + results[i])

                            return res.render('admin/views/transactions/eventapp/confirmation',{regulars:regulars, specials:specials});
            }); 
        }); 
    });
    adminRouter.get('/transaction-marriage', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_eventinfo 
        JOIN tbl_user on tbl_eventinfo.int_userID =tbl_user.int_userID
        JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
        JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
        JOIN tbl_relation on tbl_eventinfo.int_eventinfoID =tbl_relation.int_eventinfoID
        JOIN tbl_wedbride on tbl_eventinfo.int_eventinfoID = tbl_wedbride.int_eventinfoID
        JOIN tbl_wedcouple on tbl_eventinfo.int_eventinfoID = tbl_wedcouple.int_eventinfoID
        JOIN tbl_wedgroom on tbl_eventinfo.int_eventinfoID = tbl_wedgroom.int_eventinfoID
        
        where tbl_event.var_eventname ='Marriage'`

            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                var marriages=results;
                for(var i = 0; i < marriages.length; i++){
                    
                    marriages[i].date_birthday= moment(marriages[i].date_birthday).format('MM/DD/YYYY');
                    marriages[i].date_bbirthday= moment(marriages[i].date_bbirthday).format('MM/DD/YYYY');
                    marriages[i].date_bbapdate= moment(marriages[i].date_bbapdate).format('MM/DD/YYYY');
                    marriages[i].date_bcondate= moment(marriages[i].date_bcondate).format('MM/DD/YYYY');
                    marriages[i].date_gbapdate= moment(marriages[i].date_gbapdate).format('MM/DD/YYYY');
                    marriages[i].date_gcondate= moment(marriages[i].date_gcondate).format('MM/DD/YYYY');
                    marriages[i].date_cprevweddate= moment(marriages[i].date_cprevweddate).format('MM/DD/YYYY');
                    marriages[i].date_desireddate= moment(marriages[i].date_desireddate).format('MM/DD/YYYY');
                    marriages[i].time_desiredtime= moment(marriages[i].time_desiredtime, 'HH:mm:ss').format('hh:mm A'); 
                }                        
                    return res.render('admin/views/transactions/eventapp/marriage',{marriages:marriages});
        }); 
    });

    adminRouter.get('/transaction-eventproposal', (req, res)=>{
        var queryString1 =`SELECT * FROM tbl_specialevent 
        JOIN tbl_user on tbl_specialevent.int_userID = tbl_user.int_userID`
        
        db.query(queryString1, (err, results, fields) => {
            if (err) console.log(err);       
            var proposals = results;
            for(var i = 0; i < proposals.length; i++){
                proposals[i].time_eventstart= moment(proposals[i].time_eventstart).format('MM/DD/YYYY h:mm a');
                proposals[i].time_eventend= moment(proposals[i].time_eventend).format('MM/DD/YYYY h:mm a');
            }
            return res.render('admin/views/transactions/eventproposal',{ proposals : proposals });
        }); 
        
    });

exports.admin = adminRouter;