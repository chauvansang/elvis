# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
MILLISECONDS_IN_A_YEAR = 31557600000

params = urlParams(location.href)
if params.hasOwnProperty('token')
  queryProfile(((data) ->
    console.log data
    setCookie('token', params['token'])
    displayData data
  ), params['token'])

displayData = (data) ->
  profile = data['Results'][0]
  $('#name').html("#{capitalizeName(profile['Name'])} (#{profile['UserID']})")
  $('#email').html(profile['Email'])
  matricTime = new Date("Aug 04 #{profile['MatriculationYear']} 12:00:00 GMT+0800")
  year = ((new Date()).getTime() - matricTime.getTime()) / MILLISECONDS_IN_A_YEAR
  ordinal = ordinalize(Math.ceil(year))
  ordinal = ordinal[0].toUpperCase() + ordinal.slice(1)
  $('#major').html("#{ordinal} Year #{profile['FirstMajor']}<br/>#{profile['Faculty']}")
  $('#action-confirm').removeAttr('disabled')

