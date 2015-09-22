module.exports = (sequelize, DataTypes) ->
  Sessions = sequelize.define('Sessions', {
    id:
      type:         DataTypes.INTEGER.UNSIGNED
      allowNull:    false
      primaryKey:   true
    userId:         DataTypes.INTEGER
    token:          DataTypes.STRING(10)
    expiryAt:       DataTypes.DATE
    createdAt:      DataTypes.DATE
    updatedAt:      DataTypes.DATE
  },
  {},
  classMethods: associate: (models) ->
    # associations can be defined here
    return
  )

  return Sessions
