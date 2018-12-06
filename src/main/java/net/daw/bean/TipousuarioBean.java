package net.daw.bean;

import com.google.gson.annotations.Expose;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.daw.helper.EncodingHelper;

public class TipousuarioBean {
	
        @Expose
	private int id;
        @Expose
	private String desc;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
        
        public TipousuarioBean fill(ResultSet oResultSet, Connection oConnection) throws Exception {
        this.setId(oResultSet.getInt("id"));
        this.setDesc(oResultSet.getString("desc"));
        return this;
    }

    public String getColumns() {
        String strColumns = "";
        strColumns += "id,";
        strColumns += "tipousuario.desc";
        return strColumns;
    }

    public String getValues() {
        String strColumns = "";
        strColumns += "null,";
        strColumns += EncodingHelper.quotate(desc);
        return strColumns;
    }

    public String getPairs() {
        String strPairs = "";
        strPairs += "id=" + id + ",";
        strPairs += "tipousuario.desc=" + desc;
        strPairs += " WHERE id=" + id;
        return strPairs;
    }

}
