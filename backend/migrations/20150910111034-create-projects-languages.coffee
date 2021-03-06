module.exports =
  up: (queryInterface, Sequelize) ->
    queryInterface.createTable 'ProjectsLanguages',
      projectId:
        type:           Sequelize.INTEGER.UNSIGNED
        allowNull:      false
        references:
          model:        "Projects"
          key:          "id"
      languageId:
        type:           Sequelize.INTEGER.UNSIGNED
        allowNull:      false
        references:
          model:        "Languages"
          key:          "id"
  down: (queryInterface, Sequelize) ->
    queryInterface.dropTable 'ProjectsLanguages'
