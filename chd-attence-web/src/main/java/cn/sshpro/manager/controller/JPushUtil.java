package cn.sshpro.manager.controller;

import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;

import java.util.Map;

/**
 * Created by think on 2017/5/23.
 */
public class JPushUtil {
    public static PushPayload buildPushObject_android_tag_alertWithTitle(String tag, String alert, String title,Map<String,String> reqMap) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.tag(tag))
                .setNotification(Notification.android(alert, title, reqMap))
                .build();
    }

    /*public static PushPayload buildPushObject_android_tag_alertWithExtras(String tag, String alert, String title,String extra) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.tag(tag))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(AndroidNotification.newBuilder()
                                .setTitle(title)
                                .setAlert(alert)
                                .addExtra("extra", extra)
                                .build())
                        .build())
                .setOptions(Options.newBuilder()
                        .setApnsProduction(true)
                        .build())
                .build();
    }*/
}
