Proposals.VotingRoundController = Ember.Controller.extend
  visibleProposals: (->
    @get('proposals').filterBy('visible').sortBy('title')
  ).property('proposals.@each.visible')

  voteCount: (->
    @get('proposals').filterBy('selected').length
  ).property('proposals.@each.selected')

  completedVoting: (->
    @get('voteCount') == @get('round.totalVotes')
  ).property('voteCount', 'round.totalVotes')
