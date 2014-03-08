Proposals.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('rounds', @store.find('round'))
    controller.set('votes', @store.find('vote'))
