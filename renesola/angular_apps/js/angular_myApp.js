/**
 * Created by marc on 2/15/2015.
 */
var myApp = angular.module('myApp', [], function($interpolateProvider)

{
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
});
