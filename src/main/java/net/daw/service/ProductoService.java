package net.daw.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import net.daw.bean.ReplyBean;
import net.daw.bean.ProductoBean;
import net.daw.connection.publicinterface.ConnectionInterface;
import net.daw.constant.ConnectionConstants;
import net.daw.dao.ProductoDao;
import net.daw.factory.ConnectionFactory;
import net.daw.helper.EncodingHelper;
import net.daw.helper.ParameterCook;

public class ProductoService {

    HttpServletRequest oRequest;
    String ob = null;

    public ProductoService(HttpServletRequest oRequest) {
        super();
        this.oRequest = oRequest;
        ob = oRequest.getParameter("ob");
    }

    public ReplyBean get() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer id = Integer.parseInt(oRequest.getParameter("id"));
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            ProductoBean oProductoBean = oProductoDao.get(id,1);
            //Gson oGson = new Gson();
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oReplyBean = new ReplyBean(200, oGson.toJson(oProductoBean));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: get method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }

        return oReplyBean;

    }

    public ReplyBean remove() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer id = Integer.parseInt(oRequest.getParameter("id"));
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            int iRes = oProductoDao.remove(id);
            oReplyBean = new ReplyBean(200, Integer.toString(iRes));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: remove method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;

    }

    public ReplyBean getcount() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            int registros = oProductoDao.getcount();
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oReplyBean = new ReplyBean(200, oGson.toJson(registros));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getcount method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }

        return oReplyBean;

    }

    public ReplyBean create() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            String strJsonFromClient = oRequest.getParameter("json");
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            ProductoBean oProductoBean = new ProductoBean();
            oProductoBean = oGson.fromJson(strJsonFromClient, ProductoBean.class);
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            oProductoBean = oProductoDao.create(oProductoBean);
            oReplyBean = new ReplyBean(200, oGson.toJson(oProductoBean));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: create method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;
    }

    public ReplyBean update() throws Exception {
        int iRes = 0;
        ReplyBean oReplyBean = null;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            String strJsonFromClient = oRequest.getParameter("json");
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            ProductoBean oProductoBean = new ProductoBean();
            oProductoBean = oGson.fromJson(strJsonFromClient, ProductoBean.class);
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            iRes = oProductoDao.update(oProductoBean);
            oReplyBean.setStatus(200);
            oReplyBean.setJson(Integer.toString(iRes));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: update method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;
    }

    public ReplyBean getpage() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer iRpp = Integer.parseInt(oRequest.getParameter("rpp"));
            Integer iPage = Integer.parseInt(oRequest.getParameter("page"));
            HashMap<String, String> hmOrder = ParameterCook.getOrderParams(oRequest.getParameter("order"));
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            ArrayList<ProductoBean> alProductoBean = oProductoDao.getpage(iRpp, iPage, hmOrder, 1);
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oReplyBean = new ReplyBean(200, oGson.toJson(alProductoBean));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getpage method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }

        return oReplyBean;

    }

    public ReplyBean fill() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer number = Integer.parseInt(oRequest.getParameter("number"));
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            String[] desc1 = {"Herramienta", "Utensilio", "Palanca", "Manubrio", "Aparejo"};
            String[] desc2 = {" de", " para"};
            String[] desc3 = {" cortar", " lijar", " pulir", " repasar", " afilar"};

            String[] codigo = {"MN87FH", "9GJ5T6F", "NE5S78", "098DNF", "UT46SD"};
            String[] desc = {desc1[randomMath(desc1.length)] + desc2[randomMath(desc2.length)] + desc3[randomMath(desc3.length)],
                desc1[randomMath(desc1.length)] + desc2[randomMath(desc2.length)] + desc3[randomMath(desc3.length)],
                desc1[randomMath(desc1.length)] + desc2[randomMath(desc2.length)] + desc3[randomMath(desc3.length)],
                desc1[randomMath(desc1.length)] + desc2[randomMath(desc2.length)] + desc3[randomMath(desc3.length)],
                desc1[randomMath(desc1.length)] + desc2[randomMath(desc2.length)] + desc3[randomMath(desc3.length)]};
            Integer[] existencias = {67, 12, 89, 43, 124};
            Float[] precio = {45f, 89f, 123f, 854f, 58f};
            String[] foto = {"foto1", "foto2", "foto3", "foto4", "foto5"};
            int[] id_tipoProducto = {1,2,3,4};

            ProductoDao oProductoDao = new ProductoDao(oConnection, ob);
            ProductoBean oProductoBean = new ProductoBean();
            for (int i = 1; i <= number; i++) {
                oProductoBean.setCodigo(codigo[randomMath(codigo.length)]);
                oProductoBean.setDesc(desc[randomMath(desc.length)]);
                oProductoBean.setExistencias(existencias[randomMath(existencias.length)]);
                oProductoBean.setPrecio(precio[randomMath(precio.length)]);
                oProductoBean.setFoto(foto[randomMath(foto.length)]);
                oProductoBean.setId_tipoProducto(id_tipoProducto[randomMath(id_tipoProducto.length)]);
                oProductoBean = oProductoDao.create(oProductoBean);
            }
            oReplyBean = new ReplyBean(200, oGson.toJson(number));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: create method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;
    }

    private int randomMath(int number) {
        return (int) (Math.random() * number);
    }

}
