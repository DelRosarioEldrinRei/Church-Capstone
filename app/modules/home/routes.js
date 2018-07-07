var express = require('express');
var router = express.Router();

var authMiddleware = require('../auth/middlewares/auth');

router.route('/')
  .get((req, res) => {
    res.render('home/views/index');
  });

router.route('/about')
  .get((req, res) => {
    res.render('home/views/about');
  });

router.route('/services')
  .get((req, res) => {
    res.render('home/views/services');
  });

router.route('/signup')
  .get((req, res) => {
    res.render('home/views/signup');
  });


/**
 * Here we just export said router on the 'index' property of this module.
 */
exports.index = router;