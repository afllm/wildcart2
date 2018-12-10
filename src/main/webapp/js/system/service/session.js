'use strict';



moduleService.service('sessionService', ['$location', function ($location) {
        var isSessionActive = false;
        var userName = "";
        var usuarioId = "";
        var id_tipousuario = "";
        return {
            getUserName: function () {
                return userName;
            },
            setUserName: function (name) {
                userName = name;
            },
            isSessionActive: function () {
                return isSessionActive;
            },
            setSessionActive: function (name) {
                isSessionActive = true;
            },
            setSessionInactive: function (name) {
                isSessionActive = false;
                userName="";
                usuarioId="";
                id_tipousuario = "";
            },
            setUsuarioId: function (id) {
                usuarioId = id;
            },
            getUsuarioId: function () {
                return usuarioId;
            },
             setId_tipousuario: function (id) {
                id_tipousuario = id;
            },
            getId_tipousuario: function () {
                return id_tipousuario;
            }
        }

    }]);