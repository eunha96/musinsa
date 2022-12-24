package musinsa.demoapi.controller;

import musinsa.demoapi.model.RewardInfoVO;
import musinsa.demoapi.model.UserInfoVO;
import musinsa.demoapi.repository.RewardRepository;
import musinsa.demoapi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/reward")
public class RewardController {
    @Autowired
    private RewardRepository rewardRepository;

    @Autowired
    private UserRepository userRepository;
    /**
     * GET
     * **/
    // 보상데이터를 조회하기 위한 API
    // 특정(단일) 데이터 조회이므로 path로 지정하여 조회
    @RequestMapping(method = RequestMethod.GET, path = "/rewardData/{id}")
    public Optional<RewardInfoVO> getRewardData(@PathVariable("id") String id){
        System.out.println("[rewardDataGetApi]"+ id);
        return rewardRepository.findById(id);
    }

    // 보상조회 API
    // 특정일자별 조회
    // 검색조건(날짜) / 정렬조건
    @RequestMapping(method = RequestMethod.GET, path = "/rewardUserList")  // 보상지급 조회
    public List<UserInfoVO> getRewardsUserList(@RequestParam(name = "date",required = true) String date,
                                          @RequestParam(name = "orderBy",defaultValue = "asc")String orderBy){
        System.out.println("[getRewardsUserList]"+ date +" "+ orderBy );
        if(orderBy.equalsIgnoreCase("desc")){
            return userRepository.findAllByDesc(date);
        }else{
            return userRepository.findAllByAsc(date);
        }
    }

    /**
     * POST
     * **/

    // 보상지급을 위한 API
    // 한 사용자는 하루에 1번만 가능, 10명이 넘을 경우 지급 불가
    // 멀티쓰레드
    @RequestMapping(method = RequestMethod.POST, path = "/postUserApi")
    public UserInfoVO postUserApi(@RequestBody UserInfoVO infoVO){
        System.out.println("[postUserApi] : POST"+ infoVO.toString());

        return userRepository.save(infoVO);
    }

    // 보상데이터를 저장하기 위한 API
    // 데이터는 단일 이므로 신규로 작성할경우 delete/insert
    @RequestMapping(method = RequestMethod.POST, path = "/postRewardApi")
    public RewardInfoVO postRewardApi(@RequestBody RewardInfoVO rewardInfoVO){
        System.out.println("[postRewardApi]: POST"+ rewardInfoVO.toString());
        return rewardRepository.save(rewardInfoVO);
    }

}