#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

$ ->
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    token = $('meta[name="csrf-token"]').attr('content')
    xhr.setRequestHeader('X-CSRF-Token', token)

showdown = new Showdown.converter()

Ember.Handlebars.helper('format-markdown', (input) ->
  return unless input
  new Handlebars.SafeString(showdown.makeHtml(input))
)

Ember.Handlebars.helper('format-twitter', (input) ->
  return unless input

  input = input.replace(/@|.*\/+/, '')

  new Handlebars.SafeString("<a href='https://twitter.com/#{input}'>@#{input}</a>")
)

Ember.Handlebars.helper('format-github', (input) ->
  return unless input

  input = input.replace(/.*\/+/, '')

  new Handlebars.SafeString("<a href='https://github.com/#{input}'>#{input}</a>")
)

Ember.Handlebars.helper('format-website', (input) ->
  return unless input

  new Handlebars.SafeString("<a href='#{input}'>#{input}</a>")
)
