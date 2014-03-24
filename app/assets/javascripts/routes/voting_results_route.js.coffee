Proposals.VotingResultsRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash(
      round: @store.find('round', params.round)
      results: @store.find('result', round: params.round)
    )

  setupController: (controller, model) ->
    controller.set('round', model.round)
    controller.set('results', model.results)
