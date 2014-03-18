Proposals.ProposalController = Ember.ObjectController.extend
  abstractActive: true
  notesActive: false
  pitchActive: false
  submitterActive: false

  actions:
    toggleVote: (vote, proposal)->
      if vote
        vote.deleteRecord()
      else
        vote = @store.createRecord('vote',
          proposal: proposal
        )

      vote.save().then(=>
        @toggleProperty('selected')
      ).catch((error) ->
        alert(error.responseText)
      )

      false

    toggleHide: (hidden_vote, proposal)->
      if hidden_vote
        hidden_vote.deleteRecord()
      else
        hidden_vote = @store.createRecord('hidden_vote',
          proposal: proposal
        )

      hidden_vote.save().then(=>
        @toggleProperty('visible')
      ).catch((error) ->
        alert(error.responseText)
      )
      false

    showAbstract: ->
      @send('toggleOff')
      @set('abstractActive', true)
      false
    showNotes: ->
      @send('toggleOff')
      @set('notesActive', true)
      false
    showPitch: ->
      @send('toggleOff')
      @set('pitchActive', true)
      false
    showSubmitter: ->
      @send('toggleOff')
      @set('submitterActive', true)
      false
    toggleOff: ->
      @set('abstractActive', false)
      @set('notesActive', false)
      @set('pitchActive', false)
      @set('submitterActive', false)
