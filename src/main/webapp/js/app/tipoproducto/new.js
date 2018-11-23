'use strict'

moduleTipoproducto.controller('tipoproductoNewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.btnNew = true;
        $scope.conectado = false;
      

        $scope.goBack = function () {
            $window.history.back();
        };
        
        $scope.nuevo = function () {
            $scope.btnNew = false;
            $http({
                method: 'POST',
                url: 'json?ob=tipoproducto&op=create',
                params: {json: JSON.stringify({desc:$scope.desc})}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproductos = response.data.message;
                $scope.resultado = "Creado";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipoproductos = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo crear";
            });
        };
        
        if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }
        
        $scope.isActive = toolService.isActive;



    }



]);





