package cn.sshpro.manager.pojo;

import javax.persistence.Table;

/**
 * Created by liaoxin on 2017/4/10.
 */
@Table(name="course_class")
public class CourseClass extends BaseModel{
    private Long classId;
    private Long courseId;

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }
}
