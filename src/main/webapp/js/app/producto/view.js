'use strict'

moduleProducto.controller('productoViewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.totalPages = 1;
        $scope.conectado = false;
        
        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;

            $http({
                method: 'GET',
                url: 'json?ob=producto&op=get&id=' + $scope.id
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message;
                $scope.resultado="Creado";
            }, function (response) {
                $scope.status = response.status;
                $scope.ajaxDataProductos = response.data.message || 'Request failed';
                $scope.resultado="No se pudo crear";
            });
        }

        $scope.goBack = function () {
            $window.history.back();
        };
        
       if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.id_tiposusario = oSessionService.getId_tipousuario();
            $scope.conectado = true;
        }

$scope.isActive = toolService.isActive;

        

    }



]);





