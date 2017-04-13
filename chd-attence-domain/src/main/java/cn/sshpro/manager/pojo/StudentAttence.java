package cn.sshpro.manager.pojo;

/**
 * Created by liaoxin on 2017/4/10.
 */
public class StudentAttence extends BaseModel{
    private String name;
    private Long state;
    private Long studentId;
    private String gps;
    private Long courseId;
    private String wifi_top5;

    private Long id;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getGps() {
        return gps;
    }

    public void setGps(String gps) {
        this.gps = gps;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getWifi_top5() {
        return wifi_top5;
    }

    public void setWifi_top5(String wifi_top5) {
        this.wifi_top5 = wifi_top5;
    }
}
