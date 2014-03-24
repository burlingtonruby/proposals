Proposals.Result = DS.Model.extend
  proposal: DS.belongsTo('proposal')
  voteCount: DS.attr('number')
  title: DS.attr('string')
  userName: DS.attr('string')
