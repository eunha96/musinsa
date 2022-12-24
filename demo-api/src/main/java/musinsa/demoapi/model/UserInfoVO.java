package musinsa.demoapi.model;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "users")
public class UserInfoVO {
    @Id
    private String id;      // 유저아이디
    private String name;    // 유저이름
    private Integer point;  // 포인트
    @CreationTimestamp
    private LocalDateTime date;      // 보상날짜
}