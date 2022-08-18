# Flutter Voip24h-SDK 

[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dev/packages/flutter_call_test)

## Mục lục

- [Tính năng](#tính-năng)
- [Yêu cầu](#yêu-cầu)
- [Cài đặt](#cài-đặt)
- [Khai báo module](#khai-báo-module)
- [CallKit](#callkit)
- [Graph](#graph)

## Tính năng
| Chức năng | Mô tả |
| --------- | ----- |
| CallKit   | • Đăng nhập/Đăng xuất/Refresh kết nối tài khoản SIP <br> • Gọi đi/Nhận cuộc gọi đến <br> • Chấp nhận cuộc gọi/Từ chối cuộc gọi đến/Ngắt máy <br> • Pause/Resume cuộc gọi <br> • Hold/Unhold cuộc gọi <br> • Bật/Tắt mic <br> • Lấy trạng thái mic <br> • Bật/Tắt loa <br> • Lấy trạng thái loa <br> • Transfer cuộc gọi <br> • Send DTMF |
| Graph     | • Lấy access token <br> • Request API từ: https://docs-sdk.voip24h.vn/ |

## Yêu cầu
- OS Platform:
    - Android -> `minSdkVersion: 23`
    - IOS -> `iOS Deployment Target: 9.0`
- Permissions: khai báo và cấp quyền lúc runtime
    - Android: Trong file `AndroidManifest.xml`
        ```
        <uses-permission android:name="android.permission.`int`ERNET" />
        <uses-permission android:name="android.permission.RECORD_AUDIO"/>
        ```
        
    - IOS: Trong file `Info.plist`
        ```
        <key>NSAppTransportSecurity</key>
    	<dict>
    		<key>NSAllowsArbitraryLoads</key><true/>
    	</dict>
    	<key>NSMicrophoneUsageDescription</key>
	    <`String`>{Your permission microphone description}</`String`>
        ```

## Cài đặt
Sử dụng npm:
```bash
$ flutter pub add flutter_call_test
```
Linking module:
- IOS: 
    - Trong `ios/Podfile`:
        ```
        ...
        # Khai báo thư viện
        platform :ios, '9.0'
        source "https://gitlab.linphone.org/BC/public/podspec.git"

        target 'Your Project' do
            ...
            use_frameworks!
            use_modular_headers!

            flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))

            # Khai báo thư viện 
            pod 'linphone-sdk-novideo' , '5.1.36'
        end
        ```
    - Trong folder `ios` mở terminal, nhập dòng lệnh:
        ```bash
        $ rm -rf Pods/
        $ pod install
        ```

## Khai báo module
```
import 'package:flutter_voip24h_sdk/flutter_voip24h_sdk.dart';
import 'package:flutter_voip24h_sdk/callkit/utils/sip_event.dart';
import 'package:flutter_voip24h_sdk/callkit/utils/transport_type.dart';
import 'package:flutter_voip24h_sdk/graph/extensions/extensions.dart';
import 'package:flutter_voip24h_sdk/callkit/model/sip_configuration.dart';

// TODO: Using module
```

## CallKit

* ### Khai báo sipConfiguration:

    ```
    var sipConfiguration = SipConfigurationBuilder(extension: "1027", domain: "14.225.251.92", password: "Voip24h_1027")
                            .setKeepAlive(true/false) // optional
                            .setPort(5060) // optional
                            .setTransport(TransportType.Udp/TransportType.Tcp/TransportType.Tls) // optional
                            .build(); 
    ```


| <div style="text-align: center">Chức năng</div> | <div style="text-align: center">Phương thức và tham số <br> (Dùng cơ chế async/await hoặc then để lấy dữ liệu trả về)</div> | Kết quả trả về và thuộc tính |
| :--- | :--- | :---: |
| Khởi tạo | FlutterVoip24hSdk.callModule.initSipModule(sipConfiguration) | None |
| Lấy trạng thái đăng kí tài khoản SIP | FlutterVoip24hSdk.callModule.getSipRegistrationState() | value: `String` <br> error: `String` |
| Logout tài khoản SIP | FlutterVoip24hSdk.callModule.unregisterSipAccount() | value: `bool` <br> error: `String` |
| Refresh kết nối SIP | FlutterVoip24hSdk.callModule.refreshSipAccount() | value: `bool` <br> error: `String` |
| Gọi đi | FlutterVoip24hSdk.callModule.call(phoneNumber) | value: `bool` <br> error: `String` |
| Ngắt máy | FlutterVoip24hSdk.callModule.hangup() | value: `bool` <br> error: `String` |
| Chấp nhận cuộc gọi đến | FlutterVoip24hSdk.callModule.answer() | value: `bool` <br> error: `String` |
| Từ chối cuộc gọi đến | FlutterVoip24hSdk.callModule.reject() | value: `bool` <br> error: `String` |
| Transfer cuộc gọi | FlutterVoip24hSdk.callModule.transfer("extension") | value: `bool` <br> error: `String` |
| Lấy call id | FlutterVoip24hSdk.callModule.getCallId() | value: `String` <br> error: `String`   |
| Lấy số lượng cuộc gọi nhỡ | FlutterVoip24hSdk.callModule.getMissedCalls() | value: `int` <br> error: `String` |
| Pause cuộc gọi | FlutterVoip24hSdk.callModule.pause() | value: `bool` <br> error: `String` |
| Resume cuộc gọi | FlutterVoip24hSdk.callModule.resume() | value: `bool` <br> error: `String` |
| Bật/Tắt mic | FlutterVoip24hSdk.callModule.toggleMic() | value: `bool` <br> error: `String` |
| Trạng thái mic | FlutterVoip24hSdk.callModule.isMicEnabled() | value: `bool` <br> error: `String` |
| Bật/Tắt loa | FlutterVoip24hSdk.callModule.toggleSpeaker() | value: `bool` <br> error: `String` |
| Trạng thái loa | FlutterVoip24hSdk.callModule.isSpeakerEnabled() | value: `bool` <br> error: `String` |
| Send DTMF | FlutterVoip24hSdk.callModule.sendDTMF("number#") | value: `bool` <br> error: `String` |

* ### Event listener SIP:

    ```
    FlutterVoip24hSdk.callModule.eventStreamController.stream.listen((event) {
        switch (event['event']) {
            case SipEvent.AccountRegistrationStateChanged: {
                var body = event['body'];
                // TODO
            } break;
            case SipEvent.Ring: {
                // TODO
            } break;
            case ...
              break;
        }
    });
    ```

| <div style="text-align: left">Tên sự kiện</div> | <div style="text-align: left">Kết quả trả về và thuộc tính</div> | <div style="text-align: left">Đặc tả thuộc tính</div> |
| :--- | :--- | :--- |
| SipEvent.AccountRegistrationStateChanged | body = { <br>&emsp; registrationState: `String`, <br>&emsp; message: `String` <br> } | registrationState: trạng thái kết nối của sip (None/Progress/Ok/Cleared/Failed) <br> message: chuỗi mô tả trạng thái</div> |
| SipEvent.Ring | body = { <br>&emsp; extension: `String`, <br>&emsp; phoneNumber: `String` <br>&emsp; callType: `String` <br> } | extension: máy nhánh <br> phoneNumber: số điện thoại người (gọi/nhận) <br> callType: loại cuộc gọi(inbound/outbound) |
| SipEvent.Up | body = { <br>&emsp; callId: `String` <br> } | callId: mã cuộc gọi
| SipEvent.Hangup | body = { <br>&emsp; duration: `int` <br> } | duration: thời gian đàm thoại (milliseconds)
| SipEvent.Paused | None
| SipEvent.Resuming | None
| SipEvent.Missed | body = { <br>&emsp; phoneNumber: `String`, <br>&emsp; totalMissed: `int` <br> } | phone: số điện thoại người gọi <br> totalMissed: tổng cuộc gọi nhỡ
| SipEvent.Error | body = { <br>&emsp; message: `String` <br> } | message: trạng thái lỗi

## Graph
> • key và security certificate(secert) do `Voip24h` cung cấp
<br> • request api: phương thức, endpoint. data body tham khảo từ docs https://docs-sdk.voip24h.vn/

| <div style="text-aligns: center">Chức năng</div> | <div style="text-aligns: center">Phương thức</div> | <div style="text-aligns: center">Đặc tả tham số </div> | <div style="text-aligns: center">Kết quả trả về</div> | <div style="text-aligns: center">Đặc tả thuộc tính</div> |
| :--- | :--- | :--- | :--- | :--- |
| Lấy access token | FlutterVoip24hSdk.graphModule.getAccessToken(apiKey: API_KEY, apiSecert: API_SECERT) | • apiKey: ``String``, <br> • secert: ``String`` | value: `Oauth` <br> error: ``String`` | • Oauth: gồm các thuộc tính (token, createAt, expired, isLongAlive) <br> • error: thông báo lỗi |
| Request API | FlutterVoip24hSdk.graphModule.sendRequest(token: token, endpoint: endpoint, body: body) | • method: MethodRequest(MethodRequest.POST, MethodRequest.GET,...) <br> • endpoint: chuỗi cuối của URL request: "call/find", "call/findone",... <br> • token: access token <br> • params: data body dạng object như { "offset": "0", "limit": "25" } | value: `Map<`String`, dynamic>` <br> error: ``String`` | • value: kết quả response dạng key - value <br> • error: mã lỗi |
| Lấy data object | value.getData() <br> (Dạng extension function) | None | object: `Object` | object gồm các thuộc tính được mô tả ở dữ liệu trả về trong docs https://docs-sdk.voip24h.vn/ |
| Lấy danh sách data object | value.getDataList() <br> (Dạng extension function) |  | List`<Object>` | mỗi object gồm các thuộc tính được mô tả ở dữ liệu trả về trong docs https://docs-sdk.voip24h.vn/ |
| Lấy status code | value.statusCode() <br> (Dạng extension function) |  | `int` | mã trạng thái |
| Lấy message | value.message() <br> (Dạng extension function) |  | `String` | chuỗi mô tả trạng thái |
| Lấy limit | value.limit() <br> (Dạng extension function) |  | `int` | giới hạn dữ liệu của dữ liệu tìm được |
| Lấy offset | value.offset() <br> (Dạng extension function) |  | `int` | vị trí bắt đầu của dữ liệu tìm được |
| Lấy total | value.total() <br> (Dạng extension function) |  | `int` | tổng số lượng dữ liệu |
| Lấy kiểu sắp xếp | value.isSort() <br> (Dạng extension function) |  | `String` | kiểu sắp xếp dữ liệu |

## License
```
The MIT License (MIT)

Copyright (c) 2022 VOIP24H
w
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```