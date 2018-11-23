'use strict'

moduleTipousuario.controller('tipousuarioNewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
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
                url: 'json?ob=tipousuario&op=create',
                params: {desc:$scope.desc}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipousuarios = response.data.message;
                $scope.resultado = "Creado con éxito";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataTipousuarios = response.data.message || 'Request failed';
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





