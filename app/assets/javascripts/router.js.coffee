Proposals.Router.map ()->
  @resource('voting_round', path: '/round/:round')

Proposals.Router.reopen
  rootURL: '/voting/'
  location: 'history'

