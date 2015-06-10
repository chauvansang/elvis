#
# COOKIES
#

@setCookie = (name, value, expire) ->
  expireString = ""
  if expire
    d = undefined
    if typeof expire is "number"
      d = new Date()
      d.setTime(d.getTime() + expire*24*60*60*1000)
    else if typeof expire is "string"
      d = new Date(expire)
    expireString = "; expires=" + d.toUTCString()
  document.cookie = name + "=" + window.encodeURI(value) + expireString

@getCookie = (name) ->
  nameRegExp = new RegExp(name + "=(\\S+)(?:;\s)?")
  return false unless value = document.cookie.match(nameRegExp)
  window.decodeURI(value[1])

@deleteCookie = (name) ->
  setCookie(name, '', "Thu, 01 Jan 1970 00:00:01 GMT")

@allCookies = ->
  return undefined unless document.cookie.length > 0
  cookies = {}
  for cookie in document.cookie.split(';')
    do (cookie) ->
      console.log cookie
      cookieName = (cookieDetails = cookie.split('='))[0]
      cookieValue = cookieDetails[1]
      cookies[cookieName] = window.decodeURI(cookieValue)
  cookies

#
# URL
#
@urlParams = (url) ->
  url = url.slice(url.lastIndexOf('?') + 1)
  params = {}
  for param in url.split('&')
    do (param) ->
      params[(p = param.split('='))[0]] = p[1]
  params

@ordinalize = (num) ->
  ordinals = ['zeroth','first','second','third','fourth','fifth','sixth','seventh','eighth','ninth','tenth']
  ordinals[num]

@capitalizeName = (name) ->
  name.replace(/(?:-|')?\w+/g, ((str) ->
    replaced = ""
    if ['-','\''].indexOf(str.charAt(0)) > -1
      replaced += str.charAt(0)
      str = str.slice(1)
    replaced += str.charAt(0).toUpperCase() + str.slice(1).toLowerCase()
  ))
