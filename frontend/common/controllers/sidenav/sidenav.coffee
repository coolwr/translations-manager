angular.module('translation.controllers.sidenav', [
  'ui.router'
  'ngAnimate'
  'ngCookies'
  'ngAria'
  'ngMaterial'
  'projectsService'
  'userService'
])


.controller 'SidenavController', ($scope, $rootScope, $state, $cookies,
$mdSidenav, $mdUtil, projects, userService) ->



  $scope.user = userService.user()

  $scope.goTo = (uiview) ->
    $state.go(uiview)

  $scope.countLanguages = 8
  $scope.countKeys = 1234

  $scope.currentProject = {}

  projects.updated.then null, null, (project) ->
    $scope.currentProject = project

  userService.updated.then null, null, (user) ->
    $scope.user = user



  $scope.pages = [
    { name: "Programmer view", sref: "app.programmer-view" }
    { name: "Manager view", sref: "app.manager-view" }
    { name: "Translator view", sref: "app.translator-view" }
    { name: "Admin view", sref: "app.admin-view" }
  ]

  $rootScope.logout = userService.logout

  $scope.groups = [
    { name: "All", isActive: true }
    { name: "dashboard", isActive: false }
    { name: "media.side.awesome", isActive: true }
    { name: "title.pages", isActive: false }
  ]



  $rootScope.changeProject = () ->
    console.log "change project"



  # $scope.pages = [
  #   { name: 'Pepperoni', wanted: true }
  #   { name: 'Sausage', wanted: false }
  #   { name: 'Black Olives', wanted: true }
  #   { name: 'Green Peppers', wanted: false }
  # ]
  return
