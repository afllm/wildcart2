'use strict'

moduleTipousuario.controller('tipousuarioViewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
    function ($scope, $http, $location, toolService, $routeParams, $window) {

        $scope.totalPages = 1;
        $scope.conectado = false;

        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: 'json?ob=tipousuario&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipousuarios = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipousuarios = response.data.message || 'Request failed';
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };
        
        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }

        $scope.isActive = toolService.isActive;

        

    }



]);


