do ->
  app = angular.module('app', [])

  app.controller 'AnagramController', ['$scope', ($scope) ->

    $scope.word = ''
    $scope.anagrams = []
    $scope.list = []

    $scope.search = ->
      $scope.anagrams = []
      word = removeDiacritics($scope.word).replace(/\W+/g, '')
      console.info(word)
      inputArr = $scope.positionArrayFor(word)
      for l in $scope.list
        if word.length == l.length
          listArr = $scope.positionArrayFor(l)
          count = 0
          isAnagram = true
          while count < inputArr.length && isAnagram
            if inputArr[count] == listArr[count]
              count++
            else
              isAnagram = false
          $scope.anagrams.push l if isAnagram

    $scope.positionArrayFor = (string)->
      array = []
      for i in string
        pos = i.charCodeAt(0) - 97
        array[pos] = if array[pos] == undefined then 0 else array[pos] + 1
      array

    $scope.loadWordList = ->
      $.getJSON "wordlist.json", (json)->
        $scope.list = json

    $scope.loadWordList()
  ]