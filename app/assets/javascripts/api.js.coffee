lapiKey = 'OU7f2jPga6Kw1P9X31OhU'

#
# UNIVERSAL HELPERS
#
@getJSON = (url, callback) ->
  $.ajax
    type: 'GET'
    url: url
    dataType: 'jsonp'
    cache: false
    crossDomain: true
    processData: true
    success: ((data) ->
      callback(data)
    ).bind(this)
    error: ((xhr, status, err) ->
      console.error url, status, err.toString()
    ).bind(this)

@saveToken = (token, remember) ->
  expire = 30 if remember
  setToken('token', token, expire)

#
# URL HELPERS
#
defaultAPIUrl = (module) ->
  "https://ivle.nus.edu.sg/api/Lapi.svc/#{module}?APIKey=#{lapiKey}&"

queryTokenUrl = (returnUrl) ->
  "https://ivle.nus.edu.sg/api/login/?apikey=#{lapiKey}&url=#{returnUrl}"

loginUrl = (token) ->
  token = getCookie('token') unless token
  "#{defaultAPIUrl('Validate')}Token=#{token}"

queryProfileUrl = (token) ->
  token = getCookie('token') unless token
  "#{defaultAPIUrl('Profile_View')}AuthToken=#{token}"

queryTimetableUrl = (token, acadYear, semester) ->
  token = getCookie('token') unless token
  "#{defaultAPIUrl('Timetable_Student')}AuthToken=#{token}&AcadYear=#{acadYear}&Semester=#{semester}"
#
# API HELPERS
#
@queryProfile = (callback, token) ->
  getJSON(queryProfileUrl(token), callback)

@queryTimetableUrl = (acadYear, semester, callback, token) ->
  getJSON(queryTimetableUrl(token, acadYear, semester), callback)

@dataLogger = (data) ->
  console.log data
