'use strict';

module.exports = function(sequelize, DataTypes) {
  var Item = sequelize.define("Item", {
    text: DataTypes.STRING,
    done: DataTypes.BOOLEAN
  }, {
    classMethods: {}
  });

  return Item;
};