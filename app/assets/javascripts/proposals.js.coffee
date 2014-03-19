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

# Create an intializer that injects Rails' current_user into the Ember app.
# http://say26.com/using-rails-devise-with-ember-js
Ember.Application.initializer
  name: 'currentUser'

  initialize: (container) ->
    store = container.lookup('store:main')
    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      # Manually normalize attributes (underscore to camelcase) of serialized
      # user and push into the store (creating an instance)
      user = store.push('user', store.serializerFor('user').normalize(Proposals.User, JSON.parse(attributes)))

      # Put the user instance into the content variable of CurrentUserController
      controller = container.lookup('controller:currentUser').set('content', user)

      # Perform typeInjection on all the controllers in our app to give them
      # currentUser variable so that we don't need to set it manually.
      container.typeInjection('controller', 'currentUser', 'controller:currentUser')

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
