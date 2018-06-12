exports.guestAuth = (req, res, next) => {
    if (req.session && req.session.user && Object.keys(req.session.user).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthed = (req, res, next) => {
    if (req.session && req.session.user && Object.keys(req.session.user).length > 0) return res.redirect('/guest');
    return next();
}

//admin

exports.adminAuth = (req, res, next) => {
    if (req.session && req.session.admin && Object.keys(req.session.admin).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthedadmin = (req, res, next) => {
    if (req.session && req.session.admin && Object.keys(req.session.admin).length > 0) return res.redirect('/admin');
    return next();
}

//secretariat

exports.secretariatAuth = (req, res, next) => {
    if (req.session && req.session.secretariat && Object.keys(req.session.secretariat).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthedsecretariat = (req, res, next) => {
    if (req.session && req.session.secretariat && Object.keys(req.session.secretariat).length > 0) return res.redirect('/secretariat');
    return next();
}

//coordinator

exports.coordinatorAuth = (req, res, next) => {
    if (req.session && req.session.coordinator && Object.keys(req.session.coordinator).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthedcoordinator = (req, res, next) => {
    if (req.session && req.session.coordinator && Object.keys(req.session.coordinator).length > 0) return res.redirect('/coordinator');
    return next();
}

//catechist


exports.catechistAuth = (req, res, next) => {
    if (req.session && req.session.catechist && Object.keys(req.session.catechist).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthedcatechist = (req, res, next) => {
    if (req.session && req.session.catechist && Object.keys(req.session.catechist).length > 0) return res.redirect('/catechist');
    return next();
}

//priest


exports.priestAuth = (req, res, next) => {
    if (req.session && req.session.priest && Object.keys(req.session.priest).length > 0) return next();
    return res.redirect('/index?unauthorized');
}

exports.noAuthedpriest = (req, res, next) => {
    if (req.session && req.session.priest && Object.keys(req.session.priest).length > 0) return res.redirect('/priest');
    return next();
}


