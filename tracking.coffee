self = (application) ->

  init: (event) ->
    # BUG: doesnt fire on overlay buttons
    # todo: re-instantiate the listener on overlay render
    trackingInfo = @.getTrackInfoFromElementOrParents event.target
    if trackingInfo
      trackingInfo.category = 'Community'
      trackingInfo.action += ' clicked'
      # console.log '👍', trackingInfo
      # TODO: ga.trackEvent trackingInfo
      # ga('send', { 'event', trackingInfo.category, trackingInfo.action, label

  getInfo: (element) ->
    action = element.dataset.track
    if action
      return {
        action: action
        label: element.dataset.trackLabel
      }

  getTrackInfoFromElementOrParents: (element) ->
    info = @.getInfo(element)
    return info if info
    # console.log element
    while (element = element.parentNode) and (element.tagName != "BODY")
      info = @.getInfo(element)
      return info if info

module.exports = self

