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

secretariatRouter.get('/events/churchevents', (req, res)=>{
    const query = ` select * from tbl_event`
    db.query(query,(err,out) =>{
        res.render('secretariat/views/event/churchevents',{
            events: out
		})
        console.log(out)
	})
 

});
secretariatRouter.get('/events/churchevents/inner', (req, res)=>{
    res.render('secretariat/views/event/innerchurchevents')
});
 secretariatRouter.get('/events/specialevents', (req, res)=>{
     res.render('secretariat/views/event/specialevents')
 });



 secretariatRouter.post('/events/specialevents/add', (req, res)=>{
    const query = `
    insert into tbl_specialevent(var_specialeventname,date_specialevent,var_location,text_purpose,time_start,char_eventtype)
    values ("${req.body.eventname}","${req.body.eventdate}","${req.body.location}","${req.body.purpose}","${req.body.time}","${req.body.eventtype}")
    `
    console.log(req.body)
db.query(query, (err, out) => {
    if(err) console.log(err)
    console.log(query)
})     
});


// secretariatRouter.get('/events/specialevents', (req, res)=>{
//     res.render('secretariat/views/event/specialevents')
// });


//===============================================================================================//
// R E S E R V A T I O N //
//===============================================================================================//

secretariatRouter.get('/reservation', (req, res)=>{
    res.render('secretariat/views/reservation/documents')
});
secretariatRouter.get('/reservation/document', (req, res)=>{
    res.render('secretariat/views/reservation/documents')
});


secretariatRouter.get('/reservation/events', (req, res)=>{
    res.render('secretariat/views/reservation/events')
});


secretariatRouter.get('/reservation/facilities', (req, res)=>{
    res.render('secretariat/views/reservation/facilities')
});
secretariatRouter.get('/reservation/walkin', (req, res)=>{
    res.render('secretariat/views/reservation/walkin')
});

//===============================================================================================//
secretariatRouter.get('/reservation/pending', (req, res)=>{
    res.render('secretariat/views/pending')
});
//===============================================================================================//
exports.secretariat = secretariatRouter;
// exports.index = indexRouter;
// exports.appoint = appointRouter;
// exports.events = eventsRouter;
// exports.reservation = reservationRouter;