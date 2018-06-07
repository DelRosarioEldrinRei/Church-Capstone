var express = require('express');
var guestRouter = express.Router();
var moment = require('moment');
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
    res.render('guest/views/parishevents1')
});

guestRouter.get('/parishservices', (req, res)=>{
    res.render('guest/views/parishservices')
});


guestRouter.get('/weddingorg', (req, res)=>{
    res.render('guest/views/forms/weddingorg')
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
       
        return res.render('guest/views/reservations/reservations',{ reservations : results });
    });

});

guestRouter.get('/reservation/:int_eventinfoID', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_eventinfo 
    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
    WHERE tbl_eventinfo.int_eventinfoID = ${req.params.int_eventinfoID}`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);
        var details = results[0];
        

        if(details.var_eventname == 'Anointing of the sick' || details.var_eventname == 'Funeral Service' || details.var_eventname =='Funeral Mass'){
            var queryString2 =`SELECT * from tbl_relation 
            join tbl_blessing on tbl_relation.int_eventinfoID = tbl_blessing.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var bday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var desireddate1= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate2= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime1= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime2= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=bday;
                moredetails.date_desireddate1=desireddate1;
                moredetails.date_desireddate2=desireddate2;
                moredetails.time_desiredtime1=desiredtime1;
                moredetails.time_desiredtime2=desiredtime2;
                res.render('guest/views/reservations/anointingdetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }
        
        if(details.var_eventname == 'Establishment Blessing'){
            var queryString4 =`select * from tbl_houseblessing where int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString4, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var desireddate3= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate4= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime3= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime4= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_desireddate1=desireddate3;
                moredetails.date_desireddate2=desireddate4;
                moredetails.time_desiredtime1=desiredtime3;
                moredetails.time_desiredtime2=desiredtime4;
                res.render('guest/views/reservations/establishmentdetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }
		// ey fix this
        if(details.var_eventname == 'Baptism' || details.var_eventname =='Confirmation' || details.var_eventname == 'RCIA'){
            var queryString3 =`SELECT * from tbl_relation 
            join tbl_baptism on tbl_relation.int_eventinfoID = tbl_baptism.int_eventinfoID
            join tbl_sponsors on tbl_relation.int_eventinfoID = tbl_sponsors.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`

            db.query(queryString3, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];                
                var bday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var desireddate= moment(moredetails.date_desireddate).format('YYYY-MM-DD');   
                var desiredtime= moment(moredetails.time_desiredtime, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=bday;
                moredetails.date_desireddate=desireddate;
                moredetails.time_desiredtime=desiredtime;
                console.log(details, moredetails)
                res.render('guest/views/reservations/baptismdetails',{ details : details, moredetails:moredetails, user: req.session.user});                
            });

				}
				
        if(details.var_eventname == 'Marriage'){
            var queryString3 =`SELECT * from tbl_relation 
            join tbl_wedgroom on tbl_relation.int_eventinfoID = tbl_wedgroom.int_eventinfoID
            join tbl_wedbride on tbl_relation.int_eventinfoID = tbl_wedbride.int_eventinfoID
            join tbl_wedcouple on tbl_relation.int_eventinfoID = tbl_wedcouple.int_eventinfoID
            join tbl_sponsors on tbl_relation.int_eventinfoID = tbl_sponsors.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString3, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];                
                var groombday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var bridebday = moment(moredetails.date_bbirthday).format('YYYY-MM-DD');
                var groombapdate = moment(moredetails.date_gbapdate).format('YYYY-MM-DD');
                var groomcondate = moment(moredetails.date_gcondate).format('YYYY-MM-DD');
                var bridebapdate = moment(moredetails.date_bbapdate).format('YYYY-MM-DD');
                var bridecondate = moment(moredetails.date_bcondate).format('YYYY-MM-DD');
                var desireddate= moment(moredetails.date_desireddate).format('YYYY-MM-DD');   
                var desiredtime= moment(moredetails.time_desiredtime, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=groombday;
                moredetails.date_bbirthday=bridebday;
                moredetails.date_gbapdate=groombapdate;
                moredetails.date_gcondate=groomcondate;
                moredetails.date_bbapdate=bridebapdate;
                moredetails.date_bcondate=bridecondate;
                moredetails.date_desireddate=desireddate;
                moredetails.time_desiredtime=desiredtime;
                console.log(details, moredetails)
                res.render('guest/views/reservations/marriagedetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });       
        }
        


    });

});
// ---------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------
// E  D  I  T    D  E  T  A  I  L  S 
// ---------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------
guestRouter.get('/reservation/:int_eventinfoID/edit', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_eventinfo 
    JOIN tbl_eventapplication ON tbl_eventinfo.int_eventinfoID = tbl_eventapplication.int_eventinfoID 
    JOIN tbl_event ON tbl_event.int_eventID = tbl_eventinfo.int_eventID  
    WHERE tbl_eventinfo.int_eventinfoID = ${req.params.int_eventinfoID}`
    db.query(queryString1, (err, results, fields) => {
        if (err) console.log(err);
        var details = results[0];        

        if(details.var_eventname == 'Anointing of the sick'){
            var queryString2 =`SELECT * from tbl_relation 
            join tbl_blessing on tbl_relation.int_eventinfoID = tbl_blessing.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var bday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var desireddate1= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate2= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime1= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime2= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=bday;
                moredetails.date_desireddate1=desireddate1;
                moredetails.date_desireddate2=desireddate2;
                moredetails.time_desiredtime1=desiredtime1;
                moredetails.time_desiredtime2=desiredtime2;
                res.render('guest/views/reservations/editanointingdetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }

        if(details.var_eventname == 'Funeral Mass' ||details.var_eventname == 'Funeral Service' ){
            var queryString2 =`SELECT * from tbl_relation 
            join tbl_blessing on tbl_relation.int_eventinfoID = tbl_blessing.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var bday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var desireddate1= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate2= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime1= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime2= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=bday;
                moredetails.date_desireddate1=desireddate1;
                moredetails.date_desireddate2=desireddate2;
                moredetails.time_desiredtime1=desiredtime1;
                moredetails.time_desiredtime2=desiredtime2;
                res.render('guest/views/reservations/editfuneraldetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }

        
        if(details.var_eventname == 'Baptism' || details.var_eventname == 'Confirmation' ||details.var_eventname == 'RCIA' ){
            var queryString2 =`SELECT * from tbl_relation 
            join tbl_blessing on tbl_relation.int_eventinfoID = tbl_blessing.int_eventinfoID 
            join tbl_baptism on tbl_relation.int_eventinfoID = tbl_baptism.int_eventinfoID
            join tbl_sponsors on tbl_relation.int_eventinfoID = tbl_sponsors.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString2, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var bday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var desireddate1= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate2= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime1= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime2= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=bday;
                moredetails.date_desireddate1=desireddate1;
                moredetails.date_desireddate2=desireddate2;
                moredetails.time_desiredtime1=desiredtime1;
                moredetails.time_desiredtime2=desiredtime2;
                res.render('guest/views/reservations/editbaptismdetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }
        
        if(details.var_eventname == 'Marriage'){
            var queryString3 =`SELECT * from tbl_relation 
            join tbl_wedgroom on tbl_relation.int_eventinfoID = tbl_wedgroom.int_eventinfoID
            join tbl_wedbride on tbl_relation.int_eventinfoID = tbl_wedbride.int_eventinfoID
            join tbl_wedcouple on tbl_relation.int_eventinfoID = tbl_wedcouple.int_eventinfoID
            join tbl_sponsors on tbl_relation.int_eventinfoID = tbl_sponsors.int_eventinfoID 
            where tbl_relation.int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString3, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];                
                var groombday = moment(moredetails.date_birthday).format('YYYY-MM-DD');
                var bridebday = moment(moredetails.date_bbirthday).format('YYYY-MM-DD');
                var groombapdate = moment(moredetails.date_gbapdate).format('YYYY-MM-DD');
                var groomcondate = moment(moredetails.date_gcondate).format('YYYY-MM-DD');
                var bridebapdate = moment(moredetails.date_bbapdate).format('YYYY-MM-DD');
                var bridecondate = moment(moredetails.date_bcondate).format('YYYY-MM-DD');
                var desireddate= moment(moredetails.date_desireddate).format('YYYY-MM-DD');   
                var desiredtime= moment(moredetails.time_desiredtime, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_birthday=groombday;
                moredetails.date_bbirthday=bridebday;
                moredetails.date_gbapdate=groombapdate;
                moredetails.date_gcondate=groomcondate;
                moredetails.date_bbapdate=bridebapdate;
                moredetails.date_bcondate=bridecondate;
                moredetails.date_desireddate=desireddate;
                moredetails.time_desiredtime=desiredtime;
                console.log(details, moredetails)
                res.render('guest/views/reservations/editmarriagedetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });       
        }
        
        if(details.var_eventname == 'Establishment Blessing'){
            var queryString4 =`select * from tbl_houseblessing where int_eventinfoID = ${req.params.int_eventinfoID}`
            db.query(queryString4, (err, results, fields) => {
                if (err) console.log(err);
                var moredetails = results[0];
                console.log(details, moredetails)
                var desireddate3= moment(moredetails.date_desireddate1).format('YYYY-MM-DD');
                var desireddate4= moment(moredetails.date_desireddate2).format('YYYY-MM-DD');
                var desiredtime3= moment(moredetails.time_desiredtime1, 'HH:mm:ss').format('hh:mm A');
                var desiredtime4= moment.utc(moredetails.time_desiredtime2, 'HH:mm:ss').format('hh:mm A');
                moredetails.date_desireddate1=desireddate3;
                moredetails.date_desireddate2=desireddate4;
                moredetails.time_desiredtime1=desiredtime3;
                moredetails.time_desiredtime2=desiredtime4;
                res.render('guest/views/reservations/establishmentdetails',{ details : details, moredetails:moredetails, user: req.session.user});
            });
        }
    });
});

guestRouter.post('/reservation/:int_eventinfoID/edit', (req, res) => {

    if(req.body.eventname == 'Anointing of the sick'){
        console.log('SIMULAN NA ANG PAG EDIT')
    
    // DAMI PANG AAYUSIN SA EDIT, YUNG MAY SCRIPT NA KASAMA AAAAAAAAAAA
        if(req.body.venue == 'sameaddress') var venue= req.body.address;
        if(req.body.venue == 'hospital') var venue= req.body.hospitalname;
        if(req.body.venue == 'other') var venue= req.body.othervenue;
        
        const queryString = `UPDATE tbl_relation SET        
        var_relation = "${req.body.relation}",
        var_lname = "${req.body.lastname}",
        var_fname = "${req.body.firstname}",
        var_mname = "${req.body.middlename}",
        char_gender = "${req.body.gender}",
        var_address = "${req.body.address}",
        date_birthday = "${req.body.birthday}",
        var_birthplace = "${req.body.birthplace}"
        where int_eventinfoID= ${req.params.int_eventinfoID});`;
        
        const queryString1 = `UPDATE tbl_blessing SET        
            var_blessingvenue = ${venue},
            var_blessingdetails = "${req.body.details}",
            date_desireddate1 = "${req.body.desireddate1}",
            date_desireddate2 = "${req.body.desireddate2}",
            date_desiredtime1 = "${req.body.desiredtime1}",
            date_desiredtime2 = "${req.body.desiredtime2}"
            where int_eventinfoID= ${req.params.int_eventinfoID});`;
        db.query(queryString,  (err, results, fields) => {
            if (err) console.log(err);
            
            db.query(queryString1, (err, results, fields) => {
                if (err) console.log(err);
                return res.redirect(`/guest/reservation/${req.params.int_eventinfoID}`);
        });
        });
    }
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

guestRouter.post('/document/form', (req, res) => {
   
    var queryString= `select int_documentID from tbl_document where var_documenttype= ?`  
        db.query(queryString,[req.body.documenttype], (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            var documentID =results[0];
            var datenow= Date.now();
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_documentrequest(int_userID, int_documentID, var_doclastname, var_docfirstname, text_purpose, date_docurequested) VALUES(?,?,?,?,?,?)`;
            db.query(queryString1, [req.session.user.int_userID, documentID.int_documentID, req.body.lastname, req.body.firstname, req.body.purpose,datenow], (err, results, fields) => {
                if (err) throw err;
                return res.redirect(`/guest`);
            });    
        });            
        
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
                    
                    var desiredtime1= moment(req.body.desiredtime1, 'hh:mm A').format('HH:mm:ss');
                    var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation, var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`
                    db.query(queryString3, [eventinfoID.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                        if (err) throw err;
                        var queryString4 =`INSERT INTO tbl_blessing(int_eventinfoID, var_blessingvenue, var_blessingdetails, date_desireddate1, date_desireddate2, time_desiredtime1, time_desiredtime2) VALUES (?,?,?,?,?,?,?)`
                        db.query(queryString4, [eventinfoID.insertId, venue, req.body.details, req.body.desireddate1, req.body.desireddate2, desiredtime1, req.body.desiredtime2], (err, results, fields) => {
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
                        
                        if (req.body.baptismtype == 'Regular'){
                            //merong hardcoded dito, ayusin sa capstone, utilities/events
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, time_desiredtime, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.regdesireddate, "11:00:00", req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        if(req.body.baptismtype=='Special'){
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, time_desiredtime, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.spcdesireddate, req.body.desiredtime, req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        
                        function sponsors(eventinfoID){
                            var i;
                            for(i=0; i < req.body.sponsorname.length; i++){
                                var queryString5= `INSERT INTO tbl_sponsors(int_eventinfoID, var_sponsorname) VALUES (?,?);`
                                db.query(queryString5, [eventinfoID, req.body.sponsorname[i]], (err, results, fields) => {
                                    if(err) throw err;
                                });
                            }

                        }
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
                        
                        if (req.body.baptismtype == 'Regular'){
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.regdesireddate, req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        if(req.body.baptismtype=='Special'){
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, time_desiredtime, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.spcdesireddate, req.body.desiredtime, req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        
                        function sponsors(eventinfoID){
                            var i;
                            for(i=0; i < req.body.sponsorname.length; i++){
                                var queryString5= `INSERT INTO tbl_sponsors(int_eventinfoID, var_sponsorname) VALUES (?,?);`
                                db.query(queryString5, [eventinfoID, req.body.sponsorname[i]], (err, results, fields) => {
                                    if(err) throw err;
                                });
                            }

                        }
                    });
                });
            });    
        });                   
});

//==============================================================
//E S T A B L I S H M E N T  B L E S S I N G
//==============================================================
guestRouter.get('/establishment/form', (req, res)=>{
    var queryString1 =`SELECT * FROM tbl_user WHERE int_userID = ?`
    db.query(queryString1, [req.session.user.int_userID], (err, results, fields) => {
        if (err) console.log(err);
        console.log('----------')
        console.log(results[0]);
        console.log('----------')
        return res.render('guest/views/forms/establishment',{ users : results });
    });

});

guestRouter.post('/establishment/form', (req, res) => {
    
    var queryString= `select int_eventID from tbl_event where var_eventname="House Blessing";`  
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
                db.query(queryString2,[eventinfoID.insertId, "Pending", "No payment", "No Requirements"], (err, results, fields) => {
                    if (err) throw err;
                    if(req.body.establishment=='ourhome'){
                        var queryString3 = `INSERT INTO tbl_houseblessing(int_eventinfoID, var_owner, var_estloc, var_ownercontactnum, var_owneremailadd, date_desireddate1, date_desireddate2, time_desiredtime1, time_desiredtime2) VALUES(?,?,?,?,?,?,?,?,?);`
                        db.query(queryString3, [eventinfoID.insertId, req.body.owner, req.body.location, req.body.contactnumber, req.body.email, req.body.desireddate1, req.body.desireddate2, req.body.desiredtime1, req.body.desiredtime2], (err, results, fields) => {
                            if (err) throw err;                        
                                return res.redirect(`/guest`);                            
                        });
                    }
                    if(req.body.establishment=='other'){
                        var queryString3 = `INSERT INTO tbl_houseblessing(int_eventinfoID, var_owner, var_estloc, var_ownercontactnum, var_owneremailadd, date_desireddate1, date_desireddate2, time_desiredtime1, time_desiredtime2) VALUES(?,?,?,?,?,?,?,?,?);`
                        db.query(queryString3, [eventinfoID.insertId, req.body.owner1, req.body.location1, req.body.contactnumber1, req.body.email1, req.body.desireddate1, req.body.desireddate2, req.body.desiredtime1, req.body.desiredtime2], (err, results, fields) => {
                            if (err) throw err;                        
                                return res.redirect(`/guest`);                            
                        });
                    }
                });
            });    
        });            
        

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
                        var queryString4 =`INSERT INTO tbl_blessing(int_eventinfoID, var_blessingvenue, var_blessingdetails, date_desireddate1, date_desireddate2, time_desiredtime1, time_desiredtime2) VALUES (?,?,?,?,?,?,?)`
                        db.query(queryString4, [eventinfoID.insertId, venue, req.body.details, req.body.desireddate1, req.body.desireddate2, req.body.desiredtime1, req.body.desiredtime2], (err, results, fields) => {
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
                        
                        if (req.body.baptismtype == 'Regular'){
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.regdesireddate, req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        if(req.body.baptismtype=='Special'){
                            var queryString4 = `INSERT INTO tbl_baptism(int_eventinfoID, var_parentmarriageadd, var_fatherbplace, var_motherbplace, var_fathername, var_mothername, var_contactnum, date_desireddate, time_desiredtime, char_baptismtype) VALUES(?,?,?, ?,?,? ,?,?,?,?);`
                            db.query(queryString4 , [eventinfoID.insertId, req.body.marriageaddress, req.body.fatherbirthplace, req.body.motherbirthplace, req.body.fathername, req.body.mothername, req.body.contactnumber, req.body.spcdesireddate, req.body.desiredtime, req.body.baptismtype], (err, results, fields) => {
                                if (err) throw err;
                                sponsors(eventinfoID.insertId);
                                return res.redirect(`/guest`);
                                
                            });
                        }
                        
                        function sponsors(eventinfoID){
                            var i;
                            for(i=0; i < req.body.sponsorname.length; i++){
                                var queryString5= `INSERT INTO tbl_sponsors(int_eventinfoID, var_sponsorname) VALUES (?,?);`
                                db.query(queryString5, [eventinfoID, req.body.sponsorname[i]], (err, results, fields) => {
                                    if(err) throw err;
                                });
                            }

                        }
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
                        var queryString4 = `INSERT INTO tbl_wedgroom( int_eventinfoID, var_gnationality, var_gcivilstatus, var_greligion, var_goccupation, var_gfathername, var_gfatherreligion, var_gfatherbplace, var_gmothername, var_gmotherreligion, var_gmotherbplace, var_gcurrparish, bool_gbaptized, date_gbapdate, var_gbapplace, bool_gconfirmed, date_gcondate, var_gconplace ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);`
                        db.query(queryString4 , [eventinfoID.insertId,  req.body.gnationality, req.body.gcivilstatus, req.body.greligion, req.body.goccupation, req.body.gfathername, req.body.gfatherreligion, req.body.gfatherbplace, req.body.gmothername, req.body.gmotherreligion, req.body.gmotherbplace, req.body.gcurrentparish, req.body.gbaptized, req.body.gbapdate, req.body.gbapplace, req.body.gconfirmed, req.body.gcondate, req.body.gconplace],(err, results, fields) => {
                            if (err) throw err;
                                var queryString5 = `INSERT INTO tbl_wedbride( 
                                    int_eventinfoID, var_blname, var_bfname, var_bmname, char_bgender, 
                                    var_baddress, date_bbirthday, var_bbirthplace, var_bnationality, 
                                    var_bcivilstatus, var_breligion, var_boccupation, bool_bpregnant, 
                                    var_bfathername, var_bfatherbplace, var_bfatherreligion, var_bmothername, 
                                    var_bmotherbplace, var_bmotherreligion, var_bcurrparish, bool_bbaptized,
                                     date_bbapdate, var_bbapplace, bool_bconfirmed, date_bcondate, var_bconplace) VALUES(?,?,?,?,? ,?,?,?,?,?, ?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,?, ?);`
                            db.query(queryString5 , [eventinfoID.insertId,  req.body.blastname, req.body.bfirstname, req.body.bmiddlename, "Female", req.body.baddress, req.body.bbirthday, req.body.bbirthplace, req.body.bnationality, req.body.bcivilstatus, req.body.breligion, req.body.boccupation, req.body.boolpregnant, req.body.bfathername, req.body.bfatherreligion, req.body.bfatherbplace, req.body.bmothername, req.body.bmotherreligion, req.body.bmotherbplace, req.body.bcurrentparish, req.body.bbaptized, req.body.bbapdate, req.body.bbapplace, req.body.bconfirmed, req.body.bcondate, req.body.bconplace],(err, results, fields) => {
                                if (err) throw err;
                               
                                if(req.body.boolmarried == 1){
                                    var queryString4 = `INSERT INTO tbl_wedcouple(int_eventinfoID, bool_livingin, bool_married, date_cprevweddate, var_cprevwedplace, date_desireddate, time_desiredtime) VALUES(?,?,?, ?,?,? ,?);`
                                        db.query(queryString4 , [eventinfoID.insertId, req.body.boollivingin, req.body.boolmarried, req.body.cprevweddingdate, req.body.cprevweddingplace, req.body.desireddate, req.body.desiredtime], (err, results, fields) => {
                                            if (err) throw err;
                                            sponsors(eventinfoID.insertId);
                                            return res.redirect(`/guest`);
                                        });
                                    }
                                if(req.body.boolmarried == 0){
                                    var queryString4 = `INSERT INTO tbl_wedcouple(int_eventinfoID, bool_livingin, bool_married, date_desireddate, time_desiredtime) VALUES(?,?,?,?,?);`
                                        db.query(queryString4 , [eventinfoID.insertId, req.body.boollivingin, req.body.boolmarried, req.body.desireddate, req.body.desiredtime], (err, results, fields) => {
                                            if (err) throw err;
                                            sponsors(eventinfoID.insertId);
                                            return res.redirect(`/guest`);
                                        });
                                    }  
                                function sponsors(eventinfoID){
                                    var i;
                                    for(i=0; i < req.body.sponsorname.length; i++){
                                        var queryString5= `INSERT INTO tbl_sponsors(int_eventinfoID, var_sponsorname) VALUES (?,?);`
                                        db.query(queryString5, [eventinfoID, req.body.sponsorname[i]], (err, results, fields) => {
                                            if(err) throw err;
                                        });
                                    }
                                }

                                    
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
guestRouter.get('/facilities', (req, res)=>{
    res.render('guest/views/facilities/index')
});

guestRouter.get('/facilities/secondfloor', (req, res)=>{
    res.render('guest/views/facilities/secondfloor')
});

guestRouter.get('/facilities/secondfloor/form', (req, res)=>{
    res.render('guest/views/forms/secondfloor',{user: req.session.user})
});

guestRouter.post('/facilities/secondfloor/form', (req, res) => {
   
    var queryString= `select int_facilityID from tbl_facility where var_facilityname="Bro. Roqueto 2nd floor";`  
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            console.log(results);
            req.session.user.facilityID =results[0];
            console.log(req.session.user);
            
        var queryString1 = `INSERT INTO tbl_facilityreservation(int_userID, int_facilityID, var_event, date_reservedate,time_reservestart, time_reserveend, char_reservestatus) VALUES(?,?,?,?,?,?,?)`;
            db.query(queryString1, [req.session.user.int_userID, req.session.user.facilityID.int_facilityID, req.body.event, req.body.desireddate, req.body.starttime, req.body.endtime, 'Pending'], (err, results, fields) => {
                if (err) throw err;
                return res.redirect(`/guest`);
            });    
        });            
        
    });

//===============================================================================================//
exports.guest = guestRouter;
// exports.index = indexRouter;
// exports.reservation = reservationRouter;
// exports.events = eventsRouter;
// exports.facilities = facilitiesRouter;