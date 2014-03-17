Proposals.VotingRoundController = Ember.Controller.extend
  filterBy: 'visible'

  visibleProposals: (->
    @get('proposals').filterBy(@get('filterBy')).sortBy('title')
  ).property('proposals.@each.visible','filterBy')

  voteCount: (->
    @get('proposals').filterBy('selected').length
  ).property('proposals.@each.selected')

  allCount: (->
    @get('proposals').filterBy('visible').length
  ).property('proposals.@each.visible')

  hiddenCount: (->
    @get('proposals').filterBy('hidden').length
  ).property('proposals.@each.hidden')

  completedVoting: (->
    @get('voteCount') == @get('round.totalVotes')
  ).property('voteCount', 'round.totalVotes')

  showAll: Ember.computed.equal('filterBy', 'visible')
  showSelected: Ember.computed.equal('filterBy', 'selected')
  showHidden: Ember.computed.equal('filterBy', 'hidden')

  actions:
    setFilterBy: (filter) ->
      @set('filterBy', filter)
