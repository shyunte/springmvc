<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
    /* 기본 css */
    .evt_wrap .evt_page {min-width:1000px}
    .evt_wrap .t_con {position: relative; margin: 0 auto; width: 1000px; height: 100%}
    .evt_wrap .bg {height:2704px; background:#15181d url("/resources/event/2022/1229_dk/images/bg.jpg") no-repeat 50% 0}
    .evt_con {position:relative; margin:0 auto; width:1000px; height:100%}
    .evt_wrap .none {width:1px; height:1px; font-size:0; line-height:0; position:absolute; top:0; left:-1000%; overflow:hidden}
    .evt_wrap input {background:none; border:none; box-sizing:border-box}
    .evt_footer {background-color: #2c2215}
    .evt_footer .evt_inner {width: 1000px; margin: 0 auto; padding: 25px 0; font-family: notoKR, sans-serif}
    .evt_notice_wrap .tit_notice {display: block; margin-bottom: 15px; font-size: 20px; font-weight: 500; line-height: 1.2}
    .evt_notice_wrap .tit_notice.tit_box {color: #fff}
    .evt_notice_wrap .list_notice li {position:relative; padding-left:10px; font-size: 13px; font-weight: 300; color: #fff; line-height: 1.65 !important}
    .evt_notice_wrap .list_notice li:before {position:absolute; top:9px; left:0; width: 4px; height: 4px; border-radius: 50%; background-color: #fff; vertical-align: middle; content: ''}
    .evt_copyright {padding: 18px 0; background-color: #19140d; text-align: center}
    .evt_copyright > p {font-size: 12px; color: #fff}

    .evt_wrap button {cursor: pointer}
    .evt_con .date {position: absolute; top: 422px; font-family: Malgun Gothic; font-size: 18px; color: #fff; display: flex; justify-content: center; width: 100%;}
    .evt_con .btn_package {position:absolute; top:2181px; left:98px; width:380px; height:65px}
    .evt_con .btn_discount {position:absolute; top:2348px; width:900px; height:160px}
    .evt_con .btn_discount {left:50px}
    .evt_wrap .btn_scroll {position:fixed; top:180px; left:50%; margin-left:520px; width:144px; height:315px; background:url('/resources/event/2022/1229_dk/images/img_scroll.png') 0 0 no-repeat}
    .evt_wrap .btn_scroll a:nth-of-type(1){display: block;width: 100%;height:96px;}
    .evt_wrap .btn_scroll a:nth-of-type(2){display: block;width: 100%;height:82px;}
    .evt_wrap .btn_scroll a:nth-of-type(3){display: block;width: 100%;height:129px;}

    .evt_notice_wrap .list_notice li em {font-style: normal; color: #ffb063}

    /* 룰렛 css */

    .slot-machine {
        color: white;
        margin: 0 auto;
        text-align: center;
        border: none;
        position: absolute;
        top: 728px;
        left: 295px;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        align-items: center;
        justify-content: center;
        -ms-flex-pack: center;
        /*padding: 0px 20px 0px 20px;*/
    }

    .slot-machine .slot-container::before {
        content: '';
        width: 25px;
        height: 35px;
        background: url('/resources/event/2022/1229_dk/images/slotLeft.png') 0 0 no-repeat;
        position: absolute;
        top: 100px;
        left: -12px;
    }
    .slot-machine .slot-container::after {
        content: '';
        width: 25px;
        height: 35px;
        background: url('/resources/event/2022/1229_dk/images/slotRight.png') 0 0 no-repeat;
        position: absolute;
        top: 100px;
        right: -12px;
    }

    .slot-machine .slot-container .reels + .reels {
        margin-left:15px;
    }

    .led {
        margin: 0 auto;
        padding-top: 1px;
        padding-bottom: 2px;
        width: 100%;
        margin-bottom: 0px;
    }

    #title {
        font-family: Permanent Marker;
        font-size: 100px;
        margin-bottom: 20px;
        margin-top: 0px;
        background: #3a435e;
        padding-top: 20px;
        padding-bottom: 0px;
        text-shadow: 0px 7px 2px rgba(0, 0, 0, 0.7);
    }

    .slot-container {
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        align-items: center;
        justify-content: center;
        -ms-flex-pack: center;
        margin-bottom: 30px;

    }

    .display {
        margin-bottom: 40px;
    }

    #result {
        margin: 0 auto;
        font-family: Bowlby One;
        background: rgb(37, 37, 37);
        height: auto;
        width: 270px;
        border: solid #000 5px;
        padding: 0px;
        box-sizing: border-box;
        font-weight: 100;
    }

    .reels {
        background: transparent;
        background-size: cover;
        background-position-y: -5px;
        width: 126px;
        height: 233px;
        overflow: hidden;
        position: relative;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        align-items: center;
        justify-content: center;
        -ms-flex-pack: center;
    }
    .reels.default {

    }
    .reels > img {
        display: none;
        width:71px;
    }
    .reels > img.on {
        display: block;
        /* min-width:100%; */
        position: absolute;
        z-index: 9;
        width: auto;
        max-width:78px;
        top: 33%;
        left: 20%;
    }

    .reels.on::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 10;
        /* background-color: #b5f49e29;	 */
        border-radius: 5px;
        /* box-shadow: inset 0 0 0px #76ff476e, inset 0 0 0px #76ff4773, inset 0 0 0px #76ff47, inset 0 0 5px #76ff475c, inset 0 0 5px #76ff47cc, inset 0 0 10px #76ff47, inset 0 0 10px #76ff47; */
        background: repeating-linear-gradient(
                -45deg,
                #76ff4717 0%,
                #76ff471f 7.14%,
                #76ff4714 14.28%,
                #76ff473d 21.42%,
                #76ff4736 28.56%,
                #76ff471a 35.7%,
                #76ff471f 42.84%,
                #76ff4714 50%
        );
        background-size: 600vw 600vw;
        -webkit-animation: 'slide' 10s infinite linear forwards;
        -webkit-text-fill-color: transparent;
    }

    .reels.on::after {
        position: absolute;
        content: '';
        top: calc(50% - 40px);
        left: calc(50% - 40px);
        width: 100px;
        height: 100px;
        border-radius: 50%;
        z-index: 10;
        /* animation: 'explosion' 0.5s ease-in-out;
        -webkit-animation: 'explosion' 0.3s ease-in-out; */
    }

    .reels img {
        width: 100%;
        position: relative;
        user-drag: none;
        -webkit-user-drag: none;
        user-select: none;
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }

    .reels.default::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 3;
        -webkit-animation: cardshine 2s ease-in-out infinite;
        animation: cardshine 2s ease-in-out infinite;
        pointer-events: none;
    }

    .reels.default::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 14;
        -webkit-animation: cardshine 2s ease-in-out infinite;
        animation: cardshine 2s ease-in-out infinite;
        pointer-events: none;
    }

    /* 폭죽태그 */
    .pyro {
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        margin: auto;
        width: 100%;
        height: 100%;
    }

    .pyro > .before,
    .pyro > .after {
        position: absolute;
        z-index: 11;
        z-index: 11;
        width: 4px;
        height: 4px;
        margin: auto;
        bottom: 0;
        left: 0;
        right: 0;
        top: 0;
        border-radius: 50%;
        box-shadow: 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff,
        0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff,
        0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff,
        0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff,
        0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff;
        -moz-animation: 1s bang ease-out backwards,
        1s gravity ease-out backwards;
        -webkit-animation: 1s bang ease-out backwards,
        1s gravity ease-out backwards;
        -o-animation: 1s bang ease-out backwards, 1s gravity ease-out backwards;
        -ms-animation: 1s bang ease-out backwards, 1s gravity ease-out backwards;
        animation: 1s bang ease-out backwards, 1s gravity ease-out backwards;
    }

    /* 버튼 */
    .slotMachinePrev {
        width: 200px;
        padding: 10px;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: center;
        margin: 40px auto 0;
        color: #000;
        text-decoration: none;
        background: #fff;
        flex-direction: column;
        -webkit-box-orient: vertical;
        -ms-flex-direction: column;
        justify-content: center;
        text-align: center;
        position: absolute;
        top: 800px;
        left: 50%;
        transform: translate(-50%, 0);
    }
    .slotMachineStarting {
        width: 575px;
        height: 129px;
        background:url("/resources/event/2022/1229_dk/images/btStart.png");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        padding: 10px;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        color: #000;
        text-decoration: none;
        flex-direction: column;
        -webkit-box-orient: vertical;
        -ms-flex-direction: column;
        justify-content: center;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        text-align: center;
        position: absolute;
        top: 1174px;
        left: 50%;
        transform: translate(-50%, 0);
    }
    .slotMachineStarting:hover {
        background:url("/resources/event/2022/1229_dk/images/btHover.png");
        background-size: 100% 100%;
        background-repeat: no-repeat;
    }
    /* .slotMachineStarting:active {
        background:url("/resources/event/2022/1229_dk/images/btClick.png");
        background-position: bottom;
        background-repeat: no-repeat;
    } */
    .evtPop .slotMachineStarting {
        width: auto;
        display: inline-block;
        margin: 0;
        padding: 0;
        position: relative;
        top: auto;
        left: auto;
        transform: unset;
    }

    .slotMachineStarting.disabled {
        pointer-events: none;
        cursor: default;
        background-image:url("/resources/event/2022/1229_dk/images/btClick.png");
        background-position:bottom;
        background-repeat:no-repeat;
        color: rgb(76, 76, 76);
    }

    /* 이벤트팝업 */
    .evtPop.build {
        display: none;
        position: absolute;
        left: 50%;
        transform: translate(-50%, 0);
        top: 90px;
        width: 515px;
        height: 746px;
        /* background: url(images/pop_bg.jpg) no-repeat; */
        background: #ccc;
        z-index: 9999;
    }
    .evtPop.build > div {
        position: absolute;
        left: 22px;
        top: 25px;
        width: 471px;
        height: 698px;
    }
    .evtPop.build .btn.close {
        left: 69px;
        top: 570px;
        width: 333px;
        height: 121px;
        /* background: url(images/pop_btn.png) no-repeat; */
        background: #eee;
        z-index: 9999;
        color: #000;
    }

    @keyframes flickerAnimation {
        0% {
            opacity: 1;
        }
        50% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    /* 섬광 */
    @-webkit-keyframes explosion {
        0% {
            box-shadow: 0 0 130px 110px #fff, 0 0 150px 130px #fff,
            0 0 170px 160px #fff;
            background-color: #fff;
        }
        /* 450% {
            box-shadow: 0 0 160px 130px #fff, 0 0 1100px 160px #fff,
            0 0 1140px 190px #fff;
            background-color: #fff;
        } */
        50% {
            box-shadow: 0 0 260px 230px #fff, 0 0 1100px 260px #fff,
            0 0 1140px 290px #fff;
            background-color: #fff;
        }
        100% {
            box-shadow: 0 0 1160px 1130px #fff, 0 0 1100px 1160px #fff,
            0 0 1140px 1190px #fff;
            background-color: #fff;
        }
    }
    @keyframes explosion {
        0% {
            box-shadow: 0 0 130px 110px #fff, 0 0 150px 130px #fff,
            0 0 170px 160px #fff;
            background-color: #fff;
        }
        /* 450% {
            box-shadow: 0 0 160px 130px #fff, 0 0 1100px 160px #fff,
            0 0 1140px 190px #fff;
            background-color: #fff;
        } */
        50% {
            box-shadow: 0 0 260px 230px #fff, 0 0 1100px 260px #fff,
            0 0 1140px 290px #fff;
            background-color: #fff;
        }
        100% {
            box-shadow: 0 0 1160px 1130px #fff, 0 0 1100px 1160px #fff,
            0 0 1140px 1190px #fff;
            background-color: #fff;
        }
    }

    /* 폭죽 */
    @-webkit-keyframes bang {
        to {
            box-shadow: -199px 82.3333333333px #fff, 179px -338.6666666667px #fff,
            -26px -299.6666666667px #fff, 79px -153.6666666667px #fff,
            114px -222.6666666667px #fff, -126px -264.6666666667px #fff,
            -238px -205.6666666667px #fff, -209px -178.6666666667px #fff,
            25px -154.6666666667px #fff, 138px -103.6666666667px #fff,
            90px -165.6666666667px #fff, 75px -135.6666666667px #fff,
            -39px 25.3333333333px #fff, -44px -192.6666666667px #fff,
            -231px -40.6666666667px #fff, -222px -82.6666666667px #fff,
            250px 11.3333333333px #fff, -20px -162.6666666667px #fff,
            247px -240.6666666667px #fff, 185px -217.6666666667px #fff,
            159px 13.3333333333px #fff, -8px -406.6666666667px #fff,
            -124px -174.6666666667px #fff, 106px -77.6666666667px #fff,
            17px -399.6666666667px #fff, -40px -142.6666666667px #fff,
            -223px -12.6666666667px #fff, -163px 72.3333333333px #fff,
            2px 1.3333333333px #fff, -7px -115.6666666667px #fff,
            76px -380.6666666667px #fff, 105px -120.6666666667px #fff,
            -208px -90.6666666667px #fff, 213px -129.6666666667px #fff,
            81px -306.6666666667px #fff, 24px -246.6666666667px #fff,
            -58px -224.6666666667px #fff, 243px -63.6666666667px #fff,
            -145px 68.3333333333px #fff, -203px -263.6666666667px #fff,
            -5px -307.6666666667px #fff, -112px -6.6666666667px #fff,
            -182px -2.6666666667px #fff, 233px -231.6666666667px #fff,
            -171px -247.6666666667px #fff, -53px -410.6666666667px #fff,
            -177px 63.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff;
        }
    }
    @-moz-keyframes bang {
        to {
            box-shadow: -199px 82.3333333333px #fff, 179px -338.6666666667px #fff,
            -26px -299.6666666667px #fff, 79px -153.6666666667px #fff,
            114px -222.6666666667px #fff, -126px -264.6666666667px #fff,
            -238px -205.6666666667px #fff, -209px -178.6666666667px #fff,
            25px -154.6666666667px #fff, 138px -103.6666666667px #fff,
            90px -165.6666666667px #fff, 75px -135.6666666667px #fff,
            -39px 25.3333333333px #fff, -44px -192.6666666667px #fff,
            -231px -40.6666666667px #fff, -222px -82.6666666667px #fff,
            250px 11.3333333333px #fff, -20px -162.6666666667px #fff,
            247px -240.6666666667px #fff, 185px -217.6666666667px #fff,
            159px 13.3333333333px #fff, -8px -406.6666666667px #fff,
            -124px -174.6666666667px #fff, 106px -77.6666666667px #fff,
            17px -399.6666666667px #fff, -40px -142.6666666667px #fff,
            -223px -12.6666666667px #fff, -163px 72.3333333333px #fff,
            2px 1.3333333333px #fff, -7px -115.6666666667px #fff,
            76px -380.6666666667px #fff, 105px -120.6666666667px #fff,
            -208px -90.6666666667px #fff, 213px -129.6666666667px #fff,
            81px -306.6666666667px #fff, 24px -246.6666666667px #fff,
            -58px -224.6666666667px #fff, 243px -63.6666666667px #fff,
            -145px 68.3333333333px #fff, -203px -263.6666666667px #fff,
            -5px -307.6666666667px #fff, -112px -6.6666666667px #fff,
            -182px -2.6666666667px #fff, 233px -231.6666666667px #fff,
            -171px -247.6666666667px #fff, -53px -410.6666666667px #fff,
            -177px 63.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff;
        }
    }
    @-o-keyframes bang {
        to {
            box-shadow: -199px 82.3333333333px #fff, 179px -338.6666666667px #fff,
            -26px -299.6666666667px #fff, 79px -153.6666666667px #fff,
            114px -222.6666666667px #fff, -126px -264.6666666667px #fff,
            -238px -205.6666666667px #fff, -209px -178.6666666667px #fff,
            25px -154.6666666667px #fff, 138px -103.6666666667px #fff,
            90px -165.6666666667px #fff, 75px -135.6666666667px #fff,
            -39px 25.3333333333px #fff, -44px -192.6666666667px #fff,
            -231px -40.6666666667px #fff, -222px -82.6666666667px #fff,
            250px 11.3333333333px #fff, -20px -162.6666666667px #fff,
            247px -240.6666666667px #fff, 185px -217.6666666667px #fff,
            159px 13.3333333333px #fff, -8px -406.6666666667px #fff,
            -124px -174.6666666667px #fff, 106px -77.6666666667px #fff,
            17px -399.6666666667px #fff, -40px -142.6666666667px #fff,
            -223px -12.6666666667px #fff, -163px 72.3333333333px #fff,
            2px 1.3333333333px #fff, -7px -115.6666666667px #fff,
            76px -380.6666666667px #fff, 105px -120.6666666667px #fff,
            -208px -90.6666666667px #fff, 213px -129.6666666667px #fff,
            81px -306.6666666667px #fff, 24px -246.6666666667px #fff,
            -58px -224.6666666667px #fff, 243px -63.6666666667px #fff,
            -145px 68.3333333333px #fff, -203px -263.6666666667px #fff,
            -5px -307.6666666667px #fff, -112px -6.6666666667px #fff,
            -182px -2.6666666667px #fff, 233px -231.6666666667px #fff,
            -171px -247.6666666667px #fff, -53px -410.6666666667px #fff,
            -177px 63.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff;
        }
    }
    @-ms-keyframes bang {
        to {
            box-shadow: -199px 82.3333333333px #fff, 179px -338.6666666667px #fff,
            -26px -299.6666666667px #fff, 79px -153.6666666667px #fff,
            114px -222.6666666667px #fff, -126px -264.6666666667px #fff,
            -238px -205.6666666667px #fff, -209px -178.6666666667px #fff,
            25px -154.6666666667px #fff, 138px -103.6666666667px #fff,
            90px -165.6666666667px #fff, 75px -135.6666666667px #fff,
            -39px 25.3333333333px #fff, -44px -192.6666666667px #fff,
            -231px -40.6666666667px #fff, -222px -82.6666666667px #fff,
            250px 11.3333333333px #fff, -20px -162.6666666667px #fff,
            247px -240.6666666667px #fff, 185px -217.6666666667px #fff,
            159px 13.3333333333px #fff, -8px -406.6666666667px #fff,
            -124px -174.6666666667px #fff, 106px -77.6666666667px #fff,
            17px -399.6666666667px #fff, -40px -142.6666666667px #fff,
            -223px -12.6666666667px #fff, -163px 72.3333333333px #fff,
            2px 1.3333333333px #fff, -7px -115.6666666667px #fff,
            76px -380.6666666667px #fff, 105px -120.6666666667px #fff,
            -208px -90.6666666667px #fff, 213px -129.6666666667px #fff,
            81px -306.6666666667px #fff, 24px -246.6666666667px #fff,
            -58px -224.6666666667px #fff, 243px -63.6666666667px #fff,
            -145px 68.3333333333px #fff, -203px -263.6666666667px #fff,
            -5px -307.6666666667px #fff, -112px -6.6666666667px #fff,
            -182px -2.6666666667px #fff, 233px -231.6666666667px #fff,
            -171px -247.6666666667px #fff, -53px -410.6666666667px #fff,
            -177px 63.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff;
        }
    }
    @keyframes bang {
        to {
            box-shadow: -199px 82.3333333333px #fff, 179px -338.6666666667px #fff,
            -26px -299.6666666667px #fff, 79px -153.6666666667px #fff,
            114px -222.6666666667px #fff, -126px -264.6666666667px #fff,
            -238px -205.6666666667px #fff, -209px -178.6666666667px #fff,
            25px -154.6666666667px #fff, 138px -103.6666666667px #fff,
            90px -165.6666666667px #fff, 75px -135.6666666667px #fff,
            -39px 25.3333333333px #fff, -44px -192.6666666667px #fff,
            -231px -40.6666666667px #fff, -222px -82.6666666667px #fff,
            250px 11.3333333333px #fff, -20px -162.6666666667px #fff,
            247px -240.6666666667px #fff, 185px -217.6666666667px #fff,
            159px 13.3333333333px #fff, -8px -406.6666666667px #fff,
            -124px -174.6666666667px #fff, 106px -77.6666666667px #fff,
            17px -399.6666666667px #fff, -40px -142.6666666667px #fff,
            -223px -12.6666666667px #fff, -163px 72.3333333333px #fff,
            2px 1.3333333333px #fff, -7px -115.6666666667px #fff,
            76px -380.6666666667px #fff, 105px -120.6666666667px #fff,
            -208px -90.6666666667px #fff, 213px -129.6666666667px #fff,
            81px -306.6666666667px #fff, 24px -246.6666666667px #fff,
            -58px -224.6666666667px #fff, 243px -63.6666666667px #fff,
            -145px 68.3333333333px #fff, -203px -263.6666666667px #fff,
            -5px -307.6666666667px #fff, -112px -6.6666666667px #fff,
            -182px -2.6666666667px #fff, 233px -231.6666666667px #fff,
            -171px -247.6666666667px #fff, -53px -410.6666666667px #fff,
            -177px 63.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff, 166px 0.3333333333px #fff,
            -153px 54.3333333333px #fff, 233px 47.3333333333px #fff,
            41px 47.3333333333px #fff;
        }
    }
    @-webkit-keyframes gravity {
        to {
            transform: translateY(100px);
            -moz-transform: translateY(100px);
            -webkit-transform: translateY(100px);
            -o-transform: translateY(100px);
            -ms-transform: translateY(100px);
            opacity: 0;
        }
    }
    @-moz-keyframes gravity {
        to {
            transform: translateY(100px);
            -moz-transform: translateY(100px);
            -webkit-transform: translateY(100px);
            -o-transform: translateY(100px);
            -ms-transform: translateY(100px);
            opacity: 0;
        }
    }
    @-o-keyframes gravity {
        to {
            transform: translateY(100px);
            -moz-transform: translateY(100px);
            -webkit-transform: translateY(100px);
            -o-transform: translateY(100px);
            -ms-transform: translateY(100px);
            opacity: 0;
        }
    }
    @-ms-keyframes gravity {
        to {
            transform: translateY(100px);
            -moz-transform: translateY(100px);
            -webkit-transform: translateY(100px);
            -o-transform: translateY(100px);
            -ms-transform: translateY(100px);
            opacity: 0;
        }
    }
    @keyframes gravity {
        to {
            transform: translateY(100px);
            -moz-transform: translateY(100px);
            -webkit-transform: translateY(100px);
            -o-transform: translateY(100px);
            -ms-transform: translateY(100px);
            opacity: 0;
        }
    }


    /* 기본카드 빛 */
    @-webkit-keyframes cardshine {
        0%,
        79.9% {
            opacity: 0;
        }
        80% {
            opacity: 0.2;
            background-repeat: no-repeat;
            background-image: -webkit-linear-gradient(
                    top left,
                    rgba(255, 255, 255, 0) 0%,
                    rgba(255, 255, 255, 0) 45%,
                    rgba(255, 255, 255, 0.5) 48%,
                    rgba(255, 255, 255, 0.8) 50%,
                    rgba(255, 255, 255, 0.5) 52%,
                    rgba(255, 255, 255, 0) 57%,
                    rgba(255, 255, 255, 0) 100%
            );
            background-position: -520px -774px;
            background-size: 1350px 1350px;
        }
        100% {
            opacity: 1;
            background-repeat: no-repeat;
            background-position: 520px 774px;
        }
    }
    @keyframes cardshine {
        0%,
        79.9% {
            opacity: 0;
        }
        80% {
            opacity: 0.2;
            background-repeat: no-repeat;
            background-image: -webkit-linear-gradient(
                    top left,
                    rgba(255, 255, 255, 0) 0%,
                    rgba(255, 255, 255, 0) 45%,
                    rgba(255, 255, 255, 0.5) 48%,
                    rgba(255, 255, 255, 0.8) 50%,
                    rgba(255, 255, 255, 0.5) 52%,
                    rgba(255, 255, 255, 0) 57%,
                    rgba(255, 255, 255, 0) 100%
            );
            background-position: -520px -774px;
            background-size: 1350px 1350px;
        }
        100% {
            opacity: 1;
            background-repeat: no-repeat;
            background-position: 520px 774px;
        }
    }

    .blur {
        -webkit-animation: flickerAnimation 0.5s infinite;
        -moz-animation: flickerAnimation 0.5s infinite;
        -o-animation: flickerAnimation 0.5s infinite;
        animation: flickerAnimation 0.05s infinite;
        filter: blur(4px);
        -webkit-filter: blur(4px);
    }

    .shake {
        animation: shake 0.2s cubic-bezier(0.36, 0.07, 0.19, 0.97) both;
        transform: translate3d(0, 0, 0);
    }

    @keyframes shake {
        10%,
        90% {
            transform: translate3d(0, 0px, 0);
        }

        20%,
        80% {
            transform: translate3d(0, 10px, 0);
        }

        30%,
        50%,
        70% {
            transform: translate3d(0, -16px, 0);
        }

        40%,
        60% {
            transform: translate3d(0, 0px, 0);
        }
    }

    .top {
        animation: top 0.05s cubic-bezier(0.36, 0.07, 0.19, 0.97) infinite;
        transform: translate3d(0, 0, 0);
        position: relative;
    }

    @keyframes top {
        10%,
        90% {
            transform: translate3d(0, 0px, 0);
        }

        20%,
        80% {
            transform: translate3d(0, 100px, 0);
        }

        30%,
        50%,
        70% {
            transform: translate3d(0, -100px, 0);
        }

        40%,
        60% {
            transform: translate3d(0, 0px, 0);
        }
    }

    .top2 {
        animation: top2 0.12s cubic-bezier(0.36, 0.07, 0.19, 0.97) infinite;
        transform: translate3d(0, 0, 0);
        position: relative;
    }

    @keyframes top2 {
        10%,
        90% {
            transform: translate3d(0, 0px, 0);
        }

        20%,
        80% {
            transform: translate3d(0, -100px, 0);
        }

        30%,
        50%,
        70% {
            transform: translate3d(0, 100px, 0);
        }

        40%,
        60% {
            transform: translate3d(0, 0px, 0);
        }
    }

    .top3 {
        animation: top3 0.13s cubic-bezier(0.36, 0.07, 0.19, 0.97) infinite;
        transform: translate3d(0, 0, 0);
        position: relative;
    }

    @keyframes top3 {
        10%,
        90% {
            transform: translate3d(0, 0px, 0);
        }

        20%,
        80% {
            transform: translate3d(0, 100px, 0);
        }

        30%,
        50%,
        70% {
            transform: translate3d(0, -100px, 0);
        }

        40%,
        60% {
            transform: translate3d(0, 0px, 0);
        }
    }

    .button {
        margin: 0 auto;
        width: 90%;
        text-align: left;
    }

    button {
        background: #fff;
        color: #000;
        padding: 2px;
        width: 200px;
        outline: none;
        border: none;
        font-size: 30px;
        box-shadow: 0px 4px 1px 0px rgba(0, 0, 0, 0.75);
        font-family: Permanent Marker;
        float: left;
        margin-right: 80px;

        margin-top: 4px;
        cursor: pointer;
    }

    #span {
        text-align: center;
        width: 190px;
        float: left;
        padding: 2px;
        padding-top: 0px;
        padding-bottom: 3px;
        font-family: Permanent Marker;
        font-size: 45px;
    }

    button:active {
        background: #000000;
        color: #fff;
    }

    #credits {
        font-family: Bowlby One;
        background: rgb(37, 37, 37);
        float: right;
        text-align: right;
        color: #fff;
        height: auto;
        font-size: 35px;
        margin-top: 4px;
        width: 200px;
        padding-right: 9px;
        border: solid black 5px;
    }

    .list {padding:0; margin:0;position: relative;top: 0;width: 100%;justify-items: end; display: -webkit-box;
        display: -ms-flexbox;display: flex; flex-direction: column-reverse; visibility: hidden;}


    .list li {
        background: url('/resources/event/2022/1229_dk/images/css_sprites_vertical3.png');
        /* background-size: 540px 6352px; */
        background-size: cover;
        background-repeat: no-repeat;
        min-height:115px;position: relative;
    }
    .list li[data-roll='1'] {
        background-position: 0 0%;
    }
    .list li[data-roll='2'] {
        background-position: 0 20%;
    }
    .list li[data-roll='3'] {
        background-position: 0 40%;
    }
    .list li[data-roll='4'] {
        background-position: 0 60%;
    }
    .list li[data-roll='5'] {
        background-position: 0 80%;
    }
    .list li[data-roll='6'] {
        background-position: 0 100%;
    }

    .fCount {color: #fdf8c9;position: absolute;font-size: 52px;top: 580px;right: 375px;text-align: right;letter-spacing: -2px;font-family: Malgun Gothic;}
    .triggerOff {position: absolute; top: 730px; right: 105px;}
    .triggerOn {position: absolute; top: 900px; right: 105px;}
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
        $('.triggerOn').hide();
        $('.triggerOff').show();

        // 보유 플로린 조회
        getApplyStatus();

        // 슬롯머신 돌리기
        Lock.withLock(function(lock) {
            $('#getSlotMachine').on('click', function() {
                if (loginCheck() && lock.tryLock()) {
                    requestAjaxGET("/evt/act/2022/1229_DKSeason3/DKSeason3/SetApplySlotMachine", {},
                        function(data) {
                            switch (data.iReturn) {
                                case 1 :
                                case 2 :
                                case 3 :
                                case 4 :
                                case 5 :
                                case 6 :
                                    var iGift = data.iReturn;
                                    machineStart(iGift);
                                    break;
                                case -60001 :
                                    alert('플로린 코인이 부족합니다.');
                                    break;
                                case -60002 :
                                    alert('이벤트 기간이 아닙니다.');
                                    break;
                                case -60003 :
                                    alert('내일 참여 가능합니다.');
                                    break;
                                default :
                                    alert("죄송합니다.\n오류가 발생했습니다.\n고객센터(1644-3333)로 문의해주세요.\n 오류코드 : " + data.iReturn);
                                    break;
                            }
                            lock.free();
                        });
                }
            })
        });

        // 베이 패키지 받기
        Lock.withLock(function(lock) {
            $('#bayPackage').on('click', function() {
                if (loginCheck() && lock.tryLock()) {
                    requestAjaxGET("/evt/act/2022/1229_DKSeason3/DKSeason3/SetGiftPackage", {},
                        function(data) {
                            switch (data.iReturn) {
                                case 0 :
                                    alert('할인 쿠폰 패키지 지급이 완료되었습니다.');
                                    break;
                                case -60001 :
                                    alert('이미 참여 완료 했습니다.');
                                    break;
                                case -60002 :
                                    alert('이벤트 기간이 아닙니다.');
                                    break;
                                default :
                                    alert("죄송합니다.\n오류가 발생했습니다.\n고객센터(1644-3333)로 문의해주세요.\n 오류코드 : " + data.iReturn);
                                    break;
                            }
                            lock.free();
                        });
                }
            })
        });
    });

    function isNotLogined() {
        return '${isLogin}' == '' || '${session.MemberID}' == '';
    };

    // 로그인 확인
    function loginCheck(){
        if(isNotLogined()) {
            alert("로그인 후 이용 가능합니다.");
            document.location.href = "/login/loginAdult?returnUrl=" + encodeURI(document.location.href);
            globalOpen('.pop_login_check',0,true);
            return false;
        }else{
            return true;
        }
    };

    //슬롯 이미지
    var game1 = {img : '/resources/event/2022/1229_dk/images/gameItem_6.png', title: '파워존 24시간이 지급되었습니다.'},
        game2 = {img : '/resources/event/2022/1229_dk/images/gameItem_3.png', title: '체력 증강의 주문서x10 당첨 운영자 메시지를 확인해 주세요.'},
        game3 = {img : '/resources/event/2022/1229_dk/images/gameItem_4.png', title: '루멘의 완력 주문서x10 당첨 운영자 메시지를 확인해 주세요.'},
        game4 = {img : '/resources/event/2022/1229_dk/images/gameItem_5.png', title: '공격형 마력탄x500 당첨 운영자 메시지를 확인해 주세요.'},
        game5 = {img : '/resources/event/2022/1229_dk/images/gameItem_1.png', title: '디오네의 축복 물약x10 당첨 운영자 메시지를 확인해 주세요.'},
        game6 = {img : '/resources/event/2022/1229_dk/images/gameItem_2.png', title: '베나의 축복 주문서x10 당첨 운영자 메시지를 확인해 주세요.'};

    //롤링 시간
    var showRoolet1 = 140;
    var showRoolet2 = 280;
    var showRoolet3 = 400;

    //이미지 배열
    var arr = [game1, game2, game3, game4, game5, game6];

    var getApplyStatus = function () {
        requestAjaxGET("/evt/act/2022/1229_DKSeason3/DKSeason3/GetApplyStatus",{} ,
        function (data) {
                if (isNotLogined()) {
                    $("#florin").text("999");
                } else {

                    var iFlorin = data.iFlorin;

                    if (iFlorin.toString().length > 3) {
                        $("#florin").text("999");
                    } else {
                        $("#florin").text(iFlorin);
                    }
                }
            });
    };

    var machineStart = function (iGift) {

        getApplyStatus();

        $('.triggerOff').hide();
        $('.triggerOn').show();

        resetSlot();
        $('.reels').find('img');
        $('.slotMachineStarting').addClass('disabled');
        $('.btn_package').css('display', 'none');
        $('img').removeClass('shake');
        $('.reels').removeClass('default');
        $('.list').show();

        // 첫번째 릴
        setTimeout(function () {
            spinRoolet($('#slotA'), showRoolet1);

            var reelA = $('#rollerA');

            reelA.removeClass('on');

            var counterA = 0;
            var setIntervalIdA = setInterval(function () {
                counterA++;
                if (counterA === showRoolet1) {
                    //회전 멈추는 시점
                    $(reelA).attr('src', arr[iGift - 1].img);
                    clearInterval(setIntervalIdA);
                    //현재 이미지 보여주는 시점
                    $('#rollerA').removeClass('blur');
                    $('#rollerA').addClass('shake on');
                    $('#slotA').addClass('on');
                    $('#slotA').find('.list').css('visibility', 'hidden');
                    $('#rollerA').removeClass('top2');
                    bang($('#slotA'));
                    return;
                }
            }, 10);
        }, 1);

        // 두번째 릴
        setTimeout(function () {
            spinRoolet($('#slotB'), showRoolet2);

            var reelB = $('#rollerB');

            reelB.removeClass('on');

            var counterB = 0;
            var setIntervalIdB = setInterval(function () {
                counterB++;

                if (counterB === showRoolet2) {
                    $(reelB).attr('src', arr[iGift - 1].img);
                    clearInterval(setIntervalIdB);
                    //현재 이미지 보여주는 시점
                    $('#rollerB').removeClass('blur');
                    $('#rollerB').addClass('shake on');
                    $('#slotB').addClass('on');
                    $('#slotB').find('.list').css('visibility', 'hidden');
                    $('#rollerB').removeClass('top2');
                    bang($('#slotB'));
                    return;
                }
            }, 7);
        }, 250);

        // 세번째 릴
        setTimeout(function () {
            spinRoolet($('#slotC'), showRoolet3);

            var reelC = $('#rollerC');

            reelC.removeClass('on');

            var counterC = 0;
            var setIntervalIdC = setInterval(function () {
                counterC++;

                if (counterC === showRoolet3) {
                    $(reelC).attr('src', arr[iGift - 1].img);
                    clearInterval(setIntervalIdC);
                    //현재 이미지 보여주는 시점
                    $('#rollerC').removeClass('blur');
                    $('#rollerC').addClass('shake on');
                    $('#slotC').addClass('on');
                    $('#slotC').find('.list').css('visibility', 'hidden');
                    $('#rollerC').removeClass('top3');
                    bang($('#slotC'));
                    setTimeout(function(){
                        $('.triggerOn').hide();
                        $('.triggerOff').show();
                    },500)

                    setTimeout(function () {
                        $('.slotMachineStarting').removeClass('disabled');
                        $('.btn_package').css('display', '');
                        setTimeout(alert(arr[iGift - 1].title), 500)
                    }, 1000);

                    return;
                }
            }, 5);
        }, 500);

        /* 결과 */
        // 레이어팝업:btn확인
        // 팝업리셋
        $('.evtPop.build > div').hide();
        $('.evtPop.build .btn.close').hide();
        $('.btn.close').click(function () {
            $(this).parents('.evtPop').hide();
        });

    };

    // 회전 부분
    var spinRoolet = function(slotNum, eachSlot) {
        var findSlot = slotNum.find('.list');
        findSlot.css('visibility', 'visible');
        for (var i = 0; i < eachSlot / 15; i++) {
            var slotAfterAction = function () {
                var firstChild = findSlot.find('li:first-child');
                // 첫째 목록을 마지막으로 이동
                firstChild = $('li:first-child', findSlot);
                findSlot.append(firstChild);
                findSlot.css({ marginBottom: '0px' });
            };
            findSlot.animate(
                { marginBottom: '-145%' },
                150,
                'linear',
                slotAfterAction
            );
        }
    }

    // 슬롯 연속해서 돌릴시 리셋
    var resetSlot = function() {
        $('.evtPop').hide();
        $('.evtPop.build > div').hide();
        $('.evtPop.build .btn.close').hide();
    }

    // 폭죽태그 추가
    var bang = function(ele) {
        ele.append(
            "<div class='pyro'><div class='after'></div><div class='before'></div></div>"
        );
    }

</script>
<div class="evt_wrap">
    <!-- 이벤트 컨텐츠 //시작 -->
    <div class="evt_page bg">
        <div class="evt_con">
            <div class="none">
                하루 한번 플로린 코인으로 인게임 쿠폰획득! 자~ 드가자~
                [판매]
                2만원 이상 판매 완료 시 플로린 코인 1개 지급
                [구매]
                2만원 이상 구매 완료 시 플로린 코인 2개 지급
                [아이템]
                디오네의 축복 물약 * 10
                베나의 축복 주문서 * 10
                체력 증강의 주문서 * 10
                루멘의 완력 주문서 * 10
                공격형 마력탄 * 500
                파워존 24시간

                이번에도 베이가 다했다!
                전용 쿠폰팩 지급!
                KD 모바일 디오리진 전용 쿠폰팩
                100% 베이 패키지 받기

                DK 모바일 디오리진캐릭터 판매 수수료 0원! 100% 할인!!
            </div>



            <span class="date">이벤트 기간 : 2022.12.29 ~ 2023.2.3</span><!-- 이벤트 기간 -->
            <!-- 룰렛 //시작-->
            <div class="slot-machine">
                <div class="slot-container">
                    <div id="slotA" class="reels default">
                        <img id="rollerA" class="on" src="/resources/event/2022/1229_dk/images/gameItem_1.png" alt="" />
                        <ul class="list">
                            <li data-roll="4"></li>
                            <li data-roll="5"></li>
                            <li data-roll="6"></li>
                            <li data-roll="1"></li>
                            <li data-roll="2"></li>
                            <li data-roll="3"></li>
                        </ul>
                    </div>

                    <div id="slotB" class="reels default">
                        <img id="rollerB" class="on" src="/resources/event/2022/1229_dk/images/gameItem_2.png" alt="" />
                        <ul class="list">
                            <li data-roll="5"></li>
                            <li data-roll="6"></li>
                            <li data-roll="1"></li>
                            <li data-roll="2"></li>
                            <li data-roll="3"></li>
                            <li data-roll="4"></li>
                        </ul>
                    </div>

                    <div id="slotC" class="reels default">
                        <img id="rollerC" class="on" src="/resources/event/2022/1229_dk/images/gameItem_3.png" alt="" />
                        <ul class="list">
                            <li data-roll="6"></li>
                            <li data-roll="1"></li>
                            <li data-roll="2"></li>
                            <li data-roll="3"></li>
                            <li data-roll="4"></li>
                            <li data-roll="5"></li>
                        </ul>
                    </div>
                </div>
            </div>
            <span class="fCount" id="florin">999</span>
            <span class="triggerOff">
					<img src="/resources/event/2022/1229_dk/images/triggerOff.png" />
				</span>
            <span class="triggerOn">
					<img src="/resources/event/2022/1229_dk/images/triggerOn.png" />
				</span>
            <a href="javascript:;" class="slotMachineStarting" title="START" id="getSlotMachine"></a>
            <!-- 룰렛 //끝 -->

            <a href="javascript:;" class="btn_package" title="100% 베이 패키지 받기" id="bayPackage"></a>

            <a href="/evt/com/2021/0721_characterReward/characterReward" title="캐릭터 판매수수료 수수료0원 100% 할인" target="_blank" class="btn_discount"></a>
        </div>
    </div>

    <!-- 유의사항 -->
    <div class="evt_footer" style="background: #3f3a66; min-width: 1000px;">
        <div class="evt_inner">
            <div class="evt_notice_wrap">
                <strong class="tit_notice tit_box">이벤트 유의사항</strong>
                <div>
                    <ul class="list_notice">
                        <li>본 이벤트 경품으로 지급되는 게임 아이템은 거래가 불가능한 귀속 아이템입니다.</li>
                        <li>첫번째 이벤트의 경우 6가지 경품 중 1가지 경품만 하루 1번 랜덤 확률로 지급 가능합니다.</li>
                        <li>본 이벤트를 통해 지급되는 아이템은 게임 내 [메뉴 > 설정 > 기타  > 쿠폰등록]을 통해 이용 가능합니다.</li>
                        <li>본 이벤트 경품으로 지급되는 아이템은 준비된 경품 소진 시까지 진행 됩니다.</li>
                        <li>두번째 이벤트의 경우 참여 시 지급되는 경품은 ID당 1회씩 지급 가능합니다.</li>
                        <li>비정상적인 참여 및 악용 시 지급된 경품 회수 등 불이익이 발생할 수 있습니다.</li>
                        <li>본 이벤트는 당사의 사정에 따라 사전 고지 없이 변경 또는 조기 종료될 수 있습니다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="evt_copyright tc" style="background: #2b2650;">
            <p>© itemBay Co., Ltd. All Rights Reserved.</p>
        </div>
    </div>

    <!-- 플로팅 메뉴 -->
    <div href="/item/sell/itemSellList?iGameSeq=3930&iGameServerSeq=0&tiItemType=4" class="btn_scroll" title="사이드플롯메뉴" target="_blank">
        <a href="https://app.adjust.com/eze0lin?redirect=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.ntrance.dkmobile_2%26hl%3Dko" title="게임 설치" target="_blank" class="btn_install"></a>
        <a href="/item/sell/itemSellList?iGameSeq=3920&iGameServerSeq=0&tiItemType=4" title="물품리스트" target="_blank" class="btn_list"></a>
        <a href="https://game.naver.com/lounge/DK_Mobile_THE_ORIGIN/home" title="공식 커뮤니티" target="_blank" class="btn_community"></a>
    </div>

    <!-- 이벤트 컨텐츠 //끝 -->
</div>