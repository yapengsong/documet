/**
 * Created by ZHL on 2016/7/20.
 */
var express = require('express');
var router = express.Router();

router.get('/', function (req, res, next) {
    var user = {
        name: "张三",
        age: 25
    };
    res.json(user);
});

router.post('/', function (req, res, next) {
    res.json({status:200,msg:'成功'});
});

router.delete('/', function (req, res, next) {
    res.json({status:200,msg:'成功'});
});

module.exports = router;