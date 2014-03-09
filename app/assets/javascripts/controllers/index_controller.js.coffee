votesForRound = (roundName)->
  Ember.computed('rounds', 'votes.@each', ->
    round = @get('rounds').findBy('name', roundName)
    votes = @get('votes').filterBy('round', roundName).sortBy('proposal.title')

    for item in [(votes.length + 1)..round.get('totalVotes')] by 1
      votes.push {}

    votes
  )

Proposals.IndexController = Ember.Controller.extend
  roundoneVotes: votesForRound('one')
  roundtwoVotes: votesForRound('two')
