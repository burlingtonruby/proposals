Proposals.User = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  isAdmin: DS.attr('boolean')
  isVoter: DS.attr('boolean')
