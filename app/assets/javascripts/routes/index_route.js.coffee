Proposals.IndexRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash(
      rounds: @store.find('round')
      votes: @store.find('vote')
    )

  setupController: (controller, model) ->
    controller.set('rounds', model.rounds)
    controller.set('votes', model.votes)
