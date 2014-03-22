Proposals.Router.map ()->
  @resource('voting_round', path: '/round/:round')
  @resource('voting_results', path: '/results/:round')
  @resource('proposals', ->
    @route('show', path: ':proposal_id')
  )

Proposals.Router.reopen
  rootURL: '/voting/'
  location: 'history'

