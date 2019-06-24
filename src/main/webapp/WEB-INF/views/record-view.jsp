<%--
  Created by IntelliJ IDEA.
  User: parkseongho
  Date: 2019-06-22
  Time: 07:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>2019 한중 미드아마추어 국가대항전</title>
    <META http-equiv="Expires" content="-1">
    <META http-equiv="Pragma" content="no-cache">
    <META http-equiv="Cache-Control" content="No-Cache">
    <link rel="stylesheet" href="/css/common.css?v=2">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/record-view.js"></script>
</head>
<script language="JavaScript">
    $(document).ready(function() {

        loadData('test');

        // 저장된 페이지가 존재하면 해당 페이지로 이동한다.
        var savedPage = sessionStorage.getItem('page');
        if (typeof savedPage != 'undefined' && savedPage != null)
        {
            savedPage = parseInt(savedPage);
            $('#slider1').carousel(savedPage);

            $('.circle-active').removeClass('circle-active').addClass('circle');
            $('#pager-' + (savedPage+1)).removeClass('circle').addClass('circle-active');
        }
        else
        {
            // 오늘 날짜를 얻는다. 6월 28일이면 2페이지로 이동한다.
            var today = new Date();
            var mm = today.getMonth()+1;
            var dd = today.getDate();

            if (mm == 6 && dd == 28)
            {
                $('#slider1').carousel(1);

                $('.circle-active').removeClass('circle-active').addClass('circle');
                $('#pager-2').removeClass('circle').addClass('circle-active');
            }
        }

        $('#slider1').on('slid.bs.carousel', function (event) {
            var nextactiveslide = $(event.relatedTarget).index() + 1;

            $('.circle-active').removeClass('circle-active').addClass('circle');
            $('#pager-' + nextactiveslide).removeClass('circle').addClass('circle-active');

            sessionStorage.setItem('page', nextactiveslide - 1);
        });
    })
</script>
<body>
<div class="container">
    <div class="content">
        <div class="banner">
            <div style="display: table; margin: 0 auto 0 auto">
                <div class="row">
                    <div class="cell">
                        <h3>2019 한중 미드아마추어 국가대항전</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="cell">
                        <h3>Korea - China Mid-Amateur National Championship</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="cell" style="text-align: right">
                        <h4 class="right">2019.06.27~28 나인브릿지(제주)</h4>
                    </div>
                </div>
            </div>
        </div>
        <div id="slider1" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="record-wrap carousel-item active">
                    <div class="round-info">
                        <div class="round">
                            <span>Round 1 - </span>Single Stroke Play
                        </div>
                        <div class="round-date">
                            <i>2019.06.27.WED</i>
                        </div>
                    </div>

                    <table class="table-record" id="table-record">
                        <tr>
                            <td style="width: 20px">Group</td>
                            <td style="width: 30%">Korea Team</td>
                            <td style="width: 10%"></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td style="width: 10%"></td>
                            <td style="width: 30%">China Team</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>



                <div class="record-wrap carousel-item">
                    <div class="round-info">
                        <div class="round">
                            <span>Round 2 - </span>Match Play
                        </div>
                        <div class="round-date">
                            <i>2019.06.28.THU</i>
                        </div>
                    </div>

                    <table class="table-record" id="table-record2">
                        <tr>
                            <td style="width: 20px">Group</td>
                            <td style="width: 30%">Korea Team</td>
                            <td style="width: 10%"></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td style="width: 10%"></td>
                            <td style="width: 30%">China Team</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td></td>
                            <td></td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <!-- end of carousel-item -->
                <div class="record-wrap carousel-item">
                    <div class="round-info">
                        <div class="round">
                            <span>Final Result</span>
                        </div>
                    </div>

                    <table class="table-result" id="table-final-record">
                        <thead>
                        <tr>
                            <td style="width: 20px">Team</td>
                            <td style="width: 30%">Korea Team</td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td style="width: 30%">China Team</td>
                        </tr>
                        </thead>
                        <tr>
                            <td>Round1 - Single Stroke Play</td>
                            <td>- Point</td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td>- Point</td>
                        </tr>
                        <tr>
                            <td>Round2 - Match Play</td>
                            <td>- Point</td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td>- Point</td>
                        </tr>
                        <tr>
                            <td>Total Point</td>
                            <td>- Point</td>
                            <td class="vs-right" style="padding: 0; text-align: right">V</td>
                            <td class="vs-left" style="padding: 0; text-align: left">S</td>
                            <td>- Point</td>
                        </tr>
                    </table>

                    <div class="round-info">
                        <div class="round">
                            <span>MVP</span>
                        </div>
                    </div>

                    <div style="display: table; width: 100%">
                        <div style="display: table-row">
                            <div style="display: table-cell; width: 132px;" class="mvp-picture">
                                <img src="images/default-user.png" id="user-photo" style="width: 130px; height: 130px; vertical-align: top">
                            </div>
                            <div style="display: table-cell; width: 20px"></div>
                            <div style="display: table-cell; margin-left: 10px">
                                <table id="table-mvp" class="table-mvp">
                                    <thead>
                                        <tr>
                                            <td style="width: 60%; height: 44px"></td>
                                            <td style="width: 40%"></td>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td>Round 1 - Single stroke play</td>
                                        <td>-</td>
                                    </tr>
                                    <tr>
                                        <td>Round 2 - Match Play</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- end of carousel-item -->
                <a class="carousel-control-prev" href="#slider1" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true" style="outline: black"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#slider1" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true" style="outline: black"></span>
                    <span class="sr-only">Next</span>
                </a>

            </div>
            <!-- end of carousel-inner -->
        </div>
        <div class="pager">
            <div id="pager-1" class="circle-active"></div>
            <div id="pager-2" class="circle"></div>
            <div id="pager-3" class="circle"></div>
        </div>
    </div>
</div>
</body>
</html>
