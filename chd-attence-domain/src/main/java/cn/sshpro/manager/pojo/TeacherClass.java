package cn.sshpro.manager.pojo;

/**
 * Created by liaoxin on 2017/4/10.
 */
public class TeacherClass extends BaseModel{
    private Integer classId;
    private Integer teacherId;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }
}
