'use strict';

moduleCommon.controller('homeController', ['$scope', '$location', 'toolService', 'sessionService',
    function ($scope, $location, toolService, oSessionService) {

        $scope.ruta = $location.path();
        $scope.isActive = toolService.isActive;
        $scope.conectado = false;
        
        if(oSessionService.getUserName() !==""){
            $scope.usuarioConectado = oSessionService.getUserName();
            $scope.conectado = true;
        }
        
        $scope.desconectar = function (){
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=logout'
            }).then(function () {
                $location.url('/');
            });
        }

    }]);