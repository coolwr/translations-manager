angular.module 'translation.services.filtersState', []

.service 'FiltersStateService', ($q, $timeout, Restangular) ->

  _groups = []
  _topBarDefaultFilters = {}
  _topBarDefaultFilters.translation = [
    {
      name: "All translations"
      value: 0
      default: true
    }
    {
      name: "Missing translations"
      value: 1
    }
    {
      name: "Without missing translations"
      value: 2
    }
  ]

  _topBarDefaultFilters.plurals = [
    {
      name:     "None"
      value:    null
      default:  true
    }
    {
      name:     "Only plurals"
      value:    true
    }
    {
      name:     "Not plurals"
      value:    false
    }
  ]

  _refreshGroups = () ->
    Restangular.one('groups').getList().then (success)->
      _groups = groupHelper(success.plain())
    , (error) ->
      console.log "Problem with loading groups"

#      group model needs additional field (isActive) for application purposes
  groupHelper = (collection) ->
    angular.forEach collection, (value, key) ->
      value.isActive = false
    return collection


  api =
    topBarDefaultFilters: _topBarDefaultFilters
    refreshGroups: _refreshGroups
    getGroups: () ->
      return angular.copy _groups
  return api
