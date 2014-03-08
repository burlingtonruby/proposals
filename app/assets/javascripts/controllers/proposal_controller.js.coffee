Proposals.ProposalController = Ember.ObjectController.extend
  abstractActive: true
  notesActive: false
  pitchActive: false
  submitterActive: false

  actions:
    toggleVote: ->
      if @get('vote')
        vote = @get('vote')
        vote.deleteRecord()
      else
        vote = @store.createRecord('vote',
          proposal: @get('model')
        )

      vote.save().then =>
        @toggleProperty('selected')

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
