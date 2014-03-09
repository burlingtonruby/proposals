Proposals.VotingRoundController = Ember.ObjectController.extend
  visibleProposals: (->
    @get('proposals').filterBy('visible')
  ).property('proposals.@each.visible')
