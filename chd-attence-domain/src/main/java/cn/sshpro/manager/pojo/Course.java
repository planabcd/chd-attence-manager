package cn.sshpro.manager.pojo;

import javax.persistence.Table;

/**
 * Created by liaoxin on 2017/4/10.
 */
@Table(name="course")
public class Course extends BaseModel{
      private String name;
      private String teacher;
      private Long teacherId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }
}
