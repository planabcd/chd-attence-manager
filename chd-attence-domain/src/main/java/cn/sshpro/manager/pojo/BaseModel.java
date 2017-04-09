package cn.sshpro.manager.pojo;

import java.util.Date;

/**
 * Created by liaoxin on 2017/4/6
 */
public abstract class BaseModel {
    private Date created;
    private Date updated;
    public Date getCreated() {
        return created;
    }
    public void setCreated(Date created) {
        this.created = created;
    }
    public Date getUpdated() {
        return updated;
    }
    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}
