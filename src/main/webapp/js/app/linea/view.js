'use strict'

moduleLinea.controller("lineaViewController", ['$scope', '$http', '$routeParams', '$window','sessionService',
    function ($scope, $http, $routeParams, $window,oSessionService) {

        $scope.ob = "linea";
        if (oSessionService.getUserName() !== "") {
            $scope.nombre = oSessionService.getUserName();
            $scope.validlog = true;
        }

        if (!$routeParams.id) {
            $scope.id = 1;
        } else {
            $scope.id = $routeParams.id;
        }

        $http({
            method: 'GET',
            url: 'json?ob=' + $scope.ob + '&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message;
        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
        });



        $scope.volver = function () {
            $window.history.back();
        };
       
    }

]);