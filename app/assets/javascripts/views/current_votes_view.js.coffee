Proposals.CurrentVotesView = Ember.View.extend
  currentVotes: (->
    round = @get('round.name')
    @get("controller.round#{round}Votes")
  ).property('controller.votes.@each', 'round')
