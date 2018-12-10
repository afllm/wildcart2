"use strict";


moduleFactura.controller('facturaNewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {
        
         $scope.btnNew = true;
        $scope.conectado = false;
        
        $scope.update = function () {
             $scope.btnNew = false;
            var json = {
                id: null,
                fecha: $scope.fecha,
                iva: $scope.iva,
                id_usuario: $scope.obj_usuario_id
            };

            $http({
                method: 'POST',
                url: 'json?ob=factura&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Creada";
            }), function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo crear";
            }
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
