Proposals.VotingRoundController = Ember.ObjectController.extend
  visibleProposals: (->
    @get('proposals').filterBy('visible').sortBy('title')
  ).property('proposals.@each.visible')
