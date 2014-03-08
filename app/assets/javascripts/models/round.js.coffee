Proposals.Round = DS.Model.extend
  text: DS.attr('string')
  totalVotes: DS.attr('number')
  isAnonymous: DS.attr('boolean')
  isCurrentRound: DS.attr('boolean')
  name: DS.attr('string')
