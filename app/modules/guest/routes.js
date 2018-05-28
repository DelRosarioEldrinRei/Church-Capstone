var express = require('express');
var guestRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();



//===============================================================================================//
// I N D E X //
//===============================================================================================//
guestRouter.use(authMiddleware.guestAuth)
guestRouter.get('/', (req, res)=>{
    res.render('guest/views/index')
});

guestRouter.get('/schedule', (req, res)=>{
    res.render('guest/views/schedule2')
});


guestRouter.get('/parishevents', (req, res)=>{
    res.render('guest/views/parishevents')
});

//===============================================================================================//
// R E S E R V A T I O N //
//===============================================================================================//
guestRouter.get('/reservation', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_eventinfo 
    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID 
    WHERE tbl_eventinfo.int_userID = ?`
    db.query(queryString1, [req.session.user.int_userID], (err, results, fields) => {
        if (err) console.log(err);
        console.log('----------')
        console.log(results[0]);
        console.log('----------')
        return res.render('guest/views/reservations',{ reservations : results });
    });

});

//===============================================================================================//
// D O C U M E N T  //
//===============================================================================================//
guestRouter.get('/document', (req, res)=>{
    res.render('guest/views/document')
});

guestRouter.get('/document/form', (req, res)=>{
    res.render('guest/views/forms/document')
});

//===============================================================================================//
// E V E N T S //
//===============================================================================================//

guestRouter.get('/events', (req, res)=>{
    res.render('guest/views/events/index')
});
//==============================================================
// E V E N T S  I N F O
//==============================================================
guestRouter.get('/anointing', (req, res)=>{
    res.render('guest/views/events/anointing')
});
guestRouter.get('/baptism', (req, res)=>{
    res.render('guest/views/events/baptism')
});
guestRouter.get('/confirmation', (req, res)=>{
    res.render('guest/views/events/confirmation')
});
guestRouter.get('/establishment', (req, res)=>{
    res.render('guest/views/events/establishment')
});
guestRouter.get('/funeral', (req, res)=>{
    res.render('guest/views/events/funeral')
});
guestRouter.get('/rcia', (req, res)=>{
    res.render('guest/views/events/rcia')
});
guestRouter.get('/marriage', (req, res)=>{
    res.render('guest/views/events/marriage')
});

//==============================================================
//E V E N T S  F O R M S                                      
//==============================================================
// A N O I N T I N G
//==============================================================
guestRouter.get('/anointing/form', (req, res)=>{
    res.render('guest/views/forms/anointing',{user: req.session.user})
});
guestRouter.post('/anointing/form', (req, res) => {
   
    var queryString= `select int_eventID from tbl_event where var_eventname="Anointing of the sick";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.eventID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                if(req.body.venue == 'sameaddress') var venue= req.body.address;
                if(req.body.venue == 'hospital') var venue= req.body.hospitalname;
                if(req.body.venue == 'other') var venue= req.body.othervenue;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_blessing(int_eventinfoID, var_blessingvenue, var_blessingdetails, date_desireddate1, date_desireddate2, date_desireddate3, time_desiredtime1, time_desiredtime2, time_desiredtime3) VALUES(?,?,?, ?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, venue, req.body.details, req.body.desireddate1, req.body.desireddate2, req.body.desireddate3, req.body.desiredtime1, req.body.desiredtime2, req.body.desiredtime3], (err, results, fields) => {
                            if (err) throw err;
                            return res.redirect(`/guest`);
                        });
                    });
                });
            });    
        });            
        
    });

//==============================================================
// B A P T I S M
//==============================================================
guestRouter.get('/baptism/form', (req, res)=>{
    res.render('guest/views/forms/baptism',{user: req.session.user})
});

guestRouter.post('/baptism/form', (req, res) => {

    var queryString= `select int_eventID from tbl_event where var_eventname="Baptism";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.eventID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate1, date_desireddate2, date_desireddate3) VALUES(?,?,?,?,?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.desireddate1, req.body.desireddate2, req.body.desireddate3], (err, results, fields) => {
                            if (err) throw err;
                            return res.redirect(`/guest`);
                        });
                    });
                });
            });    
        });            
});

//==============================================================
//C O N F I R M A T I O N
//==============================================================
guestRouter.get('/confirmation/form', (req, res)=>{
    res.render('guest/views/forms/confirmation',{user: req.session.user})
});

guestRouter.post('/confirmation/form', (req, res) => {

    var queryString= `select int_eventID from tbl_event where var_eventname="Confirmation";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.eventID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum) VALUES(?,?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber], (err, results, fields) => {
                            if (err) throw err;
                            return res.redirect(`/guest`);
                        });
                    });
                });
            });    
        });            
});

//==============================================================
//E S T A B L I S H M E N T  B L E S S I N G
//==============================================================
guestRouter.get('/establishment/form', (req, res)=>{
    res.render('guest/views/forms/establishment',{user: req.session.user})
});

//==============================================================
// F U N E R A L  B L E S S I N G
//==============================================================
guestRouter.get('/funeral/form', (req, res)=>{
    res.render('guest/views/forms/funeral',{user: req.session.user})
});

guestRouter.post('/funeral/form', (req, res) => {
    if (req.body.venue== 'sameaddress'){
        var venue = req.body.address;
        var queryString= `select int_eventID from tbl_event where var_eventname="Funeral Service";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            req.session.user.eventID =results[0];
            queries(venue);
        });
    }

    if(req.body.venue =='INLPP'){
        var venue = 'Ina ng Lupang Pangako Parish';
        var queryString5= `select int_eventID from tbl_event where var_eventname="Funeral Mass";`  
        db.query(queryString5, (err, results, fields) => {
            if (err) throw err;
            req.session.user.eventID =results[0];
            queries(venue);
        });    
    }
    if(req.body.venue == 'other'){
        var venue = req.body.othervenue;
        var queryString6= `select int_eventID from tbl_event where var_eventname="Funeral Service";`  
        db.query(queryString6, (err, results, fields) => {
            if (err) throw err;
            req.session.user.eventID =results[0];
            queries(venue);
        });
    }

    function queries(venue){
        
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_blessing(int_eventinfoID, var_blessingvenue, var_blessingdetails, date_desireddate1, date_desireddate2, date_desireddate3, time_desiredtime1, time_desiredtime2, time_desiredtime3) VALUES(?,?,?, ?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, venue, req.body.details, req.body.desireddate1, req.body.desireddate2, req.body.desireddate3, req.body.desiredtime1, req.body.desiredtime2, req.body.desiredtime3], (err, results, fields) => {
                            if (err) throw err;
                            return res.redirect(`/guest`);
                        });
                    });
                });
            });    
    }

                     
        });
    // }    

    

//==============================================================
// R C I A
//==============================================================
guestRouter.get('/rcia/form', (req, res)=>{
    res.render('guest/views/forms/rcia',{user: req.session.user})
});

guestRouter.post('/rcia/form', (req, res) => {

    var queryString= `select int_eventID from tbl_event where var_eventname="RCIA";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.eventID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum) VALUES(?,?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber], (err, results, fields) => {
                            if (err) throw err;
                            return res.redirect(`/guest`);
                        });
                    });
                });
            });    
        });            
});
//==============================================================
// M A R R I A G E
//============================================================== 
guestRouter.get('/marriage/form', (req, res)=>{
    res.render('guest/views/forms/marriage',{user: req.session.user})

});
guestRouter.post('/marriage/form', (req, res) => {

    var queryString= `select int_eventID from tbl_event where var_eventname="Marriage";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.eventID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_eventinfo(int_userID, int_eventID) VALUES(?,?)`;
            db.query(queryString1, [req.body.userID, req.session.user.eventID.int_eventID], (err, results, fields) => {
                if (err) throw err;
                var eventinfoID= results;
                var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;        
                db.query(queryString2,[eventinfoID.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                    if (err) throw err;
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, "Male", req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 = `INSERT INTO tbl_wedgroom(
                            int_eventinforID,
                            var_gnationality,
                            var_gcivilstatus,
                            var_greligion,
                            var_goccupation,
                            var_gfathername,
                            var_gfatherreligion,
                            var_gfatherbplace,
                            var_gmothername,
                            var_gmotherreligion,
                            var_gmotherbplace,
                            var_gcurrparish,
                            bool_gbaptized,
                            date_gbapdate,
                            var_gbapplace,
                            bool_gconfirmed,
                            date_gcondate,
                            var_gconplace
                        ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId, 
                            req.body.gnationality,
                            req.body.gcivilstatus,
                            req.body.greligion,
                            req.body.goccupation,
                            req.body.gfathername,
                            req.body.gfatherreligion,
                            req.body.gfatherbplace,
                            req.body.gmothername,
                            req.body.gmotherreligion,
                            req.body.gmotherbplace,
                            req.body.gcurrentparish,
                            req.body.gbaptized,
                            req.body.gbapdate,
                            req.body.gbapplace,
                            req.body.gconfirmed,
                            req.body.gcondate,
                            req.body.gconplace],(err, results, fields) => {
                            if (err) throw err;


                                var queryString5 = `INSERT INTO tbl_wedbride(
                                int_eventinforID,
                                var_blname,
                                var_bfname,
                                var_bmname,
                                char_bgender,
                                var_baddress,
                                date_bbirthday,
                                var_bbirthplace,
                                var_bnationality,
                                var_bcivilstatus,
                                var_breligion,
                                var_boccupation,
                                var_bfathername,
                                var_bfatherbplace,
                                var_bfatherreligion,
                                var_bmothername,
                                var_bmotherbplace,
                                var_bmotherreligion,
                                var_bcurrparish,
                                bool_bbaptized,
                                date_bbapdate,
                                var_bbapplace,
                                bool_bconfirmed,
                                date_bcondate,
                                var_bconplace
                            ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);`
                            db.query(queryString5 , [eventinfoID.insertId, 
                                req.body.blastname,
                                req.body.bfirstname,
                                req.body.bmiddlename,
                                "Female",
                                req.body.baddress,
                                req.body.bbirthday,
                                req.body.bbirthplace,
                                req.body.bnationality,
                                req.body.bcivilstatus,
                                req.body.breligion,
                                req.body.boccupation,
                                req.body.bfathername,
                                req.body.bfatherreligion,
                                req.body.bfatherbplace,
                                req.body.bmothername,
                                req.body.bmotherreligion,
                                req.body.bmotherbplace,
                                req.body.bcurrentparish,
                                req.body.bbaptized,
                                req.body.bbapdate,
                                req.body.bbapplace,
                                req.body.bconfirmed,
                                req.body.bcondate,
                                req.body.bconplace],(err, results, fields) => {
                                if (err) throw err;
                                return res.redirect(`/guest`);
                        });

                    });
                });
            });    
        });  
    });          
});


//===============================================================================================//
// F A C I L I T I E S //
//===============================================================================================//
guestRouter.use(authMiddleware.guestAuth)
guestRouter.get('/facilities', (req, res)=>{
    res.render('guest/views/facilities/index')
});

guestRouter.use(authMiddleware.guestAuth)
guestRouter.get('/facilities/secondfloor', (req, res)=>{
    res.render('guest/views/facilities/secondfloor')
});


guestRouter.use(authMiddleware.guestAuth)
guestRouter.get('/facilities/secondfloor/form', (req, res)=>{
    res.render('guest/views/forms/secondfloor')
});


//===============================================================================================//
exports.guest = guestRouter;
// exports.index = indexRouter;
// exports.reservation = reservationRouter;
// exports.events = eventsRouter;
// exports.facilities = facilitiesRouter;