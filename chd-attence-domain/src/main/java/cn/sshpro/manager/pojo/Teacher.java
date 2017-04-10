package cn.sshpro.manager.pojo;

/**
 * Created by liaoxin on 2017/4/10.
 */
public class Teacher extends BaseModel {

    private Integer id;
    private String name;
    private String academy;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
