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
    <script src="js/record-register.js"></script>
</head>
<script language="JavaScript">
    $(document).ready(function() {

        loadData('test');

        $('#slider1').on('slid.bs.carousel', function (event) {
            var nextactiveslide = $(event.relatedTarget).index() + 1;

            $('.circle-active').removeClass('circle-active').addClass('circle');
            $('#pager-' + nextactiveslide).removeClass('circle').addClass('circle-active');
        });

        $('.button-save').click(function () {
            buildRoundRecord(1);
            buildRoundRecord(2);
            buildFinalRecord();
            buildMvpData();

            saveData(gameId, gameInfo);
        });

        $('#user-photo').click(function () {
            $('#user-photo-file').click();
        });

        $('#user-photo-file').on('change', function () {
            photoChanged();
        })
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

                    <form name="form-round1" style="width: 100%">
                    <table class="table-record" id="table-record">
                        <tr>
                            <td style="width: 20px">Group</td>
                            <td>Korea Team</td>
                            <td style="width: 20px"></td>
                            <td style="width: 20px">VS</td>
                            <td style="width: 20px"></td>
                            <td>China Team</td>
                            <td style="width: 60px">Score</td>
                            <td style="width: 100px">Time</td>
                            <td style="width: 100px">Status</td>
                        </tr>
                        <%--<tr>--%>
                            <%--<td>1</td>--%>
                            <%--<td><input type="text" name="player1" class="form-controll"></td>--%>
                            <%--<td><input type="text" name="point1" class="form-controll"></td>--%>
                            <%--<td>VS</td>--%>
                            <%--<td><input type="text" name="point2" class="form-controll"></td>--%>
                            <%--<td><input type="text" name="player2" class="form-controll"></td>--%>
                            <%--<td><input type="text" name="score" class="form-controll"></td>--%>
                            <%--<td><input type="text" name="time" class="form-controll"></td>--%>
                            <%--<td><select name="status" class="form-controll">--%>
                                <%--<option value="0">Standby</option>--%>
                                <%--<option value="1">Playing</option>--%>
                                <%--<option value="2">Finished</option></select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>

                    </table>
                    </form>
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

                    <form name="form-round2">
                    <table class="table-record" id="table-record2">
                        <tr>
                            <td style="width: 20px">Group</td>
                            <td style="width: 100px">Korea Team</td>
                            <td style="width: 20px"></td>
                            <td style="width: 20px">VS</td>
                            <td style="width: 20px"></td>
                            <td style="width: 100px">China Team</td>
                            <td style="width: 60px">Score</td>
                            <td style="width: 100px">Time</td>
                            <td style="width: 100px">Status</td>
                        </tr>
                    </table>
                    </form>
                </div>
                <!-- end of carousel-item -->

                <div class="record-wrap carousel-item">
                    <div class="round-info">
                        <div class="round">
                            <span>Final Result</span>
                        </div>
                    </div>

                    <form name="form-final">
                    <table class="table-result" id="table-final-record">
                        <thead>
                        <tr>
                            <td style="width: 20px">Team</td>
                            <td style="width: 30%">Korea Team</td>
                            <td>VS</td>
                            <td style="width: 30%">China Team</td>
                        </tr>
                        </thead>
                        <tr>
                            <td>Round1 - Single Stroke Play</td>
                            <td><input type="text" name="point1"> Point</td>
                            <td>VS</td>
                            <td><input type="text" name="point2"> Point</td>
                        </tr>
                        <tr>
                            <td>Round2 - Match Play</td>
                            <td><input type="text" name="point1"> Point</td>
                            <td>VS</td>
                            <td><input type="text" name="point2"> Point</td>
                        </tr>
                        <tr>
                            <td>Total Point</td>
                            <td><input type="text" name="point1"> Point</td>
                            <td>VS</td>
                            <td><input type="text" name="point2"> Point</td>
                        </tr>
                    </table>
                    </form>

                    <div class="round-info">
                        <div class="round">
                            <span>MVP</span>
                        </div>
                    </div>

                    <form name="form-mvp">
                    <div style="display: table; width: 100%">
                        <div style="display: table-row; vertical-align: middle">
                            <div style="display: table-cell; width: 155px; vertical-align: middle; text-align: center" class="mvp-picture">
                                <img id="user-photo" src="/images/default-user.png" style="width: 130px; height: 130px;">
                            </div>
                            <div style="display: table-cell; width: 20px"></div>
                            <div style="display: table-cell; margin-left: 10px">
                                <table id="table-mvp" class="table-mvp">
                                    <thead>
                                    <tr>
                                        <td width="46%"><select id="mvp-team" name="teamNo" style="width: 200px; text-align: center">
                                            <option value="0">Select Team</option>
                                            <option value="1">Korea Team</option>
                                            <option value="2">China Team</option>
                                        </select></td>
                                        <td colspan="2"><input type="text" placeholder="Player Name" name="player" style="width: 200px; text-align: left"></td>
                                    </tr>
                                    </thead>
                                    <tr>
                                        <td>Round 1 - Single stroke play</td>
                                        <td style="width: 27%"><input type="text" name="point"></td>
                                        <td><input type="text" name="rank"></td>
                                    </tr>
                                    <tr>
                                        <td>Round 2 - Match Play</td>
                                        <td><input type="text" name="point"></td>
                                        <td><input type="text" name="rank"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    </form>
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
        <div style="width: 100%; text-align: right; padding-right: 100px">
            <button type="button" class="btn btn-primary button-save">Save</button>
        </div>
        <div class="pager">
            <div id="pager-1" class="circle-active"></div>
            <div id="pager-2" class="circle"></div>
            <div id="pager-3" class="circle"></div>
        </div>
        <form name="form-photo" enctype="multipart/form-data">
            <input type="file" id="user-photo-file" name="user-photo-file" style="display: none" onchange="photoChanged">
        </form>
    </div>
</div>
</body>
</html>
