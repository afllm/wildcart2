'use strict'

moduleTipoproducto.controller('tipoproductoViewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window',
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
                url: 'json?ob=tipoproducto&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoProductos = response.data.message;
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoProductos = response.data.message || 'Request failed';
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


