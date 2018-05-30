var express = require('express');
var indexRouter = express.Router();
var loginRouter = express.Router();
var logoutRouter = express.Router();
var signupRouter = express.Router();//dontgetconfused,this is the signup router :)
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

indexRouter.route('/schedule')
.get(authMiddleware.noAuthed, (req, res) => {
    res.render('auth/views/schedule', req.query);
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
            if (results.length === 0) return res.redirect('/index?incorrect');

            var user = results[0];
            
            if (user.var_password !== req.body.user_password) return res.redirect('/index?incorrect');
            
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
                console.log(req.session);
                return res.redirect('/guest');
            }
        });
    })


    signupRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('auth/views/signup.pug', req.query);
    })
    .post((req, res) => {
        
        var queryString = `INSERT INTO tbl_user(var_userlname, var_userfname, var_usermname, char_usergender, date_userbirthday, var_useraddress, var_usercontactnum, var_username, var_useremail, var_password, char_usertype) VALUES(?,?,?,?,?,?,?,?,?,?,?)`;
        db.query(queryString, [req.body.lastname, req.body.firstname, req.body.middlename, req.body.gender, req.body.birthday, req.body.address, req.body.contactnumber, req.body.username, req.body.email, req.body.password, "Guest"], (err, results, fields) => {
            if (err) throw err;
            
            res.redirect('/login?signUpSuccess');
        });

        // res.redirect('/guest')

        });
    // })

logoutRouter.get('/', (req, res) => {
    req.session.destroy(err => {
        if (err) throw err;
        res.redirect('/index');
    });
});
exports.index = indexRouter;
exports.login = loginRouter;
exports.logout = logoutRouter;
exports.signup = signupRouter;