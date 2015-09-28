translationApp = angular.module('translation', [
  # Including external libraries
  'ui.router'
  'pascalprecht.translate'
  'restangular'
  'ngAnimate'
  'ngAria'
  'ngMaterial'

  # Including templates
  'templates-module'

  # Including pages of aplication
  'translation.404'
  'translation.login'
  'translation.dashboard'
  'translation.add-new-key'

  # Including services
  'userService'

  # Including controllers
  'translation.controllers.sidenav'
])


.config ($stateProvider, $urlRouterProvider, $locationProvider, $animateProvider, RestangularProvider) ->

  $stateProvider
  .state 'app',
    url:          ''
    abstract:     true
    controller:   'AppController'
    templateUrl:  'templates/app.tpl.html'
    resolve:
      user: (user) ->
        return user.getSession()

  $urlRouterProvider
    .when('', '/')
    .when('/', '/login')
    .otherwise('/404')



  RestangularProvider.setBaseUrl '/api'

  $locationProvider.html5Mode(true)

  #$animateProvider.classNameFilter(/animate/)




.run ($rootScope) ->

  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
    return

  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    console.log error
    return

  $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
    return

  return

# App Controller
# -------------
.controller 'AppController', ($scope, $mdSidenav) ->

  return

