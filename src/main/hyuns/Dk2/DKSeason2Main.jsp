<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    #evt_wrap {position: relative; height: 2396px; background: #07080a url('/resources/event/2022/0929_dk/images/bg.jpg') no-repeat center top; font-family: notoKr;}
    .evt_info_data {color: #fff; font-size: 16px;}
    .evt_inner {width: 1000px; margin: 0 auto;}
    .evt_box1_form {position: absolute; top: 595px; right: 0; left: 0; width: 777px;}
    .evt_form_box {overflow: hidden; margin-left: 25px;}
    .evt_form_box input {border: 0; width: 460px; height: 72px; background: transparent; float: left; box-sizing: border-box; color: #6a4c3d; font-size: 26px; font-family: notoKr; text-align: center;}
    .evt_list_pi > li {font-family: notoKr;}
    .evt_list_pi > li::before {display: inline-block; width: 4px; height: 4px; vertical-align: middle; margin-right: 3px; background-color: #c21c00; content: ''; border-radius: 50%;}
    .evt_list_pi > li:first-child::before {background-color: #616781;}
    input::placeholder {color: #6a4c3d;}
    input:-ms-input-placeholder {color: #6a4c3d;}
    .evt_btn_submit {border: 0; cursor: pointer; width: 280px; height: 75px;}
    .evt_form_check {cursor: pointer; vertical-align: top;}
    .evt_form_check > span {vertical-align: top; display: inline-block;}
    .evt_form_check .evt_ico_check { width: 18px; height: 18px; margin-right: 8px; box-sizing: border-box; border: 1px solid #281314; background-color: #fff;}
    .evt_form_check > input:checked + .evt_ico_check {background: #260c0c url(/resources/event/2022/0929_dk/images/ico_check.png) no-repeat center;}
    .evt_txt_check {font-size: 18px; color: #281314; font-family: notoKr;}
    .evt_btn_info_view {cursor: pointer; margin-top: -7px; margin-left: 5px; font-size: 16px; color: #fff; background-color: #281314; border-radius: 2px; border: 1px solid #000; width: 80px; height: 30px; text-align: center; vertical-align: top; font-family: notoKr;}
    .evt_pop_wrap {position: fixed; top: 0; right: 0; left: 0; bottom: 0; z-index: 1000; background-color: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center;}
    .evt_pop {width:480px; height:350px; background: url(/resources/event/2022/0929_dk/images/pop_bg.jpg) no-repeat; font-family: notoKr; position: relative;}
    .evt_pop_close {position: absolute; width: 47px; height: 47px; border: 0; cursor: pointer; top: 0; right: 0;}
    .evt_footer {background-color: #29221b;}
    .evt_footer .evt_inner {padding: 25px 0; font-family: notoKr;}
    .evt_notice_wrap .tit_notice {display: block; margin-bottom: 15px; font-size: 20px; font-weight: bold; color: #958c91;}
    .evt_notice_wrap .list_notice > li {color: #958c91; font-size: 13px; line-height: 1.8 !important; font-weight: 300;}
    .evt_notice_wrap .list_notice > li:before {display: inline-block; vertical-align: middle; width: 4px; height: 4px; border-radius: 50%; background-color: #958c91; margin-right: 10px; margin-top: -3px;  content: '';}
    .evt_notice_wrap .list_notice > li p {text-indent:14px;}
    .evt_copyright {padding: 18px 0; background-color: #322c25; text-align: center;}
    .evt_copyright > p {font-size: 12px; color: #958c91;}
    body.no_scroll {overflow-y: hidden; height: 100%;}
</style>
<script>
    $(document).ready(function(){

        /* 한번에 한 이벤트만 실행되도록 Lock을 만들어서 길을 막음. */
        var Lock = function() {
            this.L = false;
        };

        // 락 상태
        Lock.prototype.isLocked = function() {
            return this.L;
        };

        // 락 해제
        Lock.prototype.free = function() {
            return this.L = false;
        };

        // 락 시도
        Lock.prototype.tryLock = function() {
            if(this.isLocked()) {
                return false;
            } else {
                this.L = true;
                return true;
            }
        };

        // 클로저로 락을 생성
        Lock.withLock = function(fnc) {
            var newLock = new Lock();
            return fnc(newLock);
        };

        // 이벤트 관련 비즈니스 로직 시작(ready)
        // 이벤트 기간 확인(공통)
        Lock.withLock(function(lock) {
            requestAjaxGET("/evt/act/2022/0929_DKSeason2/DKSeason2/GetEvtPeriodCheck", {},
                function (data) {
                    switch (data.iReturn) {
                        case 0 :
                            break;
                        case -60002 :
                        case -60003 :
                            alert('이벤트가 종료되었습니다.');
                            document.location.href = '/main';
                            break;
                        default :
                            alert("죄송합니다.\n오류가 발생했습니다.\n고객센터(1644-3333)로 문의해주세요.\n 오류코드 : " + data.iReturn );
                            break;
                    }
                    lock.free();
                });
        });

        // 숫자만 입력 가능하도록 설정
        $("#mobileNumber").on('keyup', function () {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        });

        Lock.withLock(function(lock) {
            $('#btnReservation').on('click', function(){

                var RegExp = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
                var mobileNumber = $("#mobileNumber").val();

                if (mobileNumber == ""){
                    alert("휴대폰 번호를 입력해 주세요.");
                    $("#mobileNumber").focus();
                    return;
                }

                if(!RegExp.test(mobileNumber)){
                    alert("휴대폰 번호를 올바르게 입력해 주세요.");
                    $("#mobileNumber").focus();
                    return;
                }

                if($("#check_pi").is(":checked") !== true){
                    alert("개인정보 수집 및 이용에 동의 후 참여 가능합니다.");
                    return;
                }

                if (lock.tryLock()) {
                    requestAjaxGET("/evt/act/2022/0929_DKSeason2/DKSeason2/ApplyEvent",{"mobileNumber":encodeURIComponent(mobileNumber)} ,
                        function (data) {
                            switch (data.iReturn) {
                                case 0 :
                                    alert('<DK모바일 디오리진 시즌2> 사전예약에 참여 완료되었습니다.\n게임 오픈 당일 사전예약에 참여하신 휴대폰 번호로 출시 알람 LMS가 발송됩니다.');
                                    break;
                                case -60001 :
                                    alert('이벤트 기간이 아닙니다.');
                                    break;
                                case -60002 :
                                    alert('이미 참여하셨습니다.');
                                    break;
                                default :
                                    alert("죄송합니다.\n오류가 발생했습니다.\n고객센터(1644-3333)로 문의해주세요.\n 오류코드 : " + data.iReturn );
                                    break;
                            }
                                lock.free();
                                //window.location.reload();
                        });
                }
            })
        });
    });

    $(function(){
        $('.evt_btn_info_view').click(function(){
            $('.evt_pop_wrap').removeClass('hide');
        })
        $('.evt_pop_close').click(function(){
            $('.evt_pop_wrap').addClass('hide');
        })
    })
</script>
<div id="evt_wrap">
    <div class="evt_inner" style="text-align: right; padding-top: 18px; ">
        <p class="evt_info_data">이벤트 기간: ~ 출시일까지</p>
    </div>
    <!-- 예약 -->
    <div class="evt_inner evt_box1_form">
        <h1 class="blind">DK모바일 디 오리진 시즌 초기화</h1>
        <!-- 휴대폰번호 입력 -->
        <form class="evt_box_reserve">
            <h2 class="blind">사전예약 참여하고 누구보다 빠르게 육성하자! </h2>
            <div class="evt_form_box">
                <input type="text" placeholder="‘-’ 없이 휴대폰 번호를 입력하세요." maxlength="11" id="mobileNumber" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                <button class="evt_btn_submit" type="button" id="btnReservation"><span class="blind">사전예약하기</span></button>
            </div>
            <div style="text-align: center; margin-top: 35px;">
                <label for="check_pi" class="evt_form_check">
                    <input type="checkbox" name="check_pi" id="check_pi" class="blind">
                    <span class="evt_ico_check"></span>
                    <span class="evt_txt_check">개인정보 수집 및 이용에 동의합니다.</span>
                </label>
                <button class="evt_btn_info_view" type="button">전문보기</button>
            </div>
        </form>
    </div>

    <!-- 팝업 -->
    <div class="evt_pop_wrap hide">
        <div class="dimmed"></div>
        <div class="evt_pop">
            <div class="blind">
                개인정보 수집 및 이용안내
                (주)아이템베이는 이벤트 진행을 위해 아래와 같이 개인 정보 수집 및  취급 업무를 하며 본 목적 외 다른 목적으로 사용되지 않습니다.
                개인정보의 수집 및 이용
                수집 정보: 이동전화번호
                수집 목적: 게임 출시 이벤트 알림 문자발송, 상품 제공
                보유 기간: 이벤트 종료 직후 1개월 간 보관 후 삭제
                이에 동의하지 않는 경우 개인정보 제공을 거절할 수 있으며,  이벤트 참여가 제한됩니다.
            </div>
            <button type="button" class="evt_pop_close"><span class="blind">팝업닫기</span></button>
        </div>
    </div>
</div>
<!-- 이벤트 유의싸항 -->
<section class="evt_footer">
    <div class="evt_inner">
        <div class="evt_notice_wrap">
            <strong class="tit_notice">이벤트 유의사항</strong>
            <div>
                <ul class="list_notice">
                    <li>사전예약은 동일한 휴대폰 번호로 중복 참여할 수 없으며, 타인의 연락처 도용 시 모든 책임은 참여자 본인에게 있습니다.</li>
                    <li>쿠폰 패키지(인게임 육성패키지, 아이템베이 할인쿠폰)는  이벤트 종료 후 영업일 기준 5일 이내 참여하신 휴대폰 번호로 지급해 드립니다.  </li>
                    <li>할인쿠폰 패키지는 게임머니/아이템/기타 카테고리에서 사용 가능하며, 할인쿠폰 제한 금액은 아래와 같습니다.
                        <p>(ID 당 1회 발급) - 2,000원 > 40,000원 이상 / 3,000원 > 60,000원 이상 / 5,000원 > 100,000원 이상 거래 시 사용 가능 </p>
                    </li>
                    <li>본 이벤트는 내부 사정에 따라 사전 공지 없이 변경되거나 종료될 수 있습니다. </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<div class="evt_copyright tc">
    <p>&copy; itemBay Co., Ltd. All Rights Reserved.</p>
</div>