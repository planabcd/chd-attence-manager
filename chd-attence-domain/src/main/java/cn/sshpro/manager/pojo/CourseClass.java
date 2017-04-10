package cn.sshpro.manager.pojo;

/**
 * Created by liaoxin on 2017/4/10.
 */
public class CourseClass extends BaseModel{
    private Integer classId;
    private Integer courseId;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}
