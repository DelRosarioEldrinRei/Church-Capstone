var express = require('express');
var indexRouter = express.Router();
var loginRouter = express.Router();
var logoutRouter = express.Router();
var loginGuestRouter = express.Router();//dontgetconfused,this is the signup router :)
var authMiddleware = require('./middlewares/auth');
var db = require('../../lib/database')();

loginRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('auth/views/login', req.query);
    })


indexRouter.route('/')
.get(authMiddleware.noAuthed, (req, res) => {
    res.render('auth/views/index', req.query);
})


loginRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('auth/views/login', req.query);
    })
    .post((req, res) => {
        console.log('POST LOGIN');
        var db = require('../../lib/database')();
        db.query(`SELECT * FROM tbl_user WHERE var_username="${req.body.user_username}"`, (err, results, fields) => {
            if (err) throw err;
            if (results.length === 0) return res.redirect('/login?incorrect');

            var user = results[0];
            
            if (user.var_password !== req.body.user_password) return res.redirect('/login?incorrect');
            
            if(user.char_usertype == "Admin"){
                delete user.var_password;
                req.session.admin = user;
                console.log(req.session);
                return res.redirect('/admin');
                
            }
            if(user.char_usertype == "Secretariat"){
                delete user.var_password;
                req.session.secretariat = user;
                console.log(req.session);
                return res.redirect('/secretariat');
                
            }
            if(user.char_usertype == "Coordinator"){
                delete user.var_password;
                req.session.coordinator = user;
                console.log(req.session);
                return res.redirect('/coordinator');
                
            }
            if(user.char_usertype == "Catechist"){
                delete user.var_password;
                req.session.catechist = user;
                console.log(req.session);
                return res.redirect('/catechist');
                
            }
            if(user.char_usertype == "Priest"){
                delete user.var_password;
                req.session.priest = user;
                console.log(req.session);
                return res.redirect('/priest');
                
            }

            else{                
                delete user.var_password;
                req.session.user = user;
                return res.redirect('/guest');
            }
        });
    })


    loginGuestRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('auth/views/signup.pug', req.query);
    })
    .post((req, res) => {
        
        var queryString = `INSERT INTO \`tbl_user\` 
        (\`var_lastname\`, 
        \`var_firstname\`, 
        \`var_middlename\`, 
        \`var_username\`, 
        \`var_password\`, 
        \`char_usertype\`, 
        \`var_guestemail\`, 
        \`char_gender\`, 
        \`date_guestbirthday\`, 
        \`var_guestaddress\`, 
        \`var_guestcontactnumber\`)
        VALUES(
            "${req.body.userlastname}",
            "${req.body.userfirstname}",
            "${req.body.usermiddlename}",
            "${req.body.username}", 
            "${req.body.password}", 
            "User", 
            "${req.body.useremail}",
            "${req.body.usergender}", 
            "${req.body.userbirthday}", 
            "${req.body.useraddress}", 
            "${req.body.usercontactnumber}" 
        );`;
        
        db.query(queryString, (err, results, fields) => {
            if (err) throw err;
            
            res.redirect('/login?signUpSuccess');
        });

        // res.redirect('/guest')

        });
    // })

logoutRouter.get('/', (req, res) => {
    req.session.destroy(err => {
        if (err) throw err;
        res.redirect('/login');
    });
});
exports.index = indexRouter;
exports.login = loginRouter;
exports.logout = logoutRouter;
exports.signup = loginGuestRouter;