Proposals.Vote = DS.Model.extend
  proposal: DS.belongsTo('proposal')
  round: DS.attr('string')
