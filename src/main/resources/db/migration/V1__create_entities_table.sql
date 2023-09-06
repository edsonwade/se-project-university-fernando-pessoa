create TABLE tb_appointments
(
    appointment_id         BIGINT  NOT NULL AUTO_INCREMENT,
    student_student_id     BIGINT,
    explainer_explainer_id BIGINT,
    start_time             TIMESTAMP,
    end_time               TIMESTAMP,
    CONSTRAINT pk_tb_appointments PRIMARY KEY (appointment_id)
);

create TABLE tb_availabilitys
(
    availability_id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    day_of_week            INT,
    availability_start     time,
    availability_end       time,
    explainer_explainer_id BIGINT,
    CONSTRAINT pk_tb_availabilitys PRIMARY KEY (availability_id)
);

create TABLE tb_colleges
(
    college_id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name       VARCHAR(255),
    CONSTRAINT pk_tb_colleges PRIMARY KEY (college_id)
);

create TABLE tb_courses
(
    course_id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    course_name      VARCHAR(255),
    degree_degree_id BIGINT,
    CONSTRAINT pk_tb_courses PRIMARY KEY (course_id)
);

create TABLE tb_courses_explainers
(
    course_course_id        BIGINT NOT NULL,
    explainers_explainer_id BIGINT NOT NULL,
    CONSTRAINT pk_tb_courses_explainers PRIMARY KEY (course_course_id, explainers_explainer_id)
);

create TABLE tb_degrees
(
    degree_id          BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    degree_name        VARCHAR(255),
    college_college_id BIGINT,
    CONSTRAINT pk_tb_degrees PRIMARY KEY (degree_id)
);

create TABLE tb_explainers
(
    explainer_id   BIGINT  NOT NULL AUTO_INCREMENT,
    explainer_name VARCHAR(255),
    email          VARCHAR(40)                              NULL,

    CONSTRAINT pk_tb_explainers PRIMARY KEY (explainer_id)
);

create TABLE tb_explainers_courses
(
    explainer_explainer_id BIGINT NOT NULL,
    courses_course_id      BIGINT NOT NULL,
    CONSTRAINT pk_tb_explainers_courses PRIMARY KEY (explainer_explainer_id, courses_course_id)
);

create TABLE tb_languages
(
    language_id            BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    language_name          VARCHAR(11),
    explainer_explainer_id BIGINT,
    CONSTRAINT pk_tb_languages PRIMARY KEY (language_id)
);

create TABLE tb_students
(
    student_id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    student_name VARCHAR(255),
    email        VARCHAR(40)                              NULL,
    CONSTRAINT pk_tb_students PRIMARY KEY (student_id)
);

alter table tb_explainers
    add CONSTRAINT uc_tb_explainers_email UNIQUE (email);

alter table tb_students
    add CONSTRAINT uc_tb_students_email UNIQUE (email);

alter table tb_appointments
    add CONSTRAINT FK_TB_APPOINTMENTS_ON_EXPLAINER_EXPLAINER FOREIGN KEY (explainer_explainer_id) REFERENCES tb_explainers (explainer_id);

alter table tb_appointments
    add CONSTRAINT FK_TB_APPOINTMENTS_ON_STUDENT_STUDENT FOREIGN KEY (student_student_id) REFERENCES tb_students (student_id);

alter table tb_availabilitys
    add CONSTRAINT FK_TB_AVAILABILITYS_ON_EXPLAINER_EXPLAINER FOREIGN KEY (explainer_explainer_id) REFERENCES tb_explainers (explainer_id);

alter table tb_courses
    add CONSTRAINT FK_TB_COURSES_ON_DEGREE_DEGREE FOREIGN KEY (degree_degree_id) REFERENCES tb_degrees (degree_id);

alter table tb_degrees
    add CONSTRAINT FK_TB_DEGREES_ON_COLLEGE_COLLEGE FOREIGN KEY (college_college_id) REFERENCES tb_colleges (college_id);

alter table tb_languages
    add CONSTRAINT FK_TB_LANGUAGES_ON_EXPLAINER_EXPLAINER FOREIGN KEY (explainer_explainer_id) REFERENCES tb_explainers (explainer_id);

alter table tb_courses_explainers
    add CONSTRAINT fk_tbcouexp_on_course FOREIGN KEY (course_course_id) REFERENCES tb_courses (course_id);

alter table tb_courses_explainers
    add CONSTRAINT fk_tbcouexp_on_explainer FOREIGN KEY (explainers_explainer_id) REFERENCES tb_explainers (explainer_id);

alter table tb_explainers_courses
    add CONSTRAINT fk_tbexpcou_on_course FOREIGN KEY (courses_course_id) REFERENCES tb_courses (course_id);

alter table tb_explainers_courses
    add CONSTRAINT fk_tbexpcou_on_explainer FOREIGN KEY (explainer_explainer_id) REFERENCES tb_explainers (explainer_id);