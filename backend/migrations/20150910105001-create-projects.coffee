module.exports =
  up: (queryInterface, Sequelize) ->
    queryInterface.createTable 'Projects',
      id:
        type:           Sequelize.INTEGER.UNSIGNED
        autoIncrement:  true
        primaryKey:     true
        allowNull:      false
      name:
        type:           Sequelize.STRING
      defaultLanguage:
        type:           Sequelize.INTEGER.UNSIGNED
        allowNull:      false
        references:
          model:        "Languages"
          key:          "id"
      description:
        type:           Sequelize.TEXT
      createdAt:
        type:           Sequelize.DATE
        allowNull:      false
      updatedAt:
        type:           Sequelize.DATE
        allowNull:      false
  down: (queryInterface, Sequelize) ->
    queryInterface.dropTable 'Projects'
