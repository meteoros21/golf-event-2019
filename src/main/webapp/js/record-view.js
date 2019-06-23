var gameId = '2019kor-china';

function loadData()
{
    $.ajax({
        url: 'http://localhost:8080/api/getData?gameId=' + gameId,
        method: 'GET',
        dataType: 'text',
        error: function(jqXHR, textStatus, error) {
            alert (error);
        },
        success: function(data, textStatus, jqXHR) {
            // data = data.replace(/\\n/g, "\\n")
            //     .replace(/\\'/g, "\\'")
            //     .replace(/\\"/g, '\\"')
            //     .replace(/\\&/g, "\\&")
            //     .replace(/\\r/g, "\\r")
            //     .replace(/\\t/g, "\\t")
            //     .replace(/\\b/g, "\\b")
            //     .replace(/\\f/g, "\\f");
            // // remove non-printable and other non-valid JSON chars
            // s = data.replace(/[\u0000-\u0019]+/g,"");
            gameInfo = JSON.parse(data);

            //gameInfo = JSON.parse(data);
            showGameInfo();
        }
    });
}

gameInfo = {
    dataList1: [
        {no: 1, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 2, time: '10:00'},
        {no: 2, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 2, time: '10:10'},
        {no: 3, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 2, time: '10:20'},
        {no: 4, player1: 'Ahn Jae Seok', point1: '86', player2: 'Zhi Ruo', point2: '86', status: 2, time: '10:30'},
        {no: 5, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 1, time: '10:40'},
        {no: 6, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 1, time: '10:50'},
        {no: 7, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 1, time: '11:00'},
        {no: 8, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 1, time: '11:10'},
        {no: 9, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 1, time: '11:20'},
        {no: 10, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 1, time: '11:30'},
        {no: 11, player1: 'Kang David', point1: '-', player2: 'Yu Yan', point2: '-', status: 1, time: '11:40'},
        {no: 12, player1: 'Ahn Jeff', point1: '-', player2: 'Chai Lung', point2: '-', status: 0, time: '11:50'},
    ],
    dataList2: [
        {no: 1, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 2, time: '10:00'},
        {no: 2, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 2, time: '10:10'},
        {no: 3, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 2, time: '10:20'},
        {no: 4, player1: 'Ahn Jae Seok', point1: '86', player2: 'Zhi Ruo', point2: '86', status: 2, time: '10:30'},
        {no: 5, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 1, time: '10:40'},
        {no: 6, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 1, time: '10:50'},
        {no: 7, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 1, time: '11:00'},
        {no: 8, player1: 'Kang David', point1: '81', player2: 'Yu Yan', point2: '79', status: 1, time: '11:10'},
        {no: 9, player1: 'Ahn Jeff', point1: '86', player2: 'Chai Lung', point2: '85', status: 1, time: '11:20'},
        {no: 10, player1: 'Ahn Jae Seok', point1: '78', player2: 'Zhi Ruo', point2: '86', status: 1, time: '11:30'},
        {no: 11, player1: 'Kang David', point1: '-', player2: 'Yu Yan', point2: '-', status: 1, time: '11:40'},
        {no: 12, player1: 'Ahn Jeff', point1: '-', player2: 'Chai Lung', point2: '-', status: 0, time: '11:50'},
    ],
    finalRecord: [
        {point1: 7.5, point2: 4.5, winTeam: 1},
        {point1: 6.0, point2: 7.1, winTeam: 2},
        {point1: 14.5, point2: 11.6, winTeam: 1}
    ],
    mvp: {
        teamNo: 2,
        teamName: 'Korea Team',
        player: 'Ahn Jae Seock',
        records: [
            {point: '79', rank: 'WIN2'},
            {point: '6 & 3', rank: 'WIN2'}
        ]
    }
}

function showMvp()
{
    var mvpData = gameInfo.mvp;
    if (typeof mvpData == 'undefined' || mvpData == null)
        return;

    var table = $('#table-mvp')[0];

    table.rows[0].cells[0].innerText = mvpData.teamName;
    table.rows[0].cells[1].innerText = mvpData.player;

    $('#user-photo').attr('src', mvpData.photoUrl);

    if (mvpData.teamNo == 1)
    {
        for (var j = 0; j < 2; j++)
        {
            $(table.rows[0].cells[j]).css('color', 'white');
            $(table.rows[0].cells[j]).css('background-color', 'blue');
        }
    }
    else if (mvpData.teamNo == 2)
    {
        for (var j = 0; j < 2; j++)
        {
            $(table.rows[0].cells[j]).css('color', 'white');
            $(table.rows[0].cells[j]).css('background-color', 'red');
        }
    }

    for (var i = 0; i < 2; i++)
    {
        var data = mvpData.records[i];

        table.rows[i+1].cells[1].innerText = data.point;
        table.rows[i+1].cells[2].innerText = data.rank;

    }
}

function showFinalData() {
    var table = $('#table-final-record')[0];

    for (var i = 0; i < gameInfo.finalRecord.length; i++)
    {
        var row = table.rows[i+1];
        var data = gameInfo.finalRecord[i];
        if (data.winTeam == 1)
        {
            for (var j = 1; j <= 2; j++) {
                $(row.cells[j]).css('color', 'white');
                $(row.cells[j]).css('background-color', 'blue');
            }
            for (var j = 3; j <= 4; j++) {
                $(row.cells[j]).css('color', 'black');
                $(row.cells[j]).css('background-color', 'white');
            }
        }
        else if (data.winTeam == 2)
        {
            for (var j = 1; j <= 2; j++) {
                $(row.cells[j]).css('color', 'black');
                $(row.cells[j]).css('background-color', 'white');
            }
            for (var j = 3; j <= 4; j++) {
                $(row.cells[j]).css('color', 'white');
                $(row.cells[j]).css('background-color', 'red');
            }
        }
        else
        {
            for (var j = 1; j <= 4; j++) {
                $(row.cells[j]).css('color', 'black');
                $(row.cells[j]).css('background-color', 'white');
            }
        }

        row.cells[1].innerText = (data.point1 == '' ? '-' : data.point1) + ' Point';
        row.cells[4].innerText = (data.point2 == '' ? '-' : data.point2) + ' Point';

        if (i == 2)
        {
            row = table.rows[0];
            if (data.winTeam == 1)
            {
                for (var j = 1; j <= 2; j++) {
                    $(row.cells[j]).css('color', 'white');
                    $(row.cells[j]).css('background-color', 'blue');
                }
                for (var j = 3; j <= 4; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
            }
            else if (data.winTeam == 2)
            {
                for (var j = 1; j <= 2; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
                for (var j = 3; j <= 4; j++) {
                    $(row.cells[j]).css('color', 'white');
                    $(row.cells[j]).css('background-color', 'red');
                }
            }
            else
            {
                for (var j = 1; j <= 4; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
            }
        }

    }
}

function showData(table, dataList, month, day)
{
    //var table = $('#table-record')[0];
    for (var i = 0; i < dataList.length; i++)
    {
        var data = dataList[i];
        var rowIdx = parseInt(data.no);

        var row = table.rows[rowIdx];
        row.cells[1].innerText = data.player1;
        row.cells[2].innerText = data.point1;
        row.cells[6].innerText = data.player2;
        row.cells[5].innerText = data.point2;
        if (data.status == 0)
        {
            for (var j = 1; j <= 3; j++) {
                $(row.cells[j]).css('color', 'black');
                $(row.cells[j]).css('background-color', '#9fc6e7');
            }

            for (var j = 4; j <= 6; j++) {
                $(row.cells[j]).css('color', 'black');
                $(row.cells[j]).css('background-color', '#e9999a');
            }

            var t = data.time.split(':');

            row.cells[3].innerHTML = month + '.<br/>' + (typeof t[0] == 'undefined' ? '&nbsp;' : t[0]) + ':';
            row.cells[4].innerHTML = day + '<br/>' + (typeof t[1] == 'undefined' ? '&nbsp' : t[1]);

        }
        else if (data.status == 1)
        {
            for (var j = 1; j <= 3; j++) {
                $(row.cells[j]).css('color', 'white');
                $(row.cells[j]).css('background-color', 'blue');
                $(row.cells[j]).css('font-weight', 'bold');
            }

            for (var j = 4; j <= 6; j++) {
                $(row.cells[j]).css('color', 'white');
                $(row.cells[j]).css('background-color', 'red');
                $(row.cells[j]).css('font-weight', 'bold');
            }

            row.cells[3].innerText = 'V';
            row.cells[4].innerText = 'S';
        }
        else
        {
            var p1 = parseInt(data.point1);
            var p2 = parseInt(data.point2);

            if (p1 > p2)
            {
                for (var j = 1; j <= 3; j++) {
                    $(row.cells[j]).css('color', 'white');
                    $(row.cells[j]).css('background-color', 'blue');
                    $(row.cells[j]).css('font-weight', 'bold');
                }

                for (var j = 4; j <= 6; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
            }
            else if (p1 < p2)
            {
                for (var j = 1; j <= 3; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }

                for (var j = 4; j <= 6; j++) {
                    $(row.cells[j]).css('color', 'white');
                    $(row.cells[j]).css('background-color', 'red');
                    $(row.cells[j]).css('font-weight', 'bold');
                }
            }
            else
            {
                for (var j = 1; j <= 3; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
                for (var j = 4; j <= 6; j++) {
                    $(row.cells[j]).css('color', 'black');
                    $(row.cells[j]).css('background-color', 'white');
                }
            }

            row.cells[3].innerText = 'V';
            row.cells[4].innerText = 'S';
        }
    }
}

function showGameInfo()
{
    showData($('#table-record')[0], gameInfo.dataList1, '06', '27');
    showData($('#table-record2')[0], gameInfo.dataList2, '06', '28');

    showFinalData();
    showMvp();
}
