var express = require('express');
var guestRouter = express.Router();
// var indexRouter = express.Router();
// var facilitiesRouter = express.Router();
// var eventsRouter = express.Router();
// var reservationRouter = express.Router();
var authMiddleware = require('../auth/middlewares/auth');
var db = require('../../lib/database')();

//===============================================================================================//
// I N D E X //
//===============================================================================================//
guestRouter.use(authMiddleware.guestAuth)
guestRouter.get('/', (req, res)=>{
    res.render('guest/views/index')
});


//===============================================================================================//
// R E S E R V A T I O N //
//===============================================================================================//
guestRouter.get('/reservation', (req, res)=>{
    res.render('guest/views/reservations')
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

//events info

guestRouter.get('/anointing', (req, res)=>{
    res.render('guest/views/events/anointing')
});

guestRouter.get('/baptism', (req, res)=>{
    res.render('guest/views/events/baptism')
});

guestRouter.get('/communion', (req, res)=>{
    res.render('guest/views/events/communion')
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



//events forms
//annointing
guestRouter.get('/anointing/form', (req, res)=>{
    res.render('guest/views/forms/anointing')
});

//baptism
guestRouter.get('/baptism/form', (req, res)=>{
    res.render('guest/views/forms/baptism')
});

//communion
guestRouter.get('/communion/form', (req, res)=>{
    res.render('guest/views/forms/communion')
});

//confirmation
guestRouter.get('/confirmation/form', (req, res)=>{
    res.render('guest/views/forms/confirmation')
});

//establishment blessing
guestRouter.get('/establishment/form', (req, res)=>{
    res.render('guest/views/forms/establishment')
});

//funeral blessing
guestRouter.get('/funeral/form', (req, res)=>{
    res.render('guest/views/forms/funeral')
});


guestRouter.post('/funeral/form', (req, res) => {
        
var queryString = `INSERT INTO tbl_eventinfo(int_userID, int_eventID, date_schedule) VALUES(?,?,?)`;
          
        db.query(queryString, [req.body.userID, "4", req.body.desireddate], (err, results, fields) => {
            if (err) throw err;
            var eventid= results;
            console.log(eventid)
            
            var queryString2 = `INSERT INTO tbl_eventapplication(int_eventinfoID, char_approvalstatus, char_feestatus, char_reqstatus) VALUES(?,?,?,?)`;
        
            db.query(queryString2,[eventid.insertId, "Pending", "Unpaid", "Incomplete"], (err, results, fields) => {
                if (err) throw err;

                var queryString3 = `INSERT INTO tbl_relation(int_eventinfoID, var_relation,var_lname, var_fname, var_mname, char_gender, var_address, date_birthday, var_birthplace) VALUES(?,?,?,?,?,?,?,?,?);`

                db.query(queryString3, [eventid.insertId, req.body.relation, req.body.lastname, req.body.firstname, req.body.middlename, req.body.middlename, req.body.gender, req.body.address, req.body.birthday, req.body.birthplace], (err, results, fields) => {
                    if (err) throw err;
                    
                    return res.redirect(`/guest/index`);
                }); 
            }); 
        }); 

//rcia
guestRouter.get('/rcia/form', (req, res)=>{
    res.render('guest/views/forms/rcia')
});

//marriage
guestRouter.get('/marriage/form', (req, res)=>{
    res.render('guest/views/forms/marriage')
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