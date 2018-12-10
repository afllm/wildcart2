wildcart.run(['$rootScope', 'sessionService', '$location', '$http',
    function ($rootScope, oSessionService, $location, $http) {
        $rootScope.$on("$routeChangeStart", function (event, next, current) {

            var nextUrl = next.$$route.originalPath;



            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=check'/*con la raiz (/) no funciona*/
            }).then(function (response) {
                if (response.data.status == 200) {
                    oSessionService.setSessionActive;
                    oSessionService.setUserName(response.data.message.nombre + " " + response.data.message.ape1);
                    oSessionService.setUsuarioId(response.data.message.id);
                    oSessionService.setId_tipousuario(response.data.message.obj_tipoUsuario.id);                    
                } else {
                    oSessionService.setSessionInactive;
                    if (nextUrl != '/' && nextUrl != '/home' && nextUrl != '/usuario/login') {
                        $location.path("/");
                    }
                }
            }, function (response) {
                oSessionService.setSessionInactive;
                if (nextUrl != '/' && nextUrl != '/home' && nextUrl != '/usuario/login') {
                    $location.path("/");
                }

            });








        })





    }]);