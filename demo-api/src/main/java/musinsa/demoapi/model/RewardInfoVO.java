package musinsa.demoapi.model;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "reward")
public class RewardInfoVO {
    @Id
    private String id;      // 보상아이디
    private String title;    // 제목
    private String content;  // 내용
    private String content_detail;  // 내용2
    @CreationTimestamp
    private LocalDateTime date;      // 보상날짜
}