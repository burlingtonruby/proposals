Proposals.ProposalController = Ember.ObjectController.extend
  abstractActive: true
  notesActive: false
  pitchActive: false
  submitterActive: false

  actions:
    vote: ->
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
