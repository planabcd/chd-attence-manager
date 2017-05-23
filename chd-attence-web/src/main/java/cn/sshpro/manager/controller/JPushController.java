package cn.sshpro.manager.controller;

import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.PushPayload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by think on 2017/5/23.
 */
@Controller
@RequestMapping("/jpush")
public class JPushController {
    private Logger logger = LoggerFactory.getLogger(JPushController.class);

    @RequestMapping("testPush")
    @ResponseBody
    public String testPush(){
        JPushClient jpushClient = new JPushClient("32babb8273fe63f7ec0a3177", "c8c863619401311d253bb0d5", null, ClientConfig.getInstance());
        Map<String, String> req = new HashMap<String, String>();
        req.put("name","李白");
        req.put("course","古诗词鉴赏");
        // For push, all you need do is to build PushPayload object.
        PushPayload payload = JPushUtil.buildPushObject_android_tag_alertWithTitle("2013240402","点击进入考勤","你有未完成的考勤信息",req);

        try {
            PushResult result = jpushClient.sendPush(payload);

        } catch (APIConnectionException e) {
            // Connection error, should retry later
            logger.error("Connection error, should retry later", e);

        } catch (APIRequestException e) {
            // Should review the error, and fix the request
            logger.error("Should review the error, and fix the request", e);
            logger.info("HTTP Status: " + e.getStatus());
            logger.info("Error Code: " + e.getErrorCode());
            logger.info("Error Message: " + e.getErrorMessage());
        }
        return "success";
    }
}
