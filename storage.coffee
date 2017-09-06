self =

  # Wrapper around localStorage that ignores over quota errors
  storeLocal: (key, value) ->
    try
      window.localStorage[key] = JSON.stringify value
    catch
      console.warn "Could not save to localStorage. (localStorage is disabled in private Safari windows)"

  getLocal: (key) ->
    try
      JSON.parse window.localStorage[key]

  getPref: (key) ->
    self.getUserPrefs()[key]

  getPrefs: ->
    self.getLocal('communityPrefs') or {}

  updatePrefs: (key, value) ->
    prefs = self.getPrefs()
    prefs[key] = value
    self.storeLocal('communityPrefs', prefs)

module.exports = self
