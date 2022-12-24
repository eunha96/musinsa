package musinsa.demoapi.repository;

import musinsa.demoapi.model.RewardInfoVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RewardRepository extends JpaRepository<RewardInfoVO,String> {

}
