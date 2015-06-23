do ->
  app = angular.module('app', [])

  app.controller 'AnagramController', ->
    this.input = 'alter'
    this.anagrams = []
    this.list = [
      'later'
      'alert'
      'alter'
      'altor'
      'caca'
    ]

    this.search = ->
      this.anagrams = []
      inputArr = this.positionArrayFor(this.input)
      for l in this.list
        if this.input.length == l.length
          listArr = this.positionArrayFor(l)
          count = 0
          isAnagram = true
          while count < inputArr.length && isAnagram
            if inputArr[count] == listArr[count]
              count++
            else
              isAnagram = false
          this.anagrams.push l if isAnagram

    this.positionArrayFor = (string)->
      array = []
      for i in string
        pos = i.charCodeAt(0) - 97
        array[pos] = if array[pos] == undefined then 0 else array[pos] + 1
      array
