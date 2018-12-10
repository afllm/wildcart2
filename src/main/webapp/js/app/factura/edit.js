"use strict";

moduleFactura.controller("facturaEditController", ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {

        $scope.btnUpdate = true;
        $scope.conectado = false;
        
        if (!$routeParams.id) {
            $scope.idError = true;
        } else {
            $scope.idError = false;
            $scope.id = $routeParams.id;
            $http({
                method: "GET",
                url: 'json?ob=factura&op=get&id=' + $scope.id
            }).then(function (response) {
                console.log(response);
                $scope.id = response.data.message.id;
                $scope.fecha = response.data.message.fecha;
                $scope.iva = response.data.message.iva;
                $scope.obj_usuario_id = response.data.message.obj_usuario.id;
                $scope.obj_usuario_nombre = response.data.message.obj_usuario.nombre;
            }), function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
            };

        }
        
        
        $scope.editar = function () {
             $scope.btnUpdate = false;
             
            var json = {
                id: $scope.id,
                fecha: $scope.fecha,
                iva: $scope.iva,
                id_usuario: $scope.obj_usuario_id

            }
            $http({
                method: 'POST',
                url: 'json?ob=factura&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxData = response.data.message;
                $scope.resultado = "Actualizado";
                $scope.correcto=true;
                $scope.res="alert alert-info";
            }), function (response) {
                $scope.status = response.status;
                $scope.ajaxData = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo actualizar: "+$scope.ajaxDataUsuarios;
                $scope.correcto=false;
                $scope.res="alert alert-danger";
            }
        }

        $scope.goBack = function () {
            $window.history.back();
        }

         if (oSessionService.getUserName() !== "") {
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.usuarioId = oSessionService.getUsuarioId();
            $scope.id_tiposusario = oSessionService.getId_tipousuario();
            $scope.conectado = true;
        }
        
        $scope.isActive = toolService.isActive;

    }
]);