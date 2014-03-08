Proposals.VotingRoundRoute = Ember.Route.extend
  model: (params) ->
    @store.find('round', params.round)

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('proposals', @store.find('proposal'))
