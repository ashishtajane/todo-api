var models  = require('../models/index');
var express = require('express');
var router = express.Router();

router.post('/', function(req, res) {
  models.Item.create({
    text: req.body.item.text
  }).then(function(item){
    res.json(item);
  });
});

router.get('/', function(req, res) {
  models.Item.findAll({}).then(function(items) {
    res.json(items);
  });
});

router.get('/:id', function(req, res) {
  models.Item.find({
    where: {
      id: req.params.id
    }
  }).then(function(item) {
    res.json(item);
  });
});

router.put('/:id', function(req, res) {
  models.Item.find({
    where: {
      id: req.params.id
    }
  }).then(function(item) {
    if(item){
      item.updateAttributes({
        text: req.body.item.text,
        done: req.body.item.done
      }).then(function(item) {
        res.json(item);
      });
    }
  });
});

router.delete('/:id', function(req, res) {
  models.Item.destroy({
    where: {
      id: req.params.id
    }
  }).then(function(item) {
    res.json(item);
  });
});

module.exports = router;
