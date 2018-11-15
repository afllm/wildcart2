'use strict'

moduleUsuario.controller('tipousuarioViewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;

        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: '/json?ob=tipousuario&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTiposUsuario = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTiposUsuario = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };

        $scope.isActive = toolService.isActive;

        

    }



]);


