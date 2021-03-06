module.exports =
  up: (queryInterface, Sequelize) ->
    queryInterface.createTable 'Users',
      id:
        type:           Sequelize.INTEGER.UNSIGNED
        allowNull:      false
        primaryKey:     true
      email:
        type:           Sequelize.STRING
        allowNull:      false
      firstName:
        type:           Sequelize.STRING
      lastName:
        type:           Sequelize.STRING
      password:
        type:           Sequelize.STRING
        allowNull:      false
      role:
        type:           Sequelize.STRING
        allowNull:      false
      createdAt:
        allowNull:      false
        type:           Sequelize.DATE
      updatedAt:
        allowNull:      false
        type:           Sequelize.DATE
  down: (queryInterface, Sequelize) ->
    queryInterface.dropTable 'Users'
