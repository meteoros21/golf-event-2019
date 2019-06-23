var gameInfo = null;
var gameId = '2019kor-china';
var roundTr = '<tr>\n' +
    '<td>1</td>\n' +
    '<td><input type="text" name="player1" style="text-align: left"></td>\n' +
    '<td><input type="text" name="point1" style="width:30px"></td>\n' +
    '<td style="width:20px">VS</td>\n' +
    '<td><input type="text" name="point2" style="width:30px"></td>\n' +
    '<td><input type="text" name="player2" style="text-align: left"></td>\n' +
    '<td><input type="text" name="score" style="width:60px"></td>\n' +
    '<td><input type="text" name="time" style="width:60px"></td>\n' +
    '<td><select name="status" class="form-controll">\n' +
    '    <option value="0">Standby</option>\n' +
    '    <option value="1">Playing</option>\n' +
    '    <option value="2">Finished</option></select>\n' +
    '</td>\n' +
    '</tr>';

function loadData()
{
    $.ajax({
        url: '/api/getData?gameId=' + gameId,
        method: 'GET',
        dataType: 'text',
        error: function(jqXHR, textStatus, error) {
            alert (error);
        },
        success: function(data, textStatus, jqXHR) {
            gameInfo = JSON.parse(data);
            showGameInfo();
        }
    });
}

function saveData()
{
    $.ajax({
        url: '/api/setData',
        method: 'POST',
        data: {'gameId': gameId, 'data': JSON.stringify(gameInfo)},
        dataType: 'json',
        error: function (jqXHR, textStatus, error) {
            alert(error);
        },
        success: function (data, textStatus, jqXHR) {
            alert('데이터가 성공적으로 저장되었습니다.');
        }
    })
}

function showMvp()
{
    var form = document.forms['form-mvp'];
    var mvpData = gameInfo.mvp;
    if (typeof mvpData == 'undefined' || mvpData == null)
        return;

    $('#user-photo').attr('src', mvpData.photoUrl);
    $(form).find('input[name=player]')[0].value = mvpData.player;
    var sel = $(form).find('select[name=teamNo]')[0];
    $(sel).val(mvpData.teamNo);

    for (var i = 0; i < 2; i++)
    {
        var data = mvpData.records[i];

        $(form).find('input[name=point]')[i].value = data.point;
        $(form).find('input[name=rank]')[i].value = data.rank;
    }
}

function showFinalData()
{
    var form = document.forms['form-final'];
    if (typeof gameInfo.finalRecord == 'undefined' || gameInfo.finalRecord == null)
        return;

    for (var i = 0; i < gameInfo.finalRecord.length; i++)
    {
        var data = gameInfo.finalRecord[i];

        $(form).find('input[name=point1]')[i].value = data.point1;
        $(form).find('input[name=point2]')[i].value = data.point2;
    }
}

function showRoundData(table, dataList, form)
{
    if (table.rows.length != 13)
    {
        for (var i = 0; i < 12; i++)
            $(table).append($(roundTr));

        for (var i = 1; i <= 12; i++)
            table.rows[i].cells[0].innerText = (i);
    }

    if (typeof dataList == 'undefined' || dataList == null)
        return;

    for (var i = 0; i < dataList.length; i++)
    {
        var data = dataList[i];
        form.find('input[name=player1]')[i].value = data.player1;
        form.find('input[name=player2]')[i].value = data.player2;
        form.find('input[name=point1]')[i].value = data.point1;
        form.find('input[name=point2]')[i].value = data.point2;
        form.find('input[name=score]')[i].value = data.score;
        form.find('input[name=time]')[i].value = data.time;

        var sel = $(form.find('select[name=status]')[i]);
        sel.val(data.status);
    }
}

function showGameInfo()
{
    if (gameInfo == null)
        return;

    var form1 = $(document.forms['form-round1']);
    var form2 = $(document.forms['form-round2']);
    showRoundData($('#table-record')[0], gameInfo.dataList1, form1);
    showRoundData($('#table-record2')[0], gameInfo.dataList2, form2);

    showFinalData();
    showMvp();
}

function buildRoundRecord(no)
{
    var form = $(document.forms['form-round' + no]);
    var roundRecords = [];

    for (var i = 0; i < 12; i++)
    {
        var record = {};
        record['no'] = (i+1);
        record['player1'] = form.find('input[name=player1]')[i].value;
        record['player2'] = form.find('input[name=player2]')[i].value;
        record['point1'] = form.find('input[name=point1]')[i].value;
        record['point2'] = form.find('input[name=point2]')[i].value;
        record['score'] = form.find('input[name=score]')[i].value;
        record['time'] = form.find('input[name=time]')[i].value;

        var sel = $(form.find('select[name=status]')[i]);
        record['status'] = sel.val();

        roundRecords.push(record);
    }

    if (no == 1)
        gameInfo['dataList1'] = roundRecords;
    else if (no == 2)
        gameInfo['dataList2'] = roundRecords;
}

function buildFinalRecord()
{
    var form = $(document.forms['form-final']);
    var records = [];

    for (var i = 0; i < 3; i++)
    {
        var record = {};

        record['point1'] = form.find('input[name=point1]')[i].value;
        record['point2'] = form.find('input[name=point2]')[i].value;

        var point1 = parseFloat(record['point1']);
        var point2 = parseFloat(record['point2']);

        var winTeam = 0;

        if (isNaN(point1) == false && isNaN(point2))
        {
            if (point1 > point2)
                winTeam = 1;
            else if (point1 < point2)
                winTeam = 2;
        }
        record['winTeam'] = winTeam;
        records.push(record);
    }

    gameInfo['finalRecord'] = records;
}

function buildMvpData()
{
    var form = $(document.forms['form-mvp']);
    var mvpData = {};

    mvpData['teamNo'] = $('#mvp-team').val();
    mvpData['player'] = form.find('input[name=player]')[0].value;
    mvpData['records'] = new Array();
    mvpData['photoUrl'] = $('#user-photo').attr('src');

    if (mvpData['teamNo'] == 0)
        mvpData['teamName'] = '';
    else if (mvpData['teamNo'] == 1)
        mvpData['teamName'] = 'Korea Team';
    else if (mvpData['teamNo'] == 2)
        mvpData['teamName'] = 'China Team';
    else
        mvpData['teamName'] = '';

    for (var i = 0; i < 2; i++)
    {
        var record = {};
        record['point'] = form.find('input[name=point]')[i].value;
        record['rank'] = form.find('input[name=rank]')[i].value;

        mvpData['records'].push(record);
    }

    gameInfo['mvp'] = mvpData;
}

function photoChanged()
{
    var form = document.forms['form-photo'];
    var formData = new FormData();
    formData.append("photoFile", form['user-photo-file'].files[0]);

    $.ajax({
        url: '/api/uploadPhoto',
        method: 'POST',
        data: formData,
        dataType: 'json',
        contentType: false,
        processData: false,
        error: function (jqXHR, textStatus, error) {
            alert('error');
        },
        success: function (data, textStatus, jqXHR) {
            alert('success');

            $('#user-photo').attr('src', '/uploaded/' + data['photo-url']);
        }
    });
}
