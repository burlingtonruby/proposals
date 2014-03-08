Proposals.IndexController = Ember.Controller.extend
  # TODO: Figure out how to DRY this up

  roundoneVotes: (->
    round = @get('rounds').findBy('name', 'one')
    votes = @get('votes').filterBy('round', 'one').sortBy('proposal.title')

    for item in [(votes.length + 1)..round.get('totalVotes')] by 1
      votes.push {}

    votes
  ).property('rounds', 'votes.@each')

  roundtwoVotes: (->
    round = @get('rounds').findBy('name', 'two')
    votes = @get('votes').filterBy('round', 'two').sortBy('proposal.title')

    for item in [(votes.length + 1)..round.get('totalVotes')] by 1
      votes.push {}

    votes
  ).property('rounds', 'votes.@each')
