# This file is for formatting like rails helper
# If we don't have any format, no need this file

FastFinder.Util =
  capitalize: (value) ->
    value.replace /(^|\s)([a-z])/g, (m, p1, p2) ->
      p1 + p2.toUpperCase()