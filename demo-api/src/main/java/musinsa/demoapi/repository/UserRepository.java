package musinsa.demoapi.repository;

import musinsa.demoapi.model.UserInfoVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserInfoVO,String> {

    @Query(nativeQuery = true, value = "SELECT u.ID, u.NAME, u.POINT, u.DATE FROM mydb.users u WHERE DATE(u.date)= :date ORDER BY u.date DESC LIMIT 10")
    public List<UserInfoVO> findAllByDesc(@Param("date") String date  );

    @Query(nativeQuery = true, value = "SELECT u.ID, u.NAME, u.POINT, u.DATE FROM mydb.users u WHERE DATE(u.date)= :date ORDER BY u.date ASC LIMIT 10")
    public List<UserInfoVO> findAllByAsc(@Param("date") String date  );
}
