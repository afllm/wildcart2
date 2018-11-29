"use strict";


moduleFactura.controller('facturanewxusuarioController', ['$scope', '$http', '$location', 'toolService', '$routeParams', '$window', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, $window, oSessionService) {
        
        $scope.btnNew = true;
        $scope.conectado = false;
        $scope.id = null;
        
        if (!$routeParams.id) {
            $scope.id_usuario= 0;  
        } else {
            $scope.id_usuario= $routeParams.id;
        }
        
           $http({
            method: 'GET',
            url: 'json?ob=usuario&op=get&id=' + $scope.id_usuario
        }).then(function (response) {
            $scope.status = response.status;
            $scope.nombre2 = response.data.message.nombre;
            $scope.ape1 = response.data.message.ape1;
        }, function (response) {
            $scope.status = response.status;
            
        });

        $scope.update = function () {
            $scope.btnNew = false;
            
            var json = {
                fecha: $scope.fecha,
                iva: $scope.iva,
                id_usuario: $scope.id_usuario
            };

            $http({
                method: 'POST',
                url: 'json?ob=factura&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                console.log(response);
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                $scope.resultado = "Creado";
            }), function (response) {
                console.log(response);
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.resultado = "No se pudo crear: "+$scope.ajaxDataUsuarios;
            }
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
